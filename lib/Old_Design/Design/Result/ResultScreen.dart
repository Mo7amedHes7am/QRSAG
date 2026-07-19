// import 'dart:io';
// import 'dart:ui';
//
// import 'package:encrypt_decrypt_plus/encrypt_decrypt/xor.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/HistoryModel.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/URLMessage.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/formatter.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:uuid/uuid.dart';
//
// late HistoryModel qr;
// late bool hasUrls, _isloading;
// GlobalKey _globalKey = GlobalKey();
//
// class ResultScreen extends StatefulWidget {
//   ResultScreen({required HistoryModel result}) {
//     qr = result;
//   }
//
//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }
//
// class _ResultScreenState extends State<ResultScreen> {
//   @override
//   void initState() {
//     Formatter formatter = Formatter();
//     hasUrls = formatter.hasURLs(qr.data);
//     _isloading = false;
//     super.initState();
//   }
//
//   Future<void> _shareQRCode() async {
//     setState(() {
//       _isloading = true;
//     });
//     try {
//       RenderRepaintBoundary boundary = _globalKey.currentContext
//           ?.findRenderObject() as RenderRepaintBoundary;
//
//       var image = await boundary.toImage(pixelRatio: 10.sp);
//       ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();
//
//       final directory = await getTemporaryDirectory();
//       var uuid = Uuid();
//
//       final tempFile = File(
//           '${directory.path}/qr_code_${uuid.v1().replaceAll("-", "")}.png');
//
//       await tempFile.writeAsBytes(pngBytes);
//
//       final xFile = XFile(tempFile.path);
//
//       await Share.shareXFiles([xFile],
//           text: "Check out this QR code! : ${qr.data}");
//
//       await tempFile.delete();
//     } catch (e) {
//       Fluttertoast.showToast(
//           msg: 'Error: $e',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: CupertinoColors.destructiveRed,
//           textColor: clrs.background,
//           fontSize: 16.sp);
//     }
//     setState(() {
//       _isloading = false;
//     });
//   }
//
//   Future<void> _saveQRCode() async {
//     setState(() {
//       _isloading = true;
//     });
//     if (Platform.isAndroid) {
//       PermissionStatus status =
//           await Permission.manageExternalStorage.request();
//       if (!status.isGranted) {
//         return;
//       }
//     }
//     try {
//       RenderRepaintBoundary boundary = _globalKey.currentContext
//           ?.findRenderObject() as RenderRepaintBoundary;
//       var image = await boundary.toImage(pixelRatio: 10.sp);
//       ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();
//
//       final directory = Directory('/storage/emulated/0/');
//
//       final exaScannerDir = Directory('${directory.path}/ExaScanner');
//       if (!(await exaScannerDir.exists())) {
//         await exaScannerDir.create(recursive: true);
//       }
//       var uuid = Uuid();
//
//       final path = exaScannerDir.path;
//       final fileName = '${uuid.v1().replaceAll("-", "")}.png';
//       final file = File('$path/$fileName');
//
//       await file.writeAsBytes(pngBytes);
//       Fluttertoast.showToast(
//           msg: 'QR Code saved to $path/$fileName',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: clrs.gold,
//           textColor: clrs.background,
//           fontSize: 16.sp);
//     } catch (e) {
//       print(e);
//       Fluttertoast.showToast(
//           msg: 'Error: $e',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: CupertinoColors.destructiveRed,
//           textColor: clrs.background,
//           fontSize: 16.sp);
//     }
//     setState(() {
//       _isloading = false;
//     });
//   }
//
//   String QRData() {
//     if (qr.data.toLowerCase().startsWith("wifi")) {
//       return "Network Name: ${qr.data.substring(qr.data.toLowerCase().indexOf(";s:") + 3, qr.data.toLowerCase().indexOf(";p:"))}\n"
//           "Network Password: ${qr.data.substring(qr.data.toLowerCase().indexOf(";p:") + 3, qr.data.toLowerCase().indexOf(";h:"))}\n"
//           "Hidden: ${qr.data.substring(qr.data.toLowerCase().indexOf(";h:") + 3, qr.data.toLowerCase().indexOf(";;"))}\n"
//           "Encryption: ${qr.data.substring(qr.data.toLowerCase().indexOf(":t:") + 3, qr.data.toLowerCase().indexOf(";s:"))}\n";
//     } else if (qr.data.toLowerCase().startsWith('event')) {
//       return "Event Name: ${qr.data.substring(qr.data.toLowerCase().indexOf(":n:") + 3, qr.data.toLowerCase().indexOf(";st:"))}\n"
//           "Starts At: ${qr.data.substring(qr.data.toLowerCase().indexOf(";st:") + 4, qr.data.toLowerCase().indexOf(";ed:"))}\n"
//           "Ends At: ${qr.data.substring(qr.data.toLowerCase().indexOf(";ed:") + 4, qr.data.toLowerCase().indexOf(";e:"))}\n"
//           "Location: ${qr.data.substring(qr.data.toLowerCase().indexOf(";e:") + 3, qr.data.toLowerCase().indexOf(";d:"))}\n"
//           "Description: ${qr.data.substring(qr.data.toLowerCase().indexOf(";d:") + 3, qr.data.toLowerCase().indexOf(";;"))}";
//     } else if (qr.data.toLowerCase().startsWith('contact')) {
//       return "Name: ${qr.data.substring(qr.data.toLowerCase().indexOf(":n:") + 3, qr.data.toLowerCase().indexOf(";c:"))}\n"
//           "Phone Number: ${qr.data.substring(qr.data.toLowerCase().indexOf(";p:") + 3, qr.data.toLowerCase().indexOf(";e:"))}\n"
//           "Email: ${qr.data.substring(qr.data.toLowerCase().indexOf(";e:") + 3, qr.data.toLowerCase().indexOf(";w:"))}\n"
//           "Website: ${qr.data.substring(qr.data.toLowerCase().indexOf(";w:") + 3, qr.data.toLowerCase().indexOf(";a:"))}\n"
//           "Works As : ${qr.data.substring(qr.data.toLowerCase().indexOf(";j:") + 3, qr.data.toLowerCase().indexOf(";p:"))}"
//           " At : ${qr.data.substring(qr.data.toLowerCase().indexOf(";c:") + 3, qr.data.toLowerCase().indexOf(";j:"))}\n"
//           "Address : ${qr.data.substring(qr.data.toLowerCase().indexOf(";a:") + 3, qr.data.toLowerCase().indexOf(";ci:"))} "
//           "City : ${qr.data.substring(qr.data.toLowerCase().indexOf(";ci:") + 4, qr.data.toLowerCase().indexOf(";co:"))} "
//           "Country : ${qr.data.substring(qr.data.toLowerCase().indexOf(";co:") + 4, qr.data.toLowerCase().indexOf(";;"))}";
//     } else if (qr.data.toLowerCase().startsWith('business')) {
//       return "Name: ${qr.data.substring(qr.data.toLowerCase().indexOf(":n:") + 3, qr.data.toLowerCase().indexOf(";i:"))}\n"
//           "Industry : ${qr.data.substring(qr.data.toLowerCase().indexOf(";i:") + 3, qr.data.toLowerCase().indexOf(";p:"))}\n"
//           "Phone Number: ${qr.data.substring(qr.data.toLowerCase().indexOf(";p:") + 3, qr.data.toLowerCase().indexOf(";e:"))}\n"
//           "Email: ${qr.data.substring(qr.data.toLowerCase().indexOf(";e:") + 3, qr.data.toLowerCase().indexOf(";w:"))}\n"
//           "Website: ${qr.data.substring(qr.data.toLowerCase().indexOf(";w:") + 3, qr.data.toLowerCase().indexOf(";a:"))}\n"
//           "Address : ${qr.data.substring(qr.data.toLowerCase().indexOf(";a:") + 3, qr.data.toLowerCase().indexOf(";ci:"))} "
//           "City : ${qr.data.substring(qr.data.toLowerCase().indexOf(";ci:") + 4, qr.data.toLowerCase().indexOf(";co:"))} "
//           "Country : ${qr.data.substring(qr.data.toLowerCase().indexOf(";co:") + 4, qr.data.toLowerCase().indexOf(";;"))}";
//     } else if (qr.data.toLowerCase().startsWith("visa")) {
//       XOR xor = XOR();
//       return "Holder Name: ${qr.data.substring(
//         qr.data.toLowerCase().indexOf(";c:") + 3,
//         qr.data.toLowerCase().indexOf(";v:"),
//       )}\n"
//           "Card Number: ${xor.xorDecode(
//         qr.data
//             .substring(
//               qr.data.toLowerCase().indexOf(":n:") + 3,
//               qr.data.toLowerCase().indexOf(";e:"),
//             )
//             .split("-VssEnc-")[0],
//         secretKey: qr.data
//             .substring(
//               qr.data.toLowerCase().indexOf(":n:") + 3,
//               qr.data.toLowerCase().indexOf(";e:"),
//             )
//             .split("-VssEnc-")[1],
//       )}\n"
//           "Expiry Date: ${qr.data.substring(
//         qr.data.toLowerCase().indexOf(";e:") + 3,
//         qr.data.toLowerCase().indexOf(";c:"),
//       )}\n"
//           "CVV: ${qr.data.substring(
//         qr.data.toLowerCase().indexOf(";v:") + 3,
//         qr.data.toLowerCase().indexOf(";;"),
//       )}\n";
//     } else {
//       return qr.data;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: clrs.background.withOpacity(0.84),
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             shadowColor: Colors.transparent,
//             surfaceTintColor: Colors.transparent,
//             foregroundColor: Colors.transparent,
//             leadingWidth: 100.w,
//             title: Text(
//               "QR Code",
//               style: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 27.sp,
//                   fontFamily: "Itim",
//                   color: Colors.white),
//             ),
//             leading: Row(
//               children: [
//                 SizedBox(
//                   width: 46.w,
//                 ),
//                 Container(
//                   width: 40.sp,
//                   height: 40.sp,
//                   decoration: BoxDecoration(
//                     color: clrs.background,
//                     borderRadius: BorderRadius.circular(6.sp),
//                     boxShadow: [
//                       BoxShadow(
//                         color: clrs.gold.withOpacity(0.3),
//                         spreadRadius: 5.sp,
//                         blurRadius: 7.sp,
//                         offset: Offset(-2, -1), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: BackButton(
//                       color: clrs.gold,
//                       style:
//                           ButtonStyle(iconSize: WidgetStatePropertyAll(24.sp)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           body: SingleChildScrollView(
//             padding: EdgeInsets.only(top: 29.h, right: 46.w, left: 46.w),
//             child: Column(
//               children: [
//                 Container(
//                   width: 336.w,
//                   padding:
//                       EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
//                   decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(6.sp)),
//                   child: Center(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           qr.type,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 19.sp,
//                               fontFamily: "Itim",
//                               color: clrs.gold),
//                           textAlign: TextAlign.start,
//                         ),
//                         SizedBox(
//                           height: 9.h,
//                         ),
//                         SizedBox(
//                           width: 336.w - 28.w,
//                           child: hasUrls
//                               ? UrlMessage(
//                                   textContent: qr.data,
//                                   textColor: clrs.gold,
//                                   isMyMessage: true,
//                                 )
//                               : Text(
//                                   QRData(),
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13.sp,
//                                       fontFamily: "Itim",
//                                       color: clrs.gold),
//                                 ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 57.h,
//                 ),
//                 RepaintBoundary(
//                   key: _globalKey,
//                   child: Container(
//                     width: 181.sp,
//                     height: 181.sp,
//                     padding: EdgeInsets.all(10.sp),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6.sp),
//                         color: Colors.white,
//                         border: Border.all(color: clrs.gold, width: 4.sp)),
//                     child: Center(
//                       child: PrettyQrView.data(
//                         data: qr.data,
//                         decoration: PrettyQrDecoration(
//                           image: PrettyQrDecorationImage(
//                             image: AssetImage(qr.img),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 41.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: _shareQRCode,
//                       child: Container(
//                         width: 60.sp,
//                         height: 60.sp,
//                         decoration: BoxDecoration(
//                             color: clrs.gold,
//                             borderRadius: BorderRadius.circular(6.sp)),
//                         child: Center(
//                           child: Icon(
//                             Icons.share,
//                             color: clrs.background,
//                             size: 28.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 23.w,
//                     ),
//                     InkWell(
//                       onTap: _saveQRCode,
//                       child: Container(
//                         width: 60.sp,
//                         height: 60.sp,
//                         decoration: BoxDecoration(
//                             color: clrs.gold,
//                             borderRadius: BorderRadius.circular(6.sp)),
//                         child: Center(
//                           child: Icon(
//                             Icons.save,
//                             color: clrs.background,
//                             size: 28.sp,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           extendBody: false,
//         ),
//         _isloading
//             ? Opacity(
//                 opacity: 0.8,
//                 child: ModalBarrier(
//                   dismissible: false,
//                   color: clrs.background,
//                 ),
//               )
//             : SizedBox(),
//         _isloading
//             ? Center(
//                 child: Image(
//                   image: AssetImage('assets/loading.gif'),
//                   color: clrs.gold,
//                   width: 125.sp,
//                   height: 125.sp,
//                 ),
//               )
//             : SizedBox(),
//       ],
//     );
//   }
// }
