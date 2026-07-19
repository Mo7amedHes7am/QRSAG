// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// int b = 1;
//
// StatefulBuilder CustomTabBar({
//   required Widget Screen1,
//   required Widget Screen2,
//   required BuildContext context
// }){
//   return StatefulBuilder(
//     builder: (context, setState) => Column(
//       children: [
//         SizedBox(height: 35.h,),
//         Container(
//           width: MediaQuery.of(context).size.width - 96.w,
//           padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 6.h),
//           height: 60.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.sp),
//             color: clrs.background,
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     b = 1;
//                   });
//                 },
//                 child: Container(
//                   width: (MediaQuery.of(context).size.width - 108.w)/2,
//                   height: 48.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6.sp),
//                     color: b==1?clrs.gold:Colors.transparent,
//                   ),
//                   child: Center(
//                     child: Text("Scan",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 17.sp,
//                           fontFamily: "Itim",
//                           color: Colors.white
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     b = 2;
//                   });
//                 },
//                 child: Container(
//                   width: (MediaQuery.of(context).size.width - 108.w)/2,
//                   height: 48.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6.sp),
//                     color: b==2?clrs.gold:Colors.transparent,
//                   ),
//                   child: Center(
//                     child: Text("Generate",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 17.sp,
//                           fontFamily: "Itim",
//                           color: Colors.white
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//         SizedBox(height: 39.h,),
//         Expanded(
//           child: SingleChildScrollView(
//             child: b==1 ? Screen1: Screen2,
//           ),
//         ),
//
//       ],
//     ),
//   );
// }
