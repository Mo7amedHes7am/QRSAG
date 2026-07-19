// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:qr_scanner_and_generator/Design/Generate/Generate_Types/GenerateBusinessScreen.dart';
// import 'package:qr_scanner_and_generator/Design/Generate/Generate_Types/GenerateContactScreen.dart';
// import 'package:qr_scanner_and_generator/Design/Generate/Generate_Types/GenerateEventScreen.dart';
// import 'package:qr_scanner_and_generator/Design/Generate/Generate_Types/GenerateTextScreen.dart';
// import 'package:qr_scanner_and_generator/Design/Generate/Generate_Types/GenerateVisaScreen.dart';
// import 'package:qr_scanner_and_generator/Design/Generate/Generate_Types/GenerateWifiScreen.dart';
// import 'package:qr_scanner_and_generator/Design/Settings/SettingsScreen.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/GenerateQRModel.dart';
// import 'package:qr_scanner_and_generator/main.dart';
//
// class GenerateScreen extends StatefulWidget {
//   const GenerateScreen({super.key});
//
//   @override
//   State<GenerateScreen> createState() => _GenerateScreenState();
// }
//
// class _GenerateScreenState extends State<GenerateScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: clrs.background.withOpacity(0.84),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         automaticallyImplyLeading: false,
//         foregroundColor: Colors.transparent,
//         surfaceTintColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         title: Text(
//           "Generate QR",
//           style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 27.sp,
//               fontFamily: "Itim",
//               color: Colors.white),
//         ),
//         actions: [
//           InkWell(
//             onTap: () {
//               Get.to(SettingsScreen());
//             },
//             child: Container(
//               width: 40.sp,
//               height: 40.sp,
//               decoration: BoxDecoration(
//                 color: clrs.background,
//                 borderRadius: BorderRadius.circular(8.sp),
//                 boxShadow: [
//                   BoxShadow(
//                     color: clrs.background.withOpacity(0.3),
//                     spreadRadius: 5.sp,
//                     blurRadius: 7.sp,
//                     offset: Offset(3, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: Icon(
//                   Icons.settings_outlined,
//                   color: Colors.white,
//                   size: 24.sp,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20.w,
//           )
//         ],
//       ),
//       extendBody: false,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               width: MediaQuery.sizeOf(context).width,
//               child: GridView.builder(
//                 padding: EdgeInsets.only(
//                     left: 42.w, right: 42.w, bottom: 20.h, top: 52.h),
//                 itemCount: GenerateQRModel.GenerateList().length,
//                 physics: NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     mainAxisExtent: 86.sp,
//                     crossAxisSpacing: 43.sp,
//                     mainAxisSpacing: 43.sp),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   final item = GenerateQRModel.GenerateList()[index];
//                   return (index == 3 || index == 5 || index == 6)
//                       ? Stack(
//                           children: [
//                             InkWell(
//                               onTap: () async {
//                                 if (index == 3) {
//                                   Get.to(GenerateEventScreen());
//                                 } else if (index == 5) {
//                                   Get.to(GenerateBusinessScreen());
//                                 } else {
//                                   Get.to(GenerateVisaScreen());
//                                 }
//                               },
//                               child: Container(
//                                 width: 86.sp,
//                                 height: 82.sp,
//                                 decoration: BoxDecoration(
//                                   color: clrs.background,
//                                   borderRadius: BorderRadius.circular(8.sp),
//                                   border: Border.all(color: Colors.white),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: clrs.background.withOpacity(0.3),
//                                       spreadRadius: 5.sp,
//                                       blurRadius: 7.sp,
//                                       offset: Offset(
//                                           3, 3), // changes position of shadow
//                                     ),
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       SizedBox(
//                                         height: 15.h,
//                                       ),
//                                       SvgPicture.asset(
//                                         width: 37.sp,
//                                         height: 37.sp,
//                                         item.imgurl,
//                                         color: Colors.white,
//                                         fit: BoxFit.cover,
//                                       ),
//                                       Text(
//                                         item.name,
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 12.sp,
//                                             fontFamily: "Itim",
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       : InkWell(
//                           onTap: () {
//                             if (index == 0 || index == 1) {
//                               Get.to(GenerateTextScreen(type: index + 1));
//                             } else if (index == 7 ||
//                                 index == 10 ||
//                                 index == 11 ||
//                                 index == 8 ||
//                                 index == 9) {
//                               Get.to(GenerateTextScreen(type: index - 4));
//                             } else if (index == 2) {
//                               Get.to(GenerateWifiScreen());
//                             } else if (index == 3) {
//                               Get.to(GenerateEventScreen());
//                             } else if (index == 4) {
//                               Get.to(GenerateContactScreen());
//                             } else if (index == 5) {
//                               Get.to(GenerateBusinessScreen());
//                             } else {
//                               Get.to(GenerateVisaScreen());
//                             }
//                           },
//                           child: Container(
//                             width: 86.sp,
//                             height: 82.sp,
//                             decoration: BoxDecoration(
//                               color: clrs.background,
//                               borderRadius: BorderRadius.circular(8.sp),
//                               border: Border.all(color: Colors.white),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: clrs.background.withOpacity(0.3),
//                                   spreadRadius: 5.sp,
//                                   blurRadius: 7.sp,
//                                   offset: Offset(
//                                       3, 3), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             child: Center(
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   SvgPicture.asset(
//                                     width: 37.sp,
//                                     height: 37.sp,
//                                     item.imgurl,
//                                     color: Colors.white,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   Text(
//                                     item.name,
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 12.sp,
//                                         fontFamily: "Itim",
//                                         color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
