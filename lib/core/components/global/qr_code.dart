import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';

Widget QRCodeBox({
  GlobalKey? repaintKey,
  required String imgurl,
  required String data,
  required int size,
}) {
  return FutureBuilder<MemoryImage>(
    future: svgToImageProvider(imgurl, color: appColors.primary, size: size.sp),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return SizedBox(
          width: size.sp,
          height: size.sp,
          child: Center(
            child: CircularProgressIndicator(color: appColors.primary),
          ),
        );
      }

      if (repaintKey != null) {
        return RepaintBoundary(
          key: repaintKey,
          child: _qrCodeWidget(
            size: size,
            data: data,
            image: snapshot.data!,
            smallsize: false,
          ),
        );
      } else {
        return _qrCodeWidget(
          size: size,
          data: data,
          image: snapshot.data!,
          smallsize: true,
        );
      }
    },
  );
}

_qrCodeWidget({
  required int size,
  required String data,
  required ImageProvider image,
  required bool smallsize,
}) {
  return Container(
    width: size.sp,
    height: size.sp,
    padding: EdgeInsets.all(smallsize ? 2.sp : 10.sp),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.r),
      color: Colors.white,
      border: Border.all(
        color: appColors.primary,
        width: smallsize ? 1.sp : 4.sp,
      ),
    ),
    child: PrettyQrView.data(
      data: data,
      decoration: PrettyQrDecoration(
        image: PrettyQrDecorationImage(
          image: image,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(appColors.primary, BlendMode.srcIn),
        ),
      ),
    ),
  );
}
