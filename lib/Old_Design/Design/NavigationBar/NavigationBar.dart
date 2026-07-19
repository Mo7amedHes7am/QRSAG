// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:qr_scanner_and_generator/Design/Generate/GenerateScreen.dart';
// import 'package:qr_scanner_and_generator/Design/History/HistoryScreen.dart';
// import 'package:qr_scanner_and_generator/Design/Home/HomeScreen.dart';
// import 'package:qr_scanner_and_generator/main.dart';
//
// class NavigationBarScreen extends StatefulWidget {
//   const NavigationBarScreen({super.key});
//
//   @override
//   State<NavigationBarScreen> createState() => _NavigationBarScreenState();
// }
//
// final Pages = [GenerateScreen(),HomeScreen(),HistoryScreen()];
// int selected = 1;
// class _NavigationBarScreenState extends State<NavigationBarScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       extendBody: true,
//       body: Pages[selected],
//       bottomNavigationBar: Container(
//         height: 67.h,
//         decoration: BoxDecoration(
//           color: clrs.background,
//           borderRadius: BorderRadius.circular(6.sp)
//         ),
//         margin: EdgeInsets.only(bottom: 33.h,left: 46.w,right: 46.w),
//         child: Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     selected=0;
//                   });
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 0.h),
//                   decoration: BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                             color: selected==0?clrs.gold:Colors.transparent,
//                             width: 4.sp,
//                           )
//                       )
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.qr_code_2_rounded,
//                         color: selected==0?clrs.gold:Colors.grey,
//                         size: (25).sp,
//                       ),
//                       Text("Generate",
//                         style: TextStyle(
//                           fontFamily: "Itim",
//                           fontSize: 17.sp,
//                           color: selected==0?clrs.gold:Colors.grey,
//                           fontWeight: FontWeight.w400
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     selected=1;
//                   });
//                 },
//                 child: Transform.translate(
//                   offset: Offset(0, -35.h),
//                   child: Container(
//                     width: 70.sp,
//                     height: 70.sp,
//                     decoration: BoxDecoration(
//                       color: selected==1?clrs.gold:Colors.grey,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: clrs.gold.withOpacity(0.5),
//                           spreadRadius: 5.sp,
//                           blurRadius: 7.sp,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Icon(Icons.qr_code_scanner_rounded,color: clrs.background,size: 40.sp,),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: (){
//                   setState(() {
//                     selected=2;
//                   });
//                 },
//                 child: Container(
//                   padding: EdgeInsets.only(bottom: 0.h),
//                   decoration: BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                             color: selected==2?clrs.gold:Colors.transparent,
//                             width: 4.sp,
//                           )
//                       )
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.history,
//                         color: selected==2?clrs.gold:Colors.grey,
//                         size: (25).sp,
//                       ),
//                       Text("History",
//                         style: TextStyle(
//                           fontFamily: "Itim",
//                           fontSize: 17.sp,
//                           color: selected==2?clrs.gold:Colors.grey,
//                           fontWeight: FontWeight.w400
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
