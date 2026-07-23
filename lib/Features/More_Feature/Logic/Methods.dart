import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/utils/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchEmail() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'pr.mohamedsefain@gmail.com',
    query:
        'subject=QR Scanner Feedback And Recommendation&body=App Version $version_Number',
  );
  final url = params.toString();
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    debugPrint('Could not launch $url');
  }
}

void launchPrivacyPolicy(BuildContext context) {
  launchUrl(
    Uri.parse(
      "https://privacy-policy-theta-ecru.vercel.app/${context.locale.languageCode}/QRSAG-PP",
    ),
  );
}
