import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

String convertArabicToEnglish(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < arabic.length; i++) {
    input = input.replaceAll(arabic[i], english[i]);
  }
  return input;
}

bool validatePhoneNumber(String phoneNumber, String countryCode) {
  try {
    final parsedNumber = PhoneNumber.parse(
      phoneNumber,
      callerCountry: IsoCode.fromJson(
        CountryCode.fromDialCode(countryCode).code!,
      ),
    );
    return parsedNumber.isValid();
  } catch (e) {
    return false;
  }
}

String getLocaleFont() {
  return CacheManager.getGlobalData().language == 'ar' ? 'Zain' : 'Helvetica';
}

bool hasURLs(String text) {
  final regex = RegExp(r'^(https?|ftp)://[^\s/$.?#].[^\s]*$');
  return (regex.hasMatch(text));
}

void showToast(String message, {bool isError = false}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: isError ? appColors.failed : appColors.primary,
    textColor: appColors.background,
    fontSize: 16.sp,
  );
}

Future<MemoryImage> svgToImageProvider(
  String assetPath, {
  required Color color,
  double size = 200,
}) async {
  final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetPath), null);

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  final paint = Paint()..colorFilter = ColorFilter.mode(color, BlendMode.srcIn);

  canvas.saveLayer(Rect.fromLTWH(0, 0, size, size), paint);

  final scale = size / pictureInfo.size.width;
  canvas.scale(scale, scale);
  canvas.drawPicture(pictureInfo.picture);

  canvas.restore();

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.toInt(), size.toInt());

  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final bytes = byteData!.buffer.asUint8List();

  picture.dispose();
  image.dispose();
  pictureInfo.picture.dispose();

  return MemoryImage(bytes);
}
