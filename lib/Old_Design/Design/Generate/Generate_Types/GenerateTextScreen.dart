// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:qr_scanner_and_generator/Design/Result/result_screen.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/HistoryModel.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:uuid/uuid.dart';
//
// late int state;
// late TextEditingController controller;
// class GenerateTextScreen extends StatefulWidget {
//   GenerateTextScreen({required int type}){
//     state = type;
//   }
//
//   @override
//   State<GenerateTextScreen> createState() => _GenerateTextScreenState();
// }
//
// class _GenerateTextScreenState extends State<GenerateTextScreen> {
//
//   @override
//   void initState() {
//     controller = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
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
//         title: Text(
//           state==1?
//           "Text":
//           state==2?
//         "Website":
//           state==3?"WhatsApp":
//           state==4?"X":
//           state==5?"Email":
//           state==6?"Instagram":"Phone",
//           style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 27.sp,
//               fontFamily: "Itim",
//               color: Colors.white,
//             height: 0.9
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
//                 color: Colors.white.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(6.sp),
//                   border: Border(
//                       bottom: BorderSide(
//                         color: clrs.gold,
//                         width: 5.sp,
//                       ),
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
//                       state==1?
//                       'assets/g1.svg':
//                       state==2?
//                       'assets/g2.svg':
//                       state==3?'assets/g8.svg':
//                       state==4?'assets/g10.svg':
//                       state==5?'assets/g9.svg':
//                       state==6?'assets/g11.svg':'assets/g12.svg',
//                       color: clrs.gold,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text(state==1?
//                       "Text":
//                       state==2?
//                       "Website URL":
//                       state==3?"WhatsApp Number":
//                       state==4?"Username":
//                       state==5?"Email":
//                       state==6?"Username":"Phone Number",
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
//                           controller: controller,
//                           onChanged: (value) {
//                             setState(() {
//
//                             });
//                           },
//                           style: TextStyle(color: clrs.gold,fontSize: 14.sp),
//                           decoration: InputDecoration(
//                             isCollapsed: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                             hintText: state==1?
//                             "Enter Text":
//                             state==2?
//                             "Ex. www.google.com":
//                             state==3?"Ex. +20xxxxxxxxxx":
//                             state==4?"Enter X Username Ex. exapps":
//                             state==5?"Enter email address":
//                             state==6?"Enter Instagram Username Ex. exapps":"Ex. +20xxxxxxxxxx",
//                             hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 14.sp,overflow: TextOverflow.ellipsis),
//                             prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             border: InputBorder.none,
//                             suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                             suffixIcon: !controller.text.trim().isEmpty?
//                             IconButton(
//                               icon:Icon(
//                                 Icons.close,
//                                 color: Color(0xff6D6D6D),
//                                 size: 20.sp,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   controller.clear();
//                                 });
//                               },
//                             ):SizedBox(),
//                           )
//                       ),
//                     ),
//                     SizedBox(height: 52.h,),
//                     InkWell(
//                       onTap: () async {
//                         if (controller.text.trim().isNotEmpty) {
//                           var uuid = Uuid();
//                           var box = await Hive.openBox<HistoryModel>('generatehistory');
//                           final hist = HistoryModel(
//                               data: state==4?"https://x.com/${controller.text.trim().toString().replaceAll("@", "")}"
//                                   :state==6?"https://www.instagram.com/${controller.text.trim().toString().replaceAll("@", "")}"
//                                   :controller.text.toString(),
//                               id: uuid.v1().replaceAll("-", ""),
//                               datesubmitted: DateTime.now().millisecondsSinceEpoch,
//                               type: state==1?
//                               "Text":
//                               state==2?
//                               "Website":
//                               state==3?"WhatsApp":
//                               state==4?"X":
//                               state==5?"Email":
//                               state==6?"Instagram":"Phone",
//                               img: state==1?
//                               'assets/v1.png':
//                               state==2?
//                               'assets/v2.png':
//                               state==3?'assets/v3.png':
//                               state==4?'assets/v4.png':
//                               state==5?'assets/v5.png':
//                               state==6?'assets/v6.png':'assets/v7.png'
//                           );
//                           await box.add(
//                               hist
//                           );
//                           controller.clear();
//                           Get.to(ResultScreen(result: hist,));
//                         }
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(14.sp),
//                         decoration: BoxDecoration(
//                             color: controller.text.trim().isEmpty?Colors.grey:clrs.gold,
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
