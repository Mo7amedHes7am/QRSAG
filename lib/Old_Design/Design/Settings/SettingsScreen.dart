// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:in_app_review/in_app_review.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// late bool beep, vibrate;
//
// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends State<SettingsScreen> {
//
//   @override
//   void initState() {
//     if (prefs.getBool('beep') == null) {
//       beep = true;
//     }else{
//       beep = prefs.getBool('beep')!;
//     }
//     if (prefs.getBool('vibrate') == null) {
//       vibrate = true;
//     }else{
//       vibrate = prefs.getBool('vibrate')!;
//     }
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
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
//         padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 30.h),
//         child: Column(
//           children: [
//             SizedBox(
//               width: MediaQuery.sizeOf(context).width,
//               child: Text("Settings",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 26.sp,
//                     fontFamily: "Itim",
//                     color: clrs.gold
//                 ),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//             SizedBox(height: 29.h,),
//             Container(
//               width: 378.w,
//               padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(10.sp)
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     SvgPicture.asset(
//                       width: 24.sp,
//                       height: 24.sp,
//                       'assets/vibrates.svg',
//                       color: clrs.gold,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(width: 12.w,),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Vibrate",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16.sp,
//                               fontFamily: "Itim",
//                               color: Colors.white
//                           ),
//                           textAlign: TextAlign.start,
//                         ),
//                         SizedBox(
//                           width: 260.w,
//                           child: Text("Vibration when scan is done.",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14.sp,
//                                 fontFamily: "Itim",
//                                 color: Colors.grey
//                             ),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 40.sp,
//                       height: 40.sp,
//                       child: Switch(
//                           value: vibrate,
//                           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           inactiveTrackColor: Colors.grey,
//                           activeTrackColor: clrs.gold,
//                           onChanged: (value) async {
//                             await prefs.setBool('vibrate', !vibrate);
//                             setState(() {
//                               vibrate = !vibrate;
//                             });
//                           },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 19.h,),
//             Container(
//               width: 378.w,
//               padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(10.sp)
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     SvgPicture.asset(
//                       width: 24.sp,
//                       height: 24.sp,
//                       'assets/bepp.svg',
//                       color: clrs.gold,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(width: 12.w,),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Beep",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16.sp,
//                               fontFamily: "Itim",
//                               color: Colors.white
//                           ),
//                           textAlign: TextAlign.start,
//                         ),
//                         SizedBox(
//                           width: 260.w,
//                           child: Text("Beep when scan is done.",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 14.sp,
//                                 fontFamily: "Itim",
//                                 color: Colors.grey
//                             ),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 40.sp,
//                       height: 40.sp,
//                       child: Switch(
//                         value: beep,
//                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                         inactiveTrackColor: Colors.grey,
//                         activeTrackColor: clrs.gold,
//                         onChanged: (value) async {
//                           await prefs.setBool('beep', !vibrate);
//                           setState(() {
//                             vibrate = !vibrate;
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 64.h,),
//             SizedBox(
//               width: MediaQuery.sizeOf(context).width,
//               child: Text("Support",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 26.sp,
//                     fontFamily: "Itim",
//                     color: clrs.gold
//                 ),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//             SizedBox(height: 28.h,),
//
//             InkWell(
//               onTap: () {
//                 final InAppReview inAppReview = InAppReview.instance;
//                 inAppReview.openStoreListing();
//               },
//               child: Container(
//                 width: 378.w,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.3),
//                     borderRadius: BorderRadius.only(topRight: Radius.circular(10.sp),topLeft: Radius.circular(10.sp)),
//                   border: Border(bottom: BorderSide(color: Colors.white))
//                 ),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         width: 24.sp,
//                         height: 24.sp,
//                         'assets/rateus.svg',
//                         color: clrs.gold,
//                         fit: BoxFit.cover,
//                       ),
//                       SizedBox(width: 12.w,),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Rate Us",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16.sp,
//                                 fontFamily: "Itim",
//                                 color: Colors.white
//                             ),
//                             textAlign: TextAlign.start,
//                           ),
//                           SizedBox(
//                             width: 260.w,
//                             child: Text("Your best reward to us.",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.grey
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () async {
//                 final Uri params = Uri(
//                   scheme: 'mailto',
//                   path: 'exapps.info@gmail.com',
//                   query: 'subject=QR Scanner Feedback And Recommendation&body=App Version 1.00',
//                 );
//                 var url = params.toString();
//                 if (await canLaunch(url)) {
//                 await launch(url);
//                 } else {
//                 throw 'Could not launch $url';
//                 }
//               },
//               child: Container(
//                 width: 378.w,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.3),
//                   border: Border(bottom: BorderSide(color: Colors.white))
//                 ),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       Icon(Icons.support_agent_rounded,color: clrs.gold,size: 24.sp,),
//                       SizedBox(width: 12.w,),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Contact Us",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16.sp,
//                                 fontFamily: "Itim",
//                                 color: Colors.white
//                             ),
//                             textAlign: TextAlign.start,
//                           ),
//                           SizedBox(
//                             width: 260.w,
//                             child: Text("Recommend to us any modifications or improvements we can do.",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.grey
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 launchUrl(Uri.parse("https://exapps-website.vercel.app/Privacy%20Policy/QR_Code_Scanner"));
//               },
//               child: Container(
//                 width: 378.w,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.3),
//                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.sp),bottomLeft: Radius.circular(10.sp)),
//                 ),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         width: 24.sp,
//                         height: 24.sp,
//                         'assets/privacy.svg',
//                         color: clrs.gold,
//                         fit: BoxFit.cover,
//                       ),
//                       SizedBox(width: 12.w,),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Privacy Policy",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16.sp,
//                                 fontFamily: "Itim",
//                                 color: Colors.white
//                             ),
//                             textAlign: TextAlign.start,
//                           ),
//                           SizedBox(
//                             width: 260.w,
//                             child: Text("Follow our policies that benefits you.",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.grey
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
