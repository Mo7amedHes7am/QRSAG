import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit_base.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:vibration/vibration.dart';

mixin ScanMixin on QrCubitBase {
  Future<void> scanQrCode({required String scannedQrCode}) async {
    if (isClosed) return;
    try {
      scanLocked = true;
      emit(QrInitialState());

      final cache = CacheManager.getGlobalData();

      if (cache.beep) {
        AudioPlayer audioPlayer = AudioPlayer();
        await audioPlayer.play(AssetSource('Audios/beep.mp3'));
      }
      if (cache.vibrate) {
        bool? hasVibrator = await Vibration.hasVibrator();
        if (hasVibrator == true) {
          Vibration.vibrate();
        } else {
          debugPrint(LocaleKeys.qr_no_vibration_support.tr());
        }
      }

      if (!isClosed) emit(QrLoadingState());

      final historyData = await CacheManager.saveToHistoryCache(
        data: scannedQrCode,
        isScanned: true,
        type: QrType.data,
      );
      scanLocked = false;
      if (!isClosed) emit(QrScannedState(historyData: historyData));
    } catch (e) {
      scanLocked = false;
      if (!isClosed) emit(QrErrorState(LocaleKeys.qr_error_try_again.tr()));
    }
  }

  Future<Uint8List> _captureBoundary(GlobalKey repaintKey) async {
    final boundary =
        repaintKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      throw StateError(LocaleKeys.qr_nothing_to_capture.tr());
    }
    final image = await boundary.toImage(pixelRatio: 5);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw StateError(LocaleKeys.qr_failed_to_encode.tr());
    }
    return byteData.buffer.asUint8List();
  }

  @override
  Future<void> shareQrCode({
    required GlobalKey repaintKey,
    required String qrData,
  }) async {
    if (isClosed) return;
    emit(QrActionLoadingState());
    try {
      final pngBytes = await _captureBoundary(repaintKey);

      final directory = await getTemporaryDirectory();
      final uuid = const Uuid();
      final tempFile = File(
        '${directory.path}/qr_code_${uuid.v1().replaceAll("-", "")}.png',
      );
      await tempFile.writeAsBytes(pngBytes);

      await Share.shareXFiles([
        XFile(tempFile.path),
      ], text: "${LocaleKeys.qr_share_qr_text.tr()} $qrData");

      await tempFile.delete();
      if (!isClosed) emit(QrShareSuccessState());
    } catch (e) {
      if (!isClosed) emit(QrActionErrorState(message: e.toString()));
    }
  }

  @override
  Future<void> saveQrCode({required GlobalKey repaintKey}) async {
    if (isClosed) return;
    emit(QrActionLoadingState());
    try {
      final pngBytes = await _captureBoundary(repaintKey);

      final hasAccess = await Gal.hasAccess();
      if (!hasAccess) {
        final granted = await Gal.requestAccess();
        if (!granted) {
          if (!isClosed) {
            emit(
              QrActionErrorState(
                message: LocaleKeys.qr_storage_permission_denied.tr(),
              ),
            );
          }
          return;
        }
      }

      final directory = await getTemporaryDirectory();
      final uuid = const Uuid();
      final fileName = '${uuid.v1().replaceAll("-", "")}.png';
      final tempFile = File('${directory.path}/$fileName');
      await tempFile.writeAsBytes(pngBytes);

      await Gal.putImage(tempFile.path, album: 'ExaScanner');
      await tempFile.delete();

      if (!isClosed) {
        emit(QrSaveSuccessState(path: fileName));
      }
    } on GalException catch (e) {
      if (!isClosed) {
        emit(QrActionErrorState(message: e.type.message));
      }
    } catch (e) {
      if (!isClosed) emit(QrActionErrorState(message: e.toString()));
    }
  }
}
