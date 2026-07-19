// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:qr_scanner_and_generator/Design/Result/ResultScreen.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/HistoryModel.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:uuid/uuid.dart';
//
// class GenerateWifiScreen extends StatefulWidget {
//   const GenerateWifiScreen({super.key});
//
//   @override
//   State<GenerateWifiScreen> createState() => _GenerateWifiScreenState();
// }
// late TextEditingController controller;
// late TextEditingController controller2;
// late bool hidden;
// late int encryption;
//
// class _GenerateWifiScreenState extends State<GenerateWifiScreen> {
//
//   @override
//   void initState() {
//     controller = TextEditingController();
//     controller2 = TextEditingController();
//     hidden = false;
//     encryption = 0;
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     controller2.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: clrs.background,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         surfaceTintColor: Colors.transparent,
//         foregroundColor: Colors.transparent,
//         leadingWidth: 100.w,
//         toolbarHeight: 80.h,
//         title: Text("Wifi",
//           style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 27.sp,
//               fontFamily: "Itim",
//               color: Colors.white,
//               height: 0.9
//           ),
//           maxLines: 2,
//         ),
//         leading: Row(
//           children: [
//             SizedBox(width: 46.w,),
//             Container(
//               width: 40.sp,
//               height: 40.sp,
//               decoration: BoxDecoration(
//                 color: clrs.background,
//                 borderRadius: BorderRadius.circular(6.sp),
//                 boxShadow: [
//                   BoxShadow(
//                     color: clrs.gold.withOpacity(0.3),
//                     spreadRadius: 5.sp,
//                     blurRadius: 7.sp,
//                     offset: Offset(-2, -1), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: BackButton(color: clrs.gold,style: ButtonStyle(iconSize: WidgetStatePropertyAll(24.sp)),),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(top: 151.h,right: 46.w,left: 46.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 336.w,
//               padding: EdgeInsets.symmetric(horizontal: 35.w,vertical: 35.h),
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(6.sp),
//                   border: Border(
//                     bottom: BorderSide(
//                       color: clrs.gold,
//                       width: 5.sp,
//                     ),
//                     top: BorderSide(
//                       color: clrs.gold,
//                       width: 5.sp,
//                     ),
//                   )
//               ),
//               child: Center(
//                 child: Column(
//                   children: [
//                     SvgPicture.asset(
//                       width: 60.sp,
//                       height: 60.sp,
//                       'assets/g3.svg',
//                       color: clrs.gold,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Network Name",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14.sp,
//                             fontFamily: "Itim",
//                             color: Colors.white
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     SizedBox(height: 8.h,),
//                     Row(
//                       children: [
//                         Container(
//                           height: 45.h,
//                           width: 175.w,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             color: clrs.background,
//                             borderRadius: BorderRadius.circular(8.sp),
//                           ),
//                           child: TextFormField(
//                               textAlignVertical: TextAlignVertical.center,
//                               cursorColor: clrs.gold,
//                               controller: controller,
//                               onChanged: (value) {
//                                 setState(() {
//
//                                 });
//                               },
//                               style: TextStyle(color: clrs.gold,fontSize: 14.sp),
//                               decoration: InputDecoration(
//                                 isCollapsed: true,
//                                 contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                 hintText: "Wifi Name",
//                                 hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 14.sp,overflow: TextOverflow.ellipsis),
//                                 prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                 border: InputBorder.none,
//                                 suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                 suffixIcon: !controller.text.trim().isEmpty?
//                                 IconButton(
//                                   icon:Icon(
//                                     Icons.close,
//                                     color: Color(0xff6D6D6D),
//                                     size: 20.sp,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       controller.clear();
//                                     });
//                                   },
//                                 ):SizedBox(),
//                               )
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Checkbox(
//                                 value: hidden,
//                                 onChanged: (value) => setState(() {
//                                   hidden = !hidden;
//                                 }),
//                               fillColor: WidgetStatePropertyAll(hidden?clrs.gold:Colors.transparent),
//                               checkColor: Colors.white,
//                               activeColor: clrs.gold,
//                               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                               side: BorderSide(color: clrs.gold,width: 2.sp),
//                             ),
//                             Text("Hidden",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: hidden?clrs.gold:Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Password",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14.sp,
//                             fontFamily: "Itim",
//                             color: Colors.white
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     SizedBox(height: 8.h,),
//                     Container(
//                       height: 45.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         color: clrs.background,
//                         borderRadius: BorderRadius.circular(8.sp),
//                       ),
//                       child: TextFormField(
//                           textAlignVertical: TextAlignVertical.center,
//                           cursorColor: clrs.gold,
//                           controller: controller2,
//                           onChanged: (value) {
//                             setState(() {
//
//                             });
//                           },
//                           style: TextStyle(color: clrs.gold,fontSize: 14.sp),
//                           decoration: InputDecoration(
//                             isCollapsed: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                             hintText: "Wifi Password",
//                             hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 14.sp,overflow: TextOverflow.ellipsis),
//                             prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             border: InputBorder.none,
//                             suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                             suffixIcon: !controller2.text.trim().isEmpty?
//                             IconButton(
//                               icon:Icon(
//                                 Icons.close,
//                                 color: Color(0xff6D6D6D),
//                                 size: 20.sp,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   controller2.clear();
//                                 });
//                               },
//                             ):SizedBox(),
//                           )
//                       ),
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Encryption",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14.sp,
//                             fontFamily: "Itim",
//                             color: Colors.white
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     SizedBox(height: 8.h,),
//                     Row(
//                       children: [
//                         InkWell(
//                           onTap: () => setState(() {
//                             encryption = 0;
//                           }),
//                           child: Row(
//                             children: [
//                               Radio(
//                                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                 fillColor: WidgetStatePropertyAll(encryption==0?clrs.gold:Colors.grey),
//                                 activeColor: clrs.gold,
//                                 value: 0,
//                                 groupValue: encryption,
//                                 onChanged: (value) => setState(() {
//                                 encryption = 0;
//                               }),
//                               ),
//                               Text("None",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12.sp,
//                                     fontFamily: "Itim",
//                                     color: encryption==0?clrs.gold:Colors.white
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ],
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () => setState(() {
//                             encryption = 1;
//                           }),
//                           child: Row(
//                             children: [
//                               Radio(
//                                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                 fillColor: WidgetStatePropertyAll(encryption==1?clrs.gold:Colors.grey),
//                                 activeColor: clrs.gold,
//                                 value: 1,
//                                 groupValue: encryption,
//                                 onChanged: (value) => setState(() {
//                                 encryption = 1;
//                               }),
//                               ),
//                               Text("WPA/WPA2",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12.sp,
//                                     fontFamily: "Itim",
//                                     color: encryption==1?clrs.gold:Colors.white
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ],
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () => setState(() {
//                             encryption = 2;
//                           }),
//                           child: Row(
//                             children: [
//                               Radio(
//                                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                 fillColor: WidgetStatePropertyAll(encryption==2?clrs.gold:Colors.grey),
//                                 activeColor: clrs.gold,
//                                 value: 2,
//                                 groupValue: encryption,
//                                 onChanged: (value) => setState(() {
//                                 encryption = 2;
//                               }),
//                               ),
//                               Text("WEP",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12.sp,
//                                     fontFamily: "Itim",
//                                     color: encryption==2?clrs.gold:Colors.white
//                                 ),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 52.h,),
//                     InkWell(
//                       onTap: () async {
//                         if (controller.text.trim().isNotEmpty && controller2.text.trim().isNotEmpty) {
//                           var uuid = Uuid();
//                           var box = await Hive.openBox<HistoryModel>('generatehistory');
//                           final hist = HistoryModel(
//                               data: "WIFI:T:${encryption==0?'nopass':encryption==1?'WPA/WPA2':'WEP'};S:${controller.text.toString()};P:${controller2.text.toString()};H:${hidden?'true':'false'};;",
//                               id: uuid.v1().replaceAll("-", ""),
//                               datesubmitted: DateTime.now().millisecondsSinceEpoch,
//                               type: 'Wifi',
//                             img: 'assets/v8.png'
//                           );
//                           await box.add(
//                               hist
//                           );
//                           controller.clear();
//                           controller2.clear();
//                           Get.to(ResultScreen(result: hist,));
//                         }
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(14.sp),
//                         decoration: BoxDecoration(
//                             color: (controller.text.trim().isEmpty && controller2.text.trim().isEmpty)?Colors.grey:clrs.gold,
//                             borderRadius: BorderRadius.circular(6.sp)
//                         ),
//                         child: Center(
//                           child: Text("Generate QR Code",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16.sp,
//                               fontFamily: "Itim",
//                               color: clrs.background,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
