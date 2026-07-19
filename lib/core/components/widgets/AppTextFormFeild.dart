import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';

class AppTextFormFeild extends StatefulWidget {
  final String? labelText;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool isPhoneNumber;

  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String countryCode, String phoneNumber)? onPhoneChanged;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final int? minLines;
  final int? maxLines;
  const AppTextFormFeild({
    super.key,
    this.labelText,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.sufixIcon,
    this.isPhoneNumber = false,
    this.onPhoneChanged,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  State<AppTextFormFeild> createState() => _AppTextFormFeildState();
}

class _AppTextFormFeildState extends State<AppTextFormFeild> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
              fontFamily: getLocaleFont(),
            ),
          ),
          SizedBox(height: 8.h),
        ],

        widget.isPhoneNumber ? _buildPhoneField() : _buildNormalField(),
      ],
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      controller: widget.controller,
      languageCode: "ar",
      initialCountryCode: 'EG',
      dropdownIconPosition: IconPosition.trailing,
      textAlign: TextAlign.left,
      decoration: _buildInputDecoration(),
      disableLengthCheck: false,
      onChanged: (phone) {
        if (widget.onPhoneChanged != null) {
          widget.onPhoneChanged!(phone.countryCode, phone.number);
        }
      },
    );
  }

  Widget _buildNormalField() {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscure,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: _buildInputDecoration(),
      minLines: widget.minLines,
      maxLines: widget.maxLines,
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      fillColor: appColors.textfield,
      filled: true,
      suffixIcon: widget.isPassword
          ? IconButton(
              onPressed: () => setState(() => isObscure = !isObscure),
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
            )
          : (widget.sufixIcon != null ? Icon(widget.sufixIcon) : null),

      prefixIcon: !widget.isPhoneNumber && widget.prefixIcon != null
          ? Icon(widget.prefixIcon)
          : null,

      labelStyle: _textStyle(),
      hintStyle: _textStyle(),
      counterText: "",
      border: _outlineBorder(),
      enabledBorder: _outlineBorder(),
      focusedBorder: _outlineBorder(isFocused: true),
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontSize: 14.sp,
      color: appColors.grey,
      fontFamily: getLocaleFont(),
    );
  }

  OutlineInputBorder _outlineBorder({bool isFocused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: isFocused
          ? BorderSide(color: appColors.primaryLight, width: 2)
          : BorderSide.none,
    );
  }
}
