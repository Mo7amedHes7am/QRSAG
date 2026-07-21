// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';
// import 'package:qr_scanner_and_generator/Design/Components/CustomTabBar.dart';
// import 'package:qr_scanner_and_generator/Design/Result/result_screen.dart';
// import 'package:qr_scanner_and_generator/Design/Settings/SettingsScreen.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/HistoryModel.dart';
// import 'package:qr_scanner_and_generator/main.dart';
//
// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({super.key});
//
//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }
//
// List<HistoryModel> History = [];
// List<HistoryModel> History2 = [];
// Timer? _timer;
//
// class _HistoryScreenState extends State<HistoryScreen> {
//   @override
//   void initState() {
//     startTimer();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _timer!.cancel();
//     super.dispose();
//   }
//
//   void startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScanHistory(context);
//   }
//
//   ScanHistory(BuildContext context) {
//     return StreamBuilder(
//       stream: Hive.openBox<HistoryModel>('scanhistory').asStream(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           History.clear();
//           for (var val in snapshot.data!.values) {
//             History.add(val);
//           }
//           return GenerateHistory(context);
//         } else {
//           return GenerateHistory(context);
//         }
//       },
//     );
//   }
//
//   Widget GenerateHistory(BuildContext context) {
//     return StreamBuilder(
//       stream: Hive.openBox<HistoryModel>('generatehistory').asStream(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           History2.clear();
//           for (var val in snapshot.data!.values) {
//             History2.add(val);
//           }
//           return DataScreen(context);
//         } else {
//           return DataScreen(context);
//         }
//       },
//     );
//   }
//
//   Widget DataScreen(BuildContext context) {
//     return Scaffold(
//       backgroundColor: clrs.background.withOpacity(0.84),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         automaticallyImplyLeading: false,
//         foregroundColor: Colors.transparent,
//         surfaceTintColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         title: Text(
//           "History",
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
//       body: CustomTabBar(
//         context: context,
//         Screen1: ScreenScan(context, History, 1),
//         Screen2: ScreenScan(context, History2, 2),
//       ),
//       extendBody: false,
//     );
//   }
//
//   ScreenScan(BuildContext context, List<HistoryModel> hist, int page) {
//     hist.sort((a, b) => b.datesubmitted.compareTo(a.datesubmitted));
//     return Column(
//       children: [
//         SizedBox(
//           width: MediaQuery.sizeOf(context).width,
//           child: ListView.builder(
//             itemCount: hist.length,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               final item = hist[index];
//               final DateFormat formatter = DateFormat('dd MMM yyyy, h.mm aa');
//               final String formatted = formatter.format(
//                   DateTime.fromMillisecondsSinceEpoch(item.datesubmitted));
//               return Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.to(ResultScreen(result: item));
//                     },
//                     child: Container(
//                       width: 336.w,
//                       height: 95.sp,
//                       padding:
//                           EdgeInsets.symmetric(vertical: 9.h, horizontal: 9.w),
//                       decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.3),
//                           borderRadius: BorderRadius.circular(6.sp)),
//                       child: Center(
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 60.sp,
//                               height: 60.sp,
//                               padding: EdgeInsets.all(2.sp),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(6.sp),
//                                   color: Colors.white,
//                                   border: Border.all(
//                                       color: clrs.gold, width: 1.sp)),
//                               child: Center(
//                                 child: PrettyQrView.data(
//                                   data: item.data,
//                                   decoration: PrettyQrDecoration(
//                                     image: PrettyQrDecorationImage(
//                                       image: AssetImage(item.img),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 15.w,
//                             ),
//                             SizedBox(
//                               height: 95.sp,
//                               width: (303.w) - (60.sp),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         width: 125.w,
//                                         child: Text(
//                                           item.data,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 19.sp,
//                                               fontFamily: "Itim",
//                                               color: clrs.gold,
//                                               height: 0.8),
//                                           maxLines: 3,
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.start,
//                                         ),
//                                       ),
//                                       InkWell(
//                                           onTap: () async {
//                                             await showDialog(
//                                                 context: context,
//                                                 builder: (_) => AlertDialog(
//                                                       backgroundColor:
//                                                           clrs.background,
//                                                       title: Text(
//                                                         'Are You Sure To Delete?',
//                                                         style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.w700,
//                                                           fontSize: 24.sp,
//                                                           fontFamily: "Itim",
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                       content: Text(
//                                                         'This Result Will be deleted Permanently',
//                                                         style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           fontSize: 19.sp,
//                                                           fontFamily: "Itim",
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                       actions: [
//                                                         Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             InkWell(
//                                                               onTap: () async {
//                                                                 if (page == 1) {
//                                                                   await Hive.box<
//                                                                               HistoryModel>(
//                                                                           'scanhistory')
//                                                                       .deleteAt(hist
//                                                                               .length -
//                                                                           index -
//                                                                           1);
//                                                                   setState(
//                                                                       () {});
//                                                                   Navigator.pop(
//                                                                       context);
//                                                                 } else {
//                                                                   await Hive.box<
//                                                                               HistoryModel>(
//                                                                           'generatehistory')
//                                                                       .deleteAt(hist
//                                                                               .length -
//                                                                           index -
//                                                                           1);
//                                                                   setState(
//                                                                       () {});
//                                                                   Navigator.pop(
//                                                                       context);
//                                                                 }
//                                                               },
//                                                               child: Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .all(14
//                                                                             .sp),
//                                                                 decoration: BoxDecoration(
//                                                                     color: CupertinoColors
//                                                                         .destructiveRed,
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             6.sp)),
//                                                                 child: Center(
//                                                                   child: Text(
//                                                                     "Delete",
//                                                                     style: TextStyle(
//                                                                         fontWeight:
//                                                                             FontWeight
//                                                                                 .w400,
//                                                                         fontSize: 19
//                                                                             .sp,
//                                                                         fontFamily:
//                                                                             "Itim",
//                                                                         color: clrs
//                                                                             .background),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               width: 23.w,
//                                                             ),
//                                                             InkWell(
//                                                               onTap: () {
//                                                                 Navigator.pop(
//                                                                     context);
//                                                               },
//                                                               child: Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .all(14
//                                                                             .sp),
//                                                                 decoration: BoxDecoration(
//                                                                     border: Border.all(
//                                                                         color: clrs
//                                                                             .gold),
//                                                                     color: clrs
//                                                                         .background,
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             6.sp)),
//                                                                 child: Center(
//                                                                   child: Text(
//                                                                     "Cancel",
//                                                                     style:
//                                                                         TextStyle(
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w400,
//                                                                       fontSize:
//                                                                           19.sp,
//                                                                       fontFamily:
//                                                                           "Itim",
//                                                                       color: Colors
//                                                                           .white,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         )
//                                                       ],
//                                                     ));
//                                           },
//                                           child: Icon(
//                                             Icons.delete_forever,
//                                             size: 24.sp,
//                                             color:
//                                                 CupertinoColors.destructiveRed,
//                                           )),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 8.h,
//                                   ),
//                                   SizedBox(
//                                     width: (303.w) - (60.sp),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           item.type,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 11.sp,
//                                               fontFamily: "Itim",
//                                               color: clrs.gold),
//                                           textAlign: TextAlign.start,
//                                         ),
//                                         Text(
//                                           formatted,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 11.sp,
//                                               fontFamily: "Itim",
//                                               color: clrs.gold),
//                                           textAlign: TextAlign.start,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 19.h,
//                   )
//                 ],
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
