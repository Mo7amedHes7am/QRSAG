// import 'dart:typed_data';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_zxing/flutter_zxing.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:qr_scanner_and_generator/Design/Result/ResultScreen.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/HistoryModel.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:uuid/uuid.dart';
// import 'package:vibration/vibration.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// Uint8List? createdCodeBytes;
//
// Code? result;
// Codes? multiResult;
//
// bool isMultiScan = false;
//
// bool showDebugInfo = true;
// int successScans = 0;
// int failedScans = 0;
// late bool _isloading;
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   @override
//   void initState() {
//     _isloading = false;
//     super.initState();
//   }
//
//   String QRType(String qr){
//     if (qr.startsWith('wifi')) {
//       return 'Wifi';
//     }
//     else if((qr.startsWith('www') || qr.startsWith('http'))){
//       return 'Web';
//     }
//     else if((qr.contains('x.com') || qr.contains('twitter.com'))){
//       return 'X';
//     }
//     else if(qr.contains('instagram.com')){
//       return 'Instagram';
//     }
//     else if(qr.startsWith('event')){
//       return 'Event';
//     }
//     else if(qr.startsWith('contact')){
//       return 'Contact';
//     }
//     else if(qr.startsWith('business')){
//       return 'Business';
//     }
//     else if(qr.startsWith('visa')){
//       return 'Visa';
//     }
//     else{
//       return 'Data';
//     }
//   }
//
//   String QRImg(String qr){
//
//     if (qr.startsWith('wifi')) {
//       return 'assets/v8.png';
//     }
//     else if((qr.startsWith('www') || qr.startsWith('http'))){
//       return 'assets/v2.png';
//     }
//     else if((qr.contains('x.com') || qr.contains('twitter.com'))){
//       return 'assets/v4.png';
//     }
//     else if(qr.contains('instagram.com')){
//       return 'assets/v6.png';
//     }
//     else if(qr.startsWith('event')){
//       return 'assets/v9.png';
//     }
//     else if(qr.startsWith('contact')){
//       return 'assets/v10.png';
//     }
//     else if(qr.startsWith('business')){
//       return 'assets/v11.png';
//     }
//     else if(qr.startsWith('visa')){
//       return 'assets/v12.png';
//     }
//     else{
//       return 'assets/logo.png';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: ReaderWidget(
//             onScan: (p0) async {
//               AudioPlayer audioPlayer = AudioPlayer();
//               if (prefs.getBool('beep') == true || prefs.getBool('beep') == null) {
//                 await audioPlayer.play(AssetSource('beep.mp3'));
//               }
//               if (prefs.getBool('vibrate') == true || prefs.getBool('vibrate') == null) {
//                 bool? hasVibrator = await Vibration.hasVibrator();
//                 if (hasVibrator == true) {
//                   Vibration.vibrate();
//                 } else {
//                   print("This device does not support vibration.");
//                 }
//               }
//
//               setState(() {
//                 _isloading = true;
//               });
//               var uuid = Uuid();
//               var box = await Hive.openBox<HistoryModel>('scanhistory');
//               final hist = HistoryModel(
//                   data: p0.text!,
//                   id: uuid.v1().replaceAll("-", ""),
//                   datesubmitted: DateTime.now().millisecondsSinceEpoch,
//                   type: QRType(p0.text!.toLowerCase()),
//                   img: QRImg(p0.text!.toLowerCase()),
//                 wifi: QRType(p0.text!.toLowerCase()) == "Visa"?p0.text!.split("-VssEnc-")[1]:null
//               );
//               await box.add(
//                 hist
//               );
//               setState(() {
//                 _isloading = false;
//               });
//               Get.to(ResultScreen(result: hist,));
//             },
//             onScanFailure: (p0) {},
//             onControllerCreated: (controller, error) {},
//             allowPinchZoom: true,
//             actionButtonsAlignment: Alignment.topCenter,
//             resolution: ResolutionPreset.high,
//             lensDirection: CameraLensDirection.back,
//             // flashOnIcon: Icon(Icons.flash_on,size: 25.sp,color: clrs.gold,),
//             // flashOffIcon: Icon(Icons.flash_off,size: 25.sp,color: Colors.white,),
//             // flashAlwaysIcon: Icon(Icons.flash_on,size: 25.sp,color: clrs.gold,),
//             // flashAutoIcon: Icon(Icons.flash_auto,size: 25.sp,color: clrs.gold,),
//             // galleryIcon: Icon(Icons.photo_library,size: 25.sp,color: Colors.white,),
//             // toggleCameraIcon: Icon(Icons.switch_camera,size: 25.sp,color: Colors.white,),
//             showFlashlight: false,
//             showToggleCamera: false,
//             showGallery: false,
//             showScannerOverlay: true,
//             tryRotate: true,
//             tryHarder: true,
//             tryInverted: true,
//             actionButtonsPadding: EdgeInsets.symmetric(vertical:8.h,horizontal: 20.w),
//             actionButtonsBackgroundBorderRadius:
//             BorderRadius.circular(10.sp),
//             actionButtonsBackgroundColor: Colors.black.withOpacity(0.5),
//             scanDelay: Duration(milliseconds: 3000),
//           ),
//         ),
//         _isloading?Opacity(
//           opacity: 0.8,
//           child: ModalBarrier(dismissible: false, color: clrs.background,
//           ),
//         ):SizedBox(),
//         _isloading?Center(
//           child: Image(
//             image: AssetImage('assets/loading.gif'),
//             color: clrs.gold,
//             width: 125.sp,
//             height: 125.sp,
//           ),
//         ):SizedBox(),
//       ],
//     );
//   }
// }
