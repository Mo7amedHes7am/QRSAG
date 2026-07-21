// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import 'package:omni_datetime_picker/omni_datetime_picker.dart';
// import 'package:qr_scanner_and_generator/Design/Result/result_screen.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/HistoryModel.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:uuid/uuid.dart';
//
// class GenerateEventScreen extends StatefulWidget {
//   const GenerateEventScreen({super.key});
//
//   @override
//   State<GenerateEventScreen> createState() => _GenerateEventScreenState();
// }
//
// late TextEditingController namecontroller;
// late String startdate;
// late String enddate;
// late TextEditingController eventcontroller;
// late TextEditingController descriptioncontroller;
// late int st, ed;
//
// class _GenerateEventScreenState extends State<GenerateEventScreen> {
//
//
//   @override
//   void initState() {
//     namecontroller = TextEditingController();
//     eventcontroller = TextEditingController();
//     descriptioncontroller = TextEditingController();
//     var now = DateTime.now();
//     final formatter = new DateFormat('dd MMM yyyy hh:mm aa');
//     startdate = formatter.format(now);
//     enddate = formatter.format(now);
//     st = now.millisecondsSinceEpoch;
//     ed = now.millisecondsSinceEpoch;
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     namecontroller.dispose();
//     eventcontroller.dispose();
//     descriptioncontroller.dispose();
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
//         title: Text("Event",
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
//         padding: EdgeInsets.only(top: 42.h,right: 46.w,left: 46.w),
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
//                       'assets/g4.svg',
//                       color: clrs.gold,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Event Name",
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
//                           controller: namecontroller,
//                           onChanged: (value) {
//                             setState(() {
//
//                             });
//                           },
//                           style: TextStyle(color: clrs.gold,fontSize: 14.sp),
//                           decoration: InputDecoration(
//                             isCollapsed: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                             hintText: "Event Name",
//                             hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 14.sp,overflow: TextOverflow.ellipsis),
//                             prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             border: InputBorder.none,
//                             suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                             suffixIcon: !namecontroller.text.trim().isEmpty?
//                             IconButton(
//                               icon:Icon(
//                                 Icons.close,
//                                 color: Color(0xff6D6D6D),
//                                 size: 20.sp,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   namecontroller.clear();
//                                 });
//                               },
//                             ):SizedBox(),
//                           )
//                       ),
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Start Date and Time",
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
//                     InkWell(
//                       onTap: () async {
//                         DateTime? dateTime = await showOmniDateTimePicker(
//                           context: context,
//                           initialDate: DateTime.fromMillisecondsSinceEpoch(st),
//                           firstDate:
//                           DateTime(1600).subtract(const Duration(days: 3652)),
//                           lastDate: DateTime.now().add(
//                             const Duration(days: 3652),
//                           ),
//                           is24HourMode: false,
//                           isShowSeconds: false,
//                           minutesInterval: 1,
//                           secondsInterval: 1,
//                           borderRadius: const BorderRadius.all(Radius.circular(16)),
//                           constraints: BoxConstraints(
//                             maxWidth: 350.w,
//                             maxHeight: 650.h,
//                           ),
//                           transitionBuilder: (context, anim1, anim2, child) {
//                             return FadeTransition(
//                               opacity: anim1.drive(
//                                 Tween(
//                                   begin: 0,
//                                   end: 1,
//                                 ),
//                               ),
//                               child: child,
//                             );
//                           },
//                           transitionDuration: const Duration(milliseconds: 200),
//                           barrierDismissible: true,
//                           selectableDayPredicate: (dateTime) {
//                             // Disable 25th Feb 2023
//                             if (dateTime.isBefore(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,0,0,0))) {
//                               return false;
//                             } else {
//                               return true;
//                             }
//                           },
//                         );
//                         setState(() {
//                           if (!dateTime.isNull) {
//                             final formatter = new DateFormat('dd MMM yyyy hh:mm aa');
//                             startdate = formatter.format(dateTime!);
//                             st = dateTime!.millisecondsSinceEpoch;
//                           }
//                         });
//                       },
//                       child: Container(
//                         height: 45.h,
//                         width: MediaQuery.sizeOf(context).width,
//                         padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           color: clrs.background,
//                           borderRadius: BorderRadius.circular(8.sp),
//                         ),
//                         child: Text(startdate,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14.sp,
//                               fontFamily: "Itim",
//                               color: Colors.white
//                           ),
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("End Date and Time",
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
//                     InkWell(
//                       onTap: () async {
//                         DateTime? dateTime = await showOmniDateTimePicker(
//                           context: context,
//                           initialDate: DateTime.fromMillisecondsSinceEpoch(ed),
//                           firstDate:
//                           DateTime(1600).subtract(const Duration(days: 3652)),
//                           lastDate: DateTime.now().add(
//                             const Duration(days: 3652),
//                           ),
//                           is24HourMode: false,
//                           isShowSeconds: false,
//                           minutesInterval: 1,
//                           secondsInterval: 1,
//                           borderRadius: const BorderRadius.all(Radius.circular(16)),
//                           constraints: BoxConstraints(
//                             maxWidth: 350.w,
//                             maxHeight: 650.h,
//                           ),
//                           transitionBuilder: (context, anim1, anim2, child) {
//                             return FadeTransition(
//                               opacity: anim1.drive(
//                                 Tween(
//                                   begin: 0,
//                                   end: 1,
//                                 ),
//                               ),
//                               child: child,
//                             );
//                           },
//                           transitionDuration: const Duration(milliseconds: 200),
//                           barrierDismissible: true,
//                           selectableDayPredicate: (dateTime) {
//                             // Disable 25th Feb 2023
//                             if (dateTime.isBefore(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,0,0,0))) {
//                               return false;
//                             } else {
//                               return true;
//                             }
//                           },
//                         );
//                         setState(() {
//                           if (!dateTime.isNull) {
//                             if (dateTime!.millisecondsSinceEpoch < st) {
//                               Fluttertoast.showToast(
//                                   msg: 'End Date and Time Should Be After Start Date and Time',
//                                   toastLength: Toast.LENGTH_SHORT,
//                                   gravity: ToastGravity.BOTTOM,
//                                   timeInSecForIosWeb: 1,
//                                   backgroundColor: CupertinoColors.destructiveRed,
//                                   textColor: clrs.background,
//                                   fontSize: 16.sp
//                               );
//                               return;
//                             }
//                             final formatter = new DateFormat('dd MMM yyyy hh:mm aa');
//                             enddate = formatter.format(dateTime!);
//                             ed = dateTime.millisecondsSinceEpoch;
//                           }
//                         });
//                       },
//                       child: Container(
//                         height: 45.h,
//                         width: MediaQuery.sizeOf(context).width,
//                         padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           color: clrs.background,
//                           borderRadius: BorderRadius.circular(8.sp),
//                         ),
//                         child: Text(enddate,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14.sp,
//                               fontFamily: "Itim",
//                               color: Colors.white
//                           ),
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Event Location",
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
//                           controller: eventcontroller,
//                           onChanged: (value) {
//                             setState(() {
//
//                             });
//                           },
//                           style: TextStyle(color: clrs.gold,fontSize: 14.sp),
//                           decoration: InputDecoration(
//                             isCollapsed: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                             hintText: "Event Location",
//                             hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 14.sp,overflow: TextOverflow.ellipsis),
//                             prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             border: InputBorder.none,
//                             suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                             suffixIcon: !eventcontroller.text.trim().isEmpty?
//                             IconButton(
//                               icon:Icon(
//                                 Icons.close,
//                                 color: Color(0xff6D6D6D),
//                                 size: 20.sp,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   eventcontroller.clear();
//                                 });
//                               },
//                             ):SizedBox(),
//                           )
//                       ),
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Event Description",
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
//                       height: 135.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         color: clrs.background,
//                         borderRadius: BorderRadius.circular(8.sp),
//                       ),
//                       child: TextFormField(
//                           textAlignVertical: TextAlignVertical.center,
//                           cursorColor: clrs.gold,
//                           maxLines: 3,
//                           textAlign: TextAlign.start,
//                           controller: descriptioncontroller,
//                           onChanged: (value) {
//                             setState(() {
//
//                             });
//                           },
//                           style: TextStyle(color: clrs.gold,fontSize: 14.sp),
//                           decoration: InputDecoration(
//                             isCollapsed: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                             hintText: "Event Description",
//                             hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 14.sp,overflow: TextOverflow.ellipsis),
//                             prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             border: InputBorder.none,
//                             suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                             suffixIcon: !descriptioncontroller.text.trim().isEmpty?
//                             IconButton(
//                               icon:Icon(
//                                 Icons.close,
//                                 color: Color(0xff6D6D6D),
//                                 size: 20.sp,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   descriptioncontroller.clear();
//                                 });
//                               },
//                             ):SizedBox(),
//                           )
//                       ),
//                     ),
//                     SizedBox(height: 52.h,),
//                     InkWell(
//                       onTap: () async {
//                         if (
//                         namecontroller.text.trim().isNotEmpty
//                             && eventcontroller.text.trim().isNotEmpty
//                         ) {
//                           var uuid = Uuid();
//                           var box = await Hive.openBox<HistoryModel>('generatehistory');
//                           final hist = HistoryModel(
//                               data: "EVENT:N:${namecontroller.text.toString()};ST:${startdate};ED:${enddate};E:${eventcontroller.text.toString()};D:${descriptioncontroller.text.trim().isNotEmpty?descriptioncontroller.text.toString():"No Description"};;",
//                               id: uuid.v1().replaceAll("-", ""),
//                               datesubmitted: DateTime.now().millisecondsSinceEpoch,
//                               type: 'Event',
//                               img: 'assets/v9.png'
//                           );
//                           await box.add(
//                               hist
//                           );
//                           namecontroller.clear();
//                           eventcontroller.clear();
//                           descriptioncontroller.clear();
//                           Get.off(ResultScreen(result: hist,));
//                         }
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(14.sp),
//                         decoration: BoxDecoration(
//                             color: (
//                                 namecontroller.text.trim().isEmpty
//                                     && eventcontroller.text.trim().isEmpty
//                             )?Colors.grey:clrs.gold,
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
