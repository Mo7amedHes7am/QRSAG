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
// class GenerateContactScreen extends StatefulWidget {
//   const GenerateContactScreen({super.key});
//
//   @override
//   State<GenerateContactScreen> createState() => _GenerateContactScreenState();
// }
//
// late TextEditingController firstnamecontroller, lastnamecontroller, companycontroller, jobcontroller, phonecontroller,
//     emailcontroller, websitecontroller, addresscontroller, citycontroller, countrycontroller;
//
// class _GenerateContactScreenState extends State<GenerateContactScreen> {
//
//   @override
//   void initState() {
//     firstnamecontroller = TextEditingController();
//     lastnamecontroller = TextEditingController();
//     companycontroller = TextEditingController();
//     jobcontroller = TextEditingController();
//     phonecontroller = TextEditingController();
//     emailcontroller = TextEditingController();
//     websitecontroller = TextEditingController();
//     addresscontroller = TextEditingController();
//     citycontroller = TextEditingController();
//     countrycontroller = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     firstnamecontroller.dispose();
//     lastnamecontroller.dispose();
//     companycontroller.dispose();
//     jobcontroller.dispose();
//     phonecontroller.dispose();
//     emailcontroller.dispose();
//     websitecontroller.dispose();
//     addresscontroller.dispose();
//     citycontroller.dispose();
//     countrycontroller.dispose();
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
//         title: Text("Contact",
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
//                       'assets/g5.svg',
//                       color: clrs.gold,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(height: 30.h,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("First Name *",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 8.h,),
//                             Container(
//                               height: 45.h,
//                               width: 128.w,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 color: clrs.background,
//                                 borderRadius: BorderRadius.circular(8.sp),
//                               ),
//                               child: TextFormField(
//                                   textAlignVertical: TextAlignVertical.center,
//                                   cursorColor: clrs.gold,
//                                   controller: firstnamecontroller,
//                                   onChanged: (value) {
//                                     setState(() {
//
//                                     });
//                                   },
//                                   style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                     hintText: "Enter Name",
//                                     hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                                     prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     border: InputBorder.none,
//                                     suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                     suffixIcon: !firstnamecontroller.text.trim().isEmpty?
//                                     IconButton(
//                                       icon:Icon(
//                                         Icons.close,
//                                         color: Color(0xff6D6D6D),
//                                         size: 20.sp,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           firstnamecontroller.clear();
//                                         });
//                                       },
//                                     ):SizedBox(),
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Last Name *",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 8.h,),
//                             Container(
//                               height: 45.h,
//                               width: 128.w,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 color: clrs.background,
//                                 borderRadius: BorderRadius.circular(8.sp),
//                               ),
//                               child: TextFormField(
//                                   textAlignVertical: TextAlignVertical.center,
//                                   cursorColor: clrs.gold,
//                                   controller: lastnamecontroller,
//                                   onChanged: (value) {
//                                     setState(() {
//
//                                     });
//                                   },
//                                   style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                     hintText: "Enter Name",
//                                     hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                                     prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     border: InputBorder.none,
//                                     suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                     suffixIcon: !lastnamecontroller.text.trim().isEmpty?
//                                     IconButton(
//                                       icon:Icon(
//                                         Icons.close,
//                                         color: Color(0xff6D6D6D),
//                                         size: 20.sp,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           lastnamecontroller.clear();
//                                         });
//                                       },
//                                     ):SizedBox(),
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 18.h,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Company",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 8.h,),
//                             Container(
//                               height: 45.h,
//                               width: 128.w,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 color: clrs.background,
//                                 borderRadius: BorderRadius.circular(8.sp),
//                               ),
//                               child: TextFormField(
//                                   textAlignVertical: TextAlignVertical.center,
//                                   cursorColor: clrs.gold,
//                                   controller: companycontroller,
//                                   onChanged: (value) {
//                                     setState(() {
//
//                                     });
//                                   },
//                                   style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                     hintText: "Enter Company",
//                                     hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                                     prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     border: InputBorder.none,
//                                     suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                     suffixIcon: !companycontroller.text.trim().isEmpty?
//                                     IconButton(
//                                       icon:Icon(
//                                         Icons.close,
//                                         color: Color(0xff6D6D6D),
//                                         size: 20.sp,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           companycontroller.clear();
//                                         });
//                                       },
//                                     ):SizedBox(),
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Job",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 8.h,),
//                             Container(
//                               height: 45.h,
//                               width: 128.w,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 color: clrs.background,
//                                 borderRadius: BorderRadius.circular(8.sp),
//                               ),
//                               child: TextFormField(
//                                   textAlignVertical: TextAlignVertical.center,
//                                   cursorColor: clrs.gold,
//                                   controller: jobcontroller,
//                                   onChanged: (value) {
//                                     setState(() {
//
//                                     });
//                                   },
//                                   style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                     hintText: "Enter Job",
//                                     hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                                     prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     border: InputBorder.none,
//                                     suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                     suffixIcon: !jobcontroller.text.trim().isEmpty?
//                                     IconButton(
//                                       icon:Icon(
//                                         Icons.close,
//                                         color: Color(0xff6D6D6D),
//                                         size: 20.sp,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           jobcontroller.clear();
//                                         });
//                                       },
//                                     ):SizedBox(),
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 18.h,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Phone *",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 8.h,),
//                             Container(
//                               height: 45.h,
//                               width: 128.w,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 color: clrs.background,
//                                 borderRadius: BorderRadius.circular(8.sp),
//                               ),
//                               child: TextFormField(
//                                   textAlignVertical: TextAlignVertical.center,
//                                   cursorColor: clrs.gold,
//                                   controller: phonecontroller,
//                                   onChanged: (value) {
//                                     setState(() {
//
//                                     });
//                                   },
//                                   style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                     hintText: "Enter phone",
//                                     hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                                     prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     border: InputBorder.none,
//                                     suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                     suffixIcon: !phonecontroller.text.trim().isEmpty?
//                                     IconButton(
//                                       icon:Icon(
//                                         Icons.close,
//                                         color: Color(0xff6D6D6D),
//                                         size: 20.sp,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           phonecontroller.clear();
//                                         });
//                                       },
//                                     ):SizedBox(),
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Email",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 8.h,),
//                             Container(
//                               height: 45.h,
//                               width: 128.w,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 color: clrs.background,
//                                 borderRadius: BorderRadius.circular(8.sp),
//                               ),
//                               child: TextFormField(
//                                   textAlignVertical: TextAlignVertical.center,
//                                   cursorColor: clrs.gold,
//                                   controller: emailcontroller,
//                                   onChanged: (value) {
//                                     setState(() {
//
//                                     });
//                                   },
//                                   style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                     hintText: "Enter email",
//                                     hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                                     prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     border: InputBorder.none,
//                                     suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                     suffixIcon: !emailcontroller.text.trim().isEmpty?
//                                     IconButton(
//                                       icon:Icon(
//                                         Icons.close,
//                                         color: Color(0xff6D6D6D),
//                                         size: 20.sp,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           emailcontroller.clear();
//                                         });
//                                       },
//                                     ):SizedBox(),
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Website",
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
//                           controller: websitecontroller,
//                           onChanged: (value) {
//                             setState(() {
//
//                             });
//                           },
//                           style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                           decoration: InputDecoration(
//                             isCollapsed: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                             hintText: "Enter Website",
//                             hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                             prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             border: InputBorder.none,
//                             suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                             suffixIcon: !websitecontroller.text.trim().isEmpty?
//                             IconButton(
//                               icon:Icon(
//                                 Icons.close,
//                                 color: Color(0xff6D6D6D),
//                                 size: 20.sp,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   websitecontroller.clear();
//                                 });
//                               },
//                             ):SizedBox(),
//                           )
//                       ),
//                     ),
//                     SizedBox(height: 18.h,),
//                     SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Text("Address",
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
//                           controller: addresscontroller,
//                           onChanged: (value) {
//                             setState(() {
//
//                             });
//                           },
//                           style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                           decoration: InputDecoration(
//                             isCollapsed: true,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                             hintText: "Enter Address",
//                             hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                             prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             border: InputBorder.none,
//                             suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                             suffixIcon: !addresscontroller.text.trim().isEmpty?
//                             IconButton(
//                               icon:Icon(
//                                 Icons.close,
//                                 color: Color(0xff6D6D6D),
//                                 size: 20.sp,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   addresscontroller.clear();
//                                 });
//                               },
//                             ):SizedBox(),
//                           )
//                       ),
//                     ),
//                     SizedBox(height: 18.h,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("City",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 8.h,),
//                             Container(
//                               height: 45.h,
//                               width: 128.w,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 color: clrs.background,
//                                 borderRadius: BorderRadius.circular(8.sp),
//                               ),
//                               child: TextFormField(
//                                   textAlignVertical: TextAlignVertical.center,
//                                   cursorColor: clrs.gold,
//                                   controller: citycontroller,
//                                   onChanged: (value) {
//                                     setState(() {
//
//                                     });
//                                   },
//                                   style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                     hintText: "Enter city",
//                                     hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                                     prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     border: InputBorder.none,
//                                     suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                     suffixIcon: !citycontroller.text.trim().isEmpty?
//                                     IconButton(
//                                       icon:Icon(
//                                         Icons.close,
//                                         color: Color(0xff6D6D6D),
//                                         size: 20.sp,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           citycontroller.clear();
//                                         });
//                                       },
//                                     ):SizedBox(),
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Country",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: Colors.white
//                               ),
//                               textAlign: TextAlign.start,
//                             ),
//                             SizedBox(height: 8.h,),
//                             Container(
//                               height: 45.h,
//                               width: 128.w,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 color: clrs.background,
//                                 borderRadius: BorderRadius.circular(8.sp),
//                               ),
//                               child: TextFormField(
//                                   textAlignVertical: TextAlignVertical.center,
//                                   cursorColor: clrs.gold,
//                                   controller: countrycontroller,
//                                   onChanged: (value) {
//                                     setState(() {
//
//                                     });
//                                   },
//                                   style: TextStyle(color: clrs.gold,fontSize: 12.sp),
//                                   decoration: InputDecoration(
//                                     isCollapsed: true,
//                                     contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
//                                     hintText: "Enter country",
//                                     hintStyle: TextStyle(color: Color(0xff6D6D6D), fontSize: 12.sp,overflow: TextOverflow.ellipsis),
//                                     prefixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     border: InputBorder.none,
//                                     suffixIconConstraints: BoxConstraints.expand(width: 40.sp),
//                                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: clrs.gold,width: 2.sp),borderRadius: BorderRadius.circular(8.sp)),
//                                     suffixIcon: !countrycontroller.text.trim().isEmpty?
//                                     IconButton(
//                                       icon:Icon(
//                                         Icons.close,
//                                         color: Color(0xff6D6D6D),
//                                         size: 20.sp,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           countrycontroller.clear();
//                                         });
//                                       },
//                                     ):SizedBox(),
//                                   )
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 52.h,),
//                     InkWell(
//                       onTap: () async {
//                         if (
//                         firstnamecontroller.text.trim().isNotEmpty
//                             && lastnamecontroller.text.trim().isNotEmpty
//                             && phonecontroller.text.trim().isNotEmpty
//                         ) {
//                           var uuid = Uuid();
//                           var box = await Hive.openBox<HistoryModel>('generatehistory');
//                           final hist = HistoryModel(
//                               data: "CONTACT:N:${firstnamecontroller.text.toString()+" "+lastnamecontroller.text.toString()};"
//                                   "C:${companycontroller.text.trim().isNotEmpty?companycontroller.text.toString():"No Company"};"
//                                   "J:${jobcontroller.text.trim().isNotEmpty?jobcontroller.text.toString():"No Job"};"
//                                   "P:${phonecontroller.text.toString()};"
//                                   "E:${emailcontroller.text.trim().isNotEmpty?emailcontroller.text.toString():"No Email"};"
//                                   "W:${websitecontroller.text.trim().isNotEmpty?websitecontroller.text.toString():"No Website"};"
//                                   "A:${addresscontroller.text.trim().isNotEmpty?addresscontroller.text.toString():"No Address"};"
//                                   "Ci:${citycontroller.text.trim().isNotEmpty?citycontroller.text.toString():"No City"};"
//                                   "Co:${countrycontroller.text.trim().isNotEmpty?countrycontroller.text.toString():"No Country"};;",
//                               id: uuid.v1().replaceAll("-", ""),
//                               datesubmitted: DateTime.now().millisecondsSinceEpoch,
//                               type: 'Contact',
//                               img: 'assets/v10.png'
//                           );
//                           await box.add(
//                               hist
//                           );
//                           firstnamecontroller.clear();
//                           lastnamecontroller.clear();
//                           companycontroller.clear();
//                           jobcontroller.clear();
//                           phonecontroller.clear();
//                           emailcontroller.clear();
//                           websitecontroller.clear();
//                           addresscontroller.clear();
//                           citycontroller.clear();
//                           countrycontroller.clear();
//                           Get.to(ResultScreen(result: hist,));
//                         }
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(14.sp),
//                         decoration: BoxDecoration(
//                             color: (
//                                 firstnamecontroller.text.trim().isEmpty
//                                     && lastnamecontroller.text.trim().isEmpty
//                                     && phonecontroller.text.trim().isEmpty
//                             ) ?Colors.grey:clrs.gold,
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
