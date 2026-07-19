import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class CountryCodeWidget extends StatefulWidget {
  final Function(String, String, String) onCountryChanged;
  final bool isRegisteration;
  final List<String>? countryFilter;
  final String? title;
  final String? countryCode;
  final bool isTablet;

  const CountryCodeWidget({
    super.key,
    required this.onCountryChanged,
    required this.isRegisteration,
    this.title,
    this.countryFilter,
    this.countryCode,
    this.isTablet = false,
  });

  @override
  State<CountryCodeWidget> createState() => _CountryCodeWidgetState();
}

class _CountryCodeWidgetState extends State<CountryCodeWidget> {
  String selectedCountryDialCode = '+20';

  @override
  void initState() {
    super.initState();
    selectedCountryDialCode = widget.countryCode ?? '+20';
  }

  @override
  Widget build(BuildContext context) {
    final double scale = widget.isTablet ? 1.45 : 1.0;

    return CountryCodePicker(
      backgroundColor: appColors.textfield,
      padding: EdgeInsets.symmetric(
        vertical: widget.isTablet ? (45.h * scale) : 32.h,
        horizontal: widget.isTablet ? (40.w * scale) : 27.w,
      ),
      flagDecoration: BoxDecoration(
        border: Border.all(
          color: appColors.grey,
          width: widget.isTablet ? 2.w : 1.w,
        ),
      ),
      showCountryOnly: widget.isRegisteration,
      onChanged: _handleCountryChanged,
      alignLeft: true,
      dialogSize: Size(
        widget.isTablet ? (500.w * scale) : 345.w,
        widget.isTablet ? (500.h * scale) : 325.h,
      ),
      initialSelection: CountryCode.fromDialCode(
        selectedCountryDialCode,
      ).toString(),
      hideHeaderText: true,
      headerAlignment: MainAxisAlignment.start,
      searchStyle: _textStyle(
        widget.isTablet ? 22 : 16,
        FontWeight.w400,
        appColors.primaryTextColor,
        scale,
      ),
      searchDecoration: _buildSearchDecoration(context, scale),
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          widget.isTablet ? (28.r * scale) : 15.r,
        ),
        color: appColors.textfield,
      ),
      dialogTextStyle: _textStyle(
        widget.isTablet ? 20 : 14,
        FontWeight.w500,
        appColors.primaryTextColor,
        scale,
      ),
      closeIcon: Icon(
        Icons.close,
        color: appColors.primaryTextColor,
        size: widget.isTablet ? (35.w * scale) : 24.w,
      ),
      builder: (country) => widget.isRegisteration
          ? _buildRegistrationView(country!, scale)
          : _buildCompactView(country!, scale),
    );
  }

  void _handleCountryChanged(CountryCode country) {
    setState(() {
      selectedCountryDialCode = country.dialCode!;
    });
    widget.onCountryChanged(
      selectedCountryDialCode,
      country.code!,
      country.name!,
    );
  }

  Widget _buildRegistrationView(CountryCode country, double scale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(scale),
        SizedBox(height: widget.isTablet ? (12.h * scale) : 8.h),
        Container(
          decoration: BoxDecoration(
            color: appColors.textfield,
            border: Border.all(
              color: appColors.grey,
              width: widget.isTablet ? (2.w * scale) : 1.w,
            ),
            borderRadius: BorderRadius.circular(
              widget.isTablet ? (28.r * scale) : 15.r,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isTablet ? (12.w * scale) : 8.w,
          ),
          height: widget.isTablet ? (70.h * scale) : 52.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                country.name ?? "Select",
                style: _textStyle(
                  widget.isTablet ? 22 : 16,
                  FontWeight.w500,
                  appColors.primaryTextColor,
                  scale,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: appColors.grey,
                    size: widget.isTablet ? 28.sp : 24.sp,
                  ),
                  SizedBox(width: widget.isTablet ? (8.w * scale) : 4.w),
                  _buildFlag(country.flagUri!, scale),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompactView(CountryCode country, double scale) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: appColors.primary,
          size: widget.isTablet ? 28.sp : 24.sp,
        ),
        CustomText.x13
            .light(country.dialCode ?? "")
            .fontSize(widget.isTablet ? (20.sp * scale) : 13.sp)
            .primaryTextColor,
        SizedBox(width: widget.isTablet ? (8.w * scale) : 4.w),
        _buildFlag(country.flagUri!, scale),
      ],
    );
  }

  Widget _buildTitle(double scale) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: widget.title ?? "",
            style: _textStyle(
              widget.isTablet ? 20 : 14,
              FontWeight.w500,
              appColors.primaryTextColor,
              scale,
            ),
          ),
          TextSpan(
            text: "*",
            style: _textStyle(
              widget.isTablet ? 20 : 14,
              FontWeight.w700,
              Colors.red,
              scale,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlag(String flagUri, double scale) {
    return ClipOval(
      child: Image.asset(
        flagUri,
        package: 'country_code_picker',
        width: widget.isTablet ? (28.w * scale) : 16.w,
        height: widget.isTablet ? (28.h * scale) : 16.h,
        fit: BoxFit.cover,
        cacheWidth: widget.isTablet ? 56 : 32,
        cacheHeight: widget.isTablet ? 56 : 32,
      ),
    );
  }

  InputDecoration _buildSearchDecoration(BuildContext context, double scale) {
    return InputDecoration(
      filled: true,
      fillColor: appColors.background,
      contentPadding: EdgeInsets.symmetric(
        vertical: 0.h,
        horizontal: widget.isTablet ? (40.w * scale) : 27.w,
      ),
      border: _inputBorder(scale),
      enabledBorder: _inputBorder(scale),
      focusedBorder: _inputBorder(scale),
      hintText: LocaleKeys.common_search.tr(),
      hintStyle: _textStyle(
        widget.isTablet ? 22 : 16,
        FontWeight.w400,
        appColors.primaryTextColor,
        scale,
      ),
      hintTextDirection: Directionality.of(context),
      prefixIcon: const SizedBox(),
      suffixIcon: Padding(
        padding: EdgeInsets.only(
          right: widget.isTablet ? (18.w * scale) : 12.w,
        ),
        child: Icon(
          Icons.search,
          color: appColors.grey,
          size: widget.isTablet ? 28.sp : 24.sp,
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder(double scale) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        widget.isTablet ? (28.r * scale) : 15.r,
      ),
      borderSide: BorderSide(
        color: appColors.grey,
        width: widget.isTablet ? (2.w * scale) : 1.w,
      ),
    );
  }

  TextStyle _textStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
    double scale,
  ) {
    return TextStyle(
      fontFamily: getLocaleFont(),
      fontWeight: fontWeight,
      fontSize: (widget.isTablet ? fontSize * scale : fontSize).sp,
      color: color,
    );
  }
}
