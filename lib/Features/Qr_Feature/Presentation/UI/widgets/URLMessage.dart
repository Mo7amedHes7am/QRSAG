import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlMessage extends StatefulWidget {
  const UrlMessage({
    super.key,
    required this.textContent,
    required this.textColor,
    required this.isMyMessage,
  });

  final String textContent;
  final Color textColor;
  final bool isMyMessage;

  @override
  State<UrlMessage> createState() => _UrlMessageState();
}

class _UrlMessageState extends State<UrlMessage> {
  final List<TapGestureRecognizer> _recognizers = [];

  @override
  void dispose() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    super.dispose();
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final linkStyle = TextStyle(
      color: widget.isMyMessage ? appColors.link : appColors.primary,
      fontSize: 16.sp,
      fontFamily: getLocaleFont(),
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    );

    final normalStyle = TextStyle(color: widget.textColor, fontSize: 14.sp);

    final words = widget.textContent.split(' ');

    final spans = <TextSpan>[
      for (var i = 0; i < words.length; i++)
        if (hasURLs(words[i]))
          TextSpan(
            text: i == words.length - 1 ? words[i] : '${words[i]} ',
            style: linkStyle,
            recognizer: _createRecognizer(words[i]),
          )
        else
          TextSpan(
            text: i == words.length - 1 ? words[i] : '${words[i]} ',
            style: normalStyle,
          ),
    ];

    return RichText(text: TextSpan(children: spans));
  }

  TapGestureRecognizer _createRecognizer(String url) {
    final recognizer = TapGestureRecognizer()..onTap = () => _openLink(url);
    _recognizers.add(recognizer);
    return recognizer;
  }
}
