// import 'package:encrypt_decrypt_plus/encrypt_decrypt/xor.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:qr_scanner_and_generator/Design/Result/ResultScreen.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/HistoryModel.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:uuid/uuid.dart';
//
// class GenerateVisaScreen extends StatefulWidget {
//   const GenerateVisaScreen({super.key});
//
//   @override
//   State<GenerateVisaScreen> createState() => _GenerateVisaScreenState();
// }
//
// final GlobalKey<FormState> formKey = GlobalKey<FormState>();
// late bool isCvvFocused,
//     useGlassMorphism,
//     useBackgroundImage,
//     useFloatingAnimation,
//     valid;
// late String cardNumber, expiryDate, cardHolderName, cvvCode;
// late TextEditingController holdername, cardnum, cvv, expiry;
// final OutlineInputBorder border = OutlineInputBorder(
//   borderSide: BorderSide(
//     color: Colors.grey.withOpacity(0.7),
//     width: 2.sp,
//   ),
// );
//
// class _GenerateVisaScreenState extends State<GenerateVisaScreen> {
//   @override
//   void initState() {
//     cardNumber = '';
//     expiryDate = '';
//     cardHolderName = '';
//     cvvCode = '';
//     isCvvFocused = false;
//     valid = false;
//     useGlassMorphism = true;
//     useBackgroundImage = false;
//     useFloatingAnimation = true;
//     holdername = TextEditingController();
//     cardnum = TextEditingController();
//     cvv = TextEditingController();
//     expiry = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     holdername.dispose();
//     cardnum.dispose();
//     cvv.dispose();
//     expiry.dispose();
//     cardNumber = '';
//     expiryDate = '';
//     cardHolderName = '';
//     cvvCode = '';
//     isCvvFocused = false;
//     valid = false;
//     useGlassMorphism = true;
//     useBackgroundImage = false;
//     useFloatingAnimation = true;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: clrs.background,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         surfaceTintColor: Colors.transparent,
//         foregroundColor: Colors.transparent,
//         leadingWidth: 100.w,
//         toolbarHeight: 80.h,
//         title: Text(
//           "Visa Card",
//           style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 27.sp,
//               fontFamily: "Itim",
//               color: Colors.white,
//               height: 0.9),
//           maxLines: 2,
//         ),
//         leading: Row(
//           children: [
//             SizedBox(
//               width: 46.w,
//             ),
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
//                 child: BackButton(
//                   color: clrs.gold,
//                   style: ButtonStyle(iconSize: WidgetStatePropertyAll(24.sp)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(top: 42.h, right: 46.w, left: 46.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 336.w,
//               padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 35.h),
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
//                   )),
//               child: Center(
//                 child: Column(
//                   children: [
//                     CreditCardWidget(
//                       enableFloatingCard: useFloatingAnimation,
//                       glassmorphismConfig: _getGlassmorphismConfig(),
//                       cardNumber: cardNumber,
//                       expiryDate: expiryDate,
//                       cardHolderName: cardHolderName,
//                       cvvCode: cvvCode,
//                       width: 336.w,
//                       chipColor: clrs.gold,
//                       isChipVisible: true,
//                       textStyle: TextStyle(
//                         color: Colors.white,
//                         fontFamily: "Itim",
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       bankName: 'Exapps Bank',
//                       frontCardBorder: useGlassMorphism
//                           ? null
//                           : Border.all(color: Colors.grey),
//                       backCardBorder: useGlassMorphism
//                           ? null
//                           : Border.all(color: Colors.grey),
//                       showBackView: isCvvFocused,
//                       obscureCardNumber: true,
//                       obscureCardCvv: true,
//                       isHolderNameVisible: true,
//                       cardBgColor: clrs.gold,
//                       backgroundImage:
//                           useBackgroundImage ? 'assets/card_bg.png' : null,
//                       isSwipeGestureEnabled: true,
//                       onCreditCardWidgetChange:
//                           (CreditCardBrand creditCardBrand) {},
//                       customCardTypeIcons: <CustomCardTypeIcon>[
//                         CustomCardTypeIcon(
//                           cardType: CardType.mastercard,
//                           cardImage: Image.asset(
//                             'assets/mastercard.png',
//                             height: 48.sp,
//                             width: 48.sp,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SingleChildScrollView(
//                       child: Column(
//                         children: <Widget>[
//                           CreditCardForm(
//                             formKey: formKey,
//                             obscureCvv: true,
//                             obscureNumber: true,
//                             cardNumber: cardNumber,
//                             cvvCode: cvvCode,
//                             isHolderNameVisible: true,
//                             isCardNumberVisible: true,
//                             isExpiryDateVisible: true,
//                             cardHolderName: cardHolderName,
//                             expiryDate: expiryDate,
//                             inputConfiguration: InputConfiguration(
//                               cardNumberTextStyle: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: clrs.gold),
//                               expiryDateTextStyle: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: clrs.gold),
//                               cvvCodeTextStyle: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: clrs.gold),
//                               cardHolderTextStyle: TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.sp,
//                                   fontFamily: "Itim",
//                                   color: clrs.gold),
//                               cardNumberDecoration: InputDecoration(
//                                 labelStyle: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14.sp,
//                                     fontFamily: "Itim",
//                                     color: Colors.white),
//                                 isCollapsed: false,
//                                 contentPadding:
//                                     EdgeInsets.symmetric(horizontal: 8.w),
//                                 hintText: "Number",
//                                 labelText: "Card Number",
//                                 hintStyle: TextStyle(
//                                     color: Color(0xff6D6D6D),
//                                     fontSize: 12.sp,
//                                     overflow: TextOverflow.ellipsis),
//                                 border: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: clrs.gold, width: 2.sp),
//                                     borderRadius: BorderRadius.circular(8.sp)),
//                                 suffixIcon: !cardnum.text.trim().isEmpty
//                                     ? IconButton(
//                                         icon: Icon(
//                                           Icons.close,
//                                           color: Color(0xff6D6D6D),
//                                           size: 20.sp,
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             cardnum.clear();
//                                           });
//                                         },
//                                       )
//                                     : SizedBox(),
//                               ),
//                               expiryDateDecoration: InputDecoration(
//                                 labelStyle: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14.sp,
//                                     fontFamily: "Itim",
//                                     color: Colors.white),
//                                 isCollapsed: false,
//                                 contentPadding:
//                                     EdgeInsets.symmetric(horizontal: 8.w),
//                                 hintText: "Expiry",
//                                 labelText: "Expiry",
//                                 hintStyle: TextStyle(
//                                     color: Color(0xff6D6D6D),
//                                     fontSize: 12.sp,
//                                     overflow: TextOverflow.ellipsis),
//                                 border: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: clrs.gold, width: 2.sp),
//                                     borderRadius: BorderRadius.circular(8.sp)),
//                                 suffixIcon: !expiry.text.trim().isEmpty
//                                     ? IconButton(
//                                         icon: Icon(
//                                           Icons.close,
//                                           color: Color(0xff6D6D6D),
//                                           size: 20.sp,
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             expiry.clear();
//                                           });
//                                         },
//                                       )
//                                     : SizedBox(),
//                               ),
//                               cvvCodeDecoration: InputDecoration(
//                                 labelStyle: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14.sp,
//                                     fontFamily: "Itim",
//                                     color: Colors.white),
//                                 isCollapsed: false,
//                                 contentPadding:
//                                     EdgeInsets.symmetric(horizontal: 8.w),
//                                 hintText: "CVV",
//                                 labelText: "CVV",
//                                 hintStyle: TextStyle(
//                                     color: Color(0xff6D6D6D),
//                                     fontSize: 12.sp,
//                                     overflow: TextOverflow.ellipsis),
//                                 border: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: clrs.gold, width: 2.sp),
//                                     borderRadius: BorderRadius.circular(8.sp)),
//                                 suffixIcon: !cvv.text.trim().isEmpty
//                                     ? IconButton(
//                                         icon: Icon(
//                                           Icons.close,
//                                           color: Color(0xff6D6D6D),
//                                           size: 20.sp,
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             cvv.clear();
//                                           });
//                                         },
//                                       )
//                                     : SizedBox(),
//                               ),
//                               cardHolderDecoration: InputDecoration(
//                                 labelStyle: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 14.sp,
//                                     fontFamily: "Itim",
//                                     color: Colors.white),
//                                 isCollapsed: false,
//                                 contentPadding:
//                                     EdgeInsets.symmetric(horizontal: 8.w),
//                                 hintText: "Holder Name",
//                                 labelText: "Holder Name",
//                                 hintStyle: TextStyle(
//                                     color: Color(0xff6D6D6D),
//                                     fontSize: 12.sp,
//                                     overflow: TextOverflow.ellipsis),
//                                 border: OutlineInputBorder(),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: clrs.gold, width: 2.sp),
//                                     borderRadius: BorderRadius.circular(8.sp)),
//                                 suffixIcon: !holdername.text.trim().isEmpty
//                                     ? IconButton(
//                                         icon: Icon(
//                                           Icons.close,
//                                           color: Color(0xff6D6D6D),
//                                           size: 20.sp,
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             holdername.clear();
//                                           });
//                                         },
//                                       )
//                                     : SizedBox(),
//                               ),
//                             ),
//                             onCreditCardModelChange: onCreditCardModelChange,
//                           ),
//                           SizedBox(height: 20.h),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 32.h,
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         if (cardnum.text.trim().isNotEmpty &&
//                             expiry.text.trim().isNotEmpty &&
//                             holdername.text.trim().isNotEmpty &&
//                             cvv.text.isNotEmpty) {
//                           var uuid = Uuid();
//                           var id = uuid.v1().replaceAll("-", "");
//                           var box = await Hive.openBox<HistoryModel>(
//                               'generatehistory');
//                           XOR xor = XOR();
//
//                           var encrypted = xor.xorEncode(
//                             cardnum.text.toString(),
//                             secretKey: id,
//                           );
//                           final hist = HistoryModel(
//                               data: "VISA:N:${encrypted + '-VssEnc-' + id};"
//                                   "E:${expiry.text};"
//                                   "C:${holdername.text};"
//                                   "V:${cvv.text};;",
//                               id: id,
//                               datesubmitted:
//                                   DateTime.now().millisecondsSinceEpoch,
//                               type: 'Visa',
//                               img: 'assets/v12.png');
//                           await box.add(hist);
//                           setState(() {
//                             cardNumber = '';
//                             expiryDate = '';
//                             cardHolderName = '';
//                             cvvCode = '';
//                             isCvvFocused = false;
//                             useGlassMorphism = true;
//                             useBackgroundImage = false;
//                             useFloatingAnimation = true;
//                             cardnum.clear();
//                             expiry.clear();
//                             holdername.clear();
//                             cvv.clear();
//                           });
//                           Get.off(ResultScreen(
//                             result: hist,
//                           ));
//                         }
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(14.sp),
//                         decoration: BoxDecoration(
//                             color: (cardnum.text.trim().isEmpty &&
//                                     expiry.text.trim().isEmpty &&
//                                     holdername.text.trim().isEmpty &&
//                                     cvv.text.isEmpty)
//                                 ? Colors.grey
//                                 : clrs.gold,
//                             borderRadius: BorderRadius.circular(6.sp)),
//                         child: Center(
//                           child: Text(
//                             "Generate QR Code",
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
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _onValidate() {
//     if (formKey.currentState?.validate() ?? false) {
//       valid = true;
//     } else {
//       valid = false;
//     }
//   }
//
//   Glassmorphism? _getGlassmorphismConfig() {
//     if (!useGlassMorphism) {
//       return null;
//     }
//
//     final LinearGradient gradient = LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
//       stops: const <double>[0.3, 0],
//     );
//
//     return Glassmorphism.defaultConfig();
//   }
//
//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       _onValidate();
//       cardNumber = creditCardModel.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//       cardnum.text = creditCardModel.cardNumber;
//       expiry.text = creditCardModel.expiryDate;
//       holdername.text = creditCardModel.cardHolderName;
//       cvv.text = creditCardModel.cvvCode;
//     });
//   }
// }
