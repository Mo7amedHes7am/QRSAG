// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:qr_scanner_and_generator/Methods/Models/formatter.dart';
// import 'package:qr_scanner_and_generator/main.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class UrlMessage extends StatefulWidget {
//   const UrlMessage({
//     Key? key,
//     required this.textContent,
//     required this.textColor,
//     required this.isMyMessage,
//   }) : super(key: key);
//
//   final String textContent;
//   final Color textColor;
//   final bool isMyMessage;
//
//   @override
//   State<UrlMessage> createState() => _UrlMessageState();
// }
//
// class _UrlMessageState extends State<UrlMessage> {
//   final formatter = Formatter();
//
//   @override
//   Widget build(BuildContext context) {
//     final text = widget.textContent;
//     final textColor = widget.textColor;
//     final isMyMessage = widget.isMyMessage;
//
//     final linkTextStyle = TextStyle(
//       color: isMyMessage ? Colors.blueAccent : clrs.gold,
//       fontSize: 15.sp,
//       fontFamily: "Itim",
//       fontWeight: FontWeight.bold,
//       decoration: TextDecoration.underline,
//     );
//
//     return RichText(
//       text: TextSpan(
//         children: text.split(' ').map((word) {
//           if (formatter.hasURLs(word)) {
//             return TextSpan(
//               text: word,
//               style: linkTextStyle,
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   launchUrl(Uri.parse(word));
//                 },
//             );
//           } else {
//             return TextSpan(
//               text: '$word ',
//               style: TextStyle(color: textColor, fontSize: 13),
//             );
//           }
//         }).toList(),
//       ),
//     );
//   }
// }
