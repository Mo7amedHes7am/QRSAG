// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:qr_scanner_and_generator/Design/NavigationBar/NavigationBar.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
//
// late int x;
// final _avatarKey = GlobalKey();
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     x = 0;
//     Future.delayed(Duration(seconds: 5)).then((value) async {
//       if (await prefs.getBool('done_boarding') == null || await prefs.getBool('done_boarding') == false) {
//         setState(() {
//           x = 1;
//         });
//       }else{
//         Get.offAll(
//               () => NavigationBarScreen(),
//           transition: Transition.circularReveal,
//           curve: Curves.fastOutSlowIn,
//           duration: Duration(seconds: 3),
//         );
//       }
//     },);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return x==0?SplashPage(context):GetStartedPage(context);
//   }
//
//   Widget SplashPage(BuildContext context){
//     return Scaffold(
//       backgroundColor: clrs.background,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               width: 200.sp,
//               height: 200.sp,
//               'assets/qrlogogold.svg',
//               fit: BoxFit.cover,
//             ),
//             Image(
//               image: AssetImage('assets/loading.gif'),
//               color: clrs.gold,
//               width: 125.sp,
//               height: 125.sp,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget GetStartedPage(BuildContext context) {
//     return Scaffold(
//       backgroundColor: clrs.gold,
//       body: Center(
//         child: Container(
//           height: MediaQuery.sizeOf(context).height,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 width: 200.sp,
//                 height: 200.sp,
//                 'assets/qrlogogold.svg',
//                 color: clrs.background,
//                 fit: BoxFit.cover,
//               ),
//               SizedBox(height: 232.h,),
//               ClipPath(
//                 clipper: WaveClipperOne(flip: true,reverse: true),
//                 child: Container(
//                   width: MediaQuery.sizeOf(context).width,
//                   color: clrs.background,
//                   padding: EdgeInsets.symmetric(vertical: 48.h),
//                   child: Center(
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Get ",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: "Itim",
//                                   fontSize: 42.sp,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.only(bottom: 0.h),
//                                 decoration: BoxDecoration(
//                                   border: Border(
//                                     bottom: BorderSide(
//                                       color: clrs.gold,
//                                       width: 5.sp,
//                                     )
//                                   )
//                                 ),
//                                 child: Text("Started",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: "Itim",
//                                     fontSize: 42.sp,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(height: 13.h,),
//                           SizedBox(
//                             width: 273.w,
//                             child: RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.grey,
//                                     fontSize: 17.sp,
//                                     fontFamily: "Itim"
//                                   ),
//                                     text: "Go and enjoy our features for free and make your life easy with us."
//                                 ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           SizedBox(height: 20.h,),
//                           InkWell(
//                             onTap: () async {
//                               await prefs.setBool('done_boarding', true);
//                               Get.offAll(
//                                     () => NavigationBarScreen(),
//                                 transition: Transition.circularReveal,
//                                 curve: Curves.fastOutSlowIn,
//                                 duration: Duration(seconds: 3),
//                               );
//
//                             },
//                             child: Container(
//                               key: _avatarKey,
//                               width: 80.sp,
//                               height: 80.sp,
//                               decoration: BoxDecoration(
//                                 color: clrs.gold,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: clrs.gold.withOpacity(0.5),
//                                     spreadRadius: 5.sp,
//                                     blurRadius: 7.sp,
//                                     offset: Offset(0, 3), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Center(
//                                 child: Icon(Icons.arrow_forward,color: clrs.background,size: 35.sp,),
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
