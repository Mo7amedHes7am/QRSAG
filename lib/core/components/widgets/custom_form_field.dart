import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/country_code_widget.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

typedef Validator = String? Function(String?);

class CustomFormField extends StatefulWidget {
  final String? title;
  final String? titleCondition;
  final TextStyle? titleStyle;
  final String? hint;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  final String? suffixText;
  final String? countryCode;
  final Color? background;
  final bool isTablet;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool enabled;

  final bool isPhoneNumber;
  final bool isNumber;
  final bool isPlainText;
  final bool isUrl;
  final bool isDateTime;
  final bool isMultiline;
  final bool isEmail;
  final bool isAddress;
  final bool isPassword;
  final bool isUserName;
  final bool isClientName;
  final bool isZipCode;
  final bool isCity;
  final bool isCountry;
  final bool isCompany;
  final bool isNotes;
  final bool isWeb;
  final bool isDate;
  final bool isFirstName;
  final bool isLastName;
  final bool isJobTitle;
  final bool isWifiName;
  final bool isWifiPassword;
  final bool isIndustryName;

  final String? clientNameExample;
  final double? width;
  final double? height;
  final double? iconSize;
  final Validator? validator;
  final Function(String)? onCountryChanged;
  final Function()? onDateSelected;
  final Function()? onDateTimeSelected;
  final Function(String)? onChanged;
  final GlobalKey? passedkey;
  final Function(String)? onFieldSubmitted;
  final double? radius;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final bool showRequiredStar;
  final bool showOptionalLabel;

  const CustomFormField({
    super.key,
    this.radius,
    this.title,
    this.background,
    this.onFieldSubmitted,
    this.titleCondition,
    this.controller,
    this.keyboardType,
    this.noborder,
    this.hint,
    this.hintStyle,
    this.titleStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.textStyle,
    this.isPhoneNumber = false,
    this.isNumber = false,
    this.isPlainText = false,
    this.isUrl = false,
    this.isDateTime = false,
    this.isMultiline = false,
    this.isEmail = false,
    this.isAddress = false,
    this.isPassword = false,
    this.isUserName = false,
    this.isClientName = false,
    this.isZipCode = false,
    this.isCity = false,
    this.isCountry = false,
    this.isCompany = false,
    this.isNotes = false,
    this.clientNameExample,
    this.isDate = false,
    this.errorText,
    this.countryCode,
    this.onCountryChanged,
    this.onDateSelected,
    this.onDateTimeSelected,
    this.width,
    this.height,
    this.onChanged,
    this.suffixText,
    this.iconSize,
    this.validator,
    this.focusNode,
    this.passedkey,
    this.inputFormatters,
    this.isTablet = false,
    this.maxLines,
    this.minLines,
    this.showRequiredStar = false,
    this.showOptionalLabel = false,
    this.isFirstName = false,
    this.isLastName = false,
    this.isJobTitle = false,
    this.isWeb = false,
    this.isWifiName = false,
    this.isWifiPassword = false,
    this.isIndustryName = false,
  });

  final bool? noborder;

  @override
  State<CustomFormField> createState() => _CustomFormFeildState();
}

class _CustomFormFeildState extends State<CustomFormField> {
  late bool isObscured;
  String? _errorText;
  bool _hasBeenValidated = false;
  late TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPassword || widget.isWifiPassword;

    _controller = widget.controller;
    _controller?.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller?.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    if (_hasBeenValidated && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _validateField(_controller?.text);
        }
      });
    }
  }

  String? _validateField(String? value) {
    if (widget.validator != null) {
      final error = widget.validator!(value);
      if (_errorText != error && mounted) {
        setState(() {
          _errorText = error;
        });
      }
      return error;
    }
    return null;
  }

  TextInputType get _keyboardType {
    if (widget.isPassword || widget.isWifiPassword)
      return TextInputType.visiblePassword;
    if (widget.isEmail) return TextInputType.emailAddress;
    if (widget.isPhoneNumber) return TextInputType.phone;
    if (widget.isNumber) return TextInputType.number;
    if (widget.isDateTime || widget.isDate) return TextInputType.datetime;
    if (widget.isUrl) return TextInputType.url;
    if (widget.isWeb) return TextInputType.url;
    if (widget.isAddress) return TextInputType.streetAddress;
    if (widget.isMultiline) return TextInputType.multiline;
    if (widget.isUserName ||
        widget.isClientName ||
        widget.isFirstName ||
        widget.isLastName ||
        widget.isCompany ||
        widget.isJobTitle ||
        widget.isWifiName ||
        widget.isIndustryName) {
      return TextInputType.name;
    }
    if (widget.isPlainText) return TextInputType.text;
    if (widget.isZipCode) return TextInputType.number;
    if (widget.isCity || widget.isCountry || widget.isNotes) {
      return TextInputType.text;
    }
    return widget.keyboardType ?? TextInputType.text;
  }

  List<TextInputFormatter>? get _inputFormatters {
    if (widget.isUrl || widget.isWeb) {
      return [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\-_.:/?&=#%@+]')),
      ];
    }

    if (widget.isWifiName) {
      return [
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z0-9 \-_.!@#$%^&*()+=]'),
        ),
      ];
    }

    if (widget.isWifiPassword) {
      return [
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z0-9 \-_.!@#$%^&*()+=]'),
        ),
      ];
    }

    if (widget.isPhoneNumber) {
      return [
        TextInputFormatter.withFunction((oldValue, newValue) {
          String text = newValue.text;
          text = convertArabicToEnglish(text);
          text = text.replaceAll(RegExp(r'[^0-9]'), '');
          if (text.startsWith('0') && text.length > 1) {
            text = text.replaceFirst(RegExp(r'^0'), '');
          }
          int offset = text.length.clamp(0, text.length);
          return TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: offset),
          );
        }),
        LengthLimitingTextInputFormatter(15),
      ];
    }

    if (widget.isNumber || widget.isZipCode) {
      return [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          String convertedText = convertArabicToEnglish(newValue.text);
          int baseOffset = newValue.selection.baseOffset;
          int extentOffset = newValue.selection.extentOffset;
          int offsetDiff = newValue.text.length - convertedText.length;
          return TextEditingValue(
            text: convertedText,
            selection: TextSelection(
              baseOffset: baseOffset - offsetDiff,
              extentOffset: extentOffset - offsetDiff,
            ),
          );
        }),
      ];
    }

    if (widget.isPlainText) {
      return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]'))];
    }

    return null;
  }

  String? _validateFieldType(String? value) {
    if (value == null || value.isEmpty) {
      if (widget.showRequiredStar) {
        if (widget.isFirstName)
          return LocaleKeys.validation_first_name_required.tr();
        if (widget.isLastName)
          return LocaleKeys.validation_last_name_required.tr();
        if (widget.isCompany)
          return LocaleKeys.validation_company_required.tr();
        if (widget.isJobTitle)
          return LocaleKeys.validation_job_title_required.tr();
        if (widget.isWeb) return LocaleKeys.validation_web_required.tr();
        if (widget.isWifiName)
          return LocaleKeys.validation_wifi_name_required.tr();
        if (widget.isWifiPassword)
          return LocaleKeys.validation_wifi_password_required.tr();
        if (widget.isIndustryName)
          return LocaleKeys.validation_industry_name_required.tr();
        return LocaleKeys.validation_required.tr();
      }
      return null;
    }

    if (widget.isIndustryName && value.isNotEmpty) {
      if (value.length < 2) {
        return LocaleKeys.validation_industry_name_invalid.tr();
      }
    }

    if (widget.isWifiName && value.isNotEmpty) {
      if (value.length < 2) {
        return LocaleKeys.validation_wifi_name_invalid.tr();
      }
    }

    if (widget.isWifiPassword && value.isNotEmpty) {
      if (value.length < 8) {
        return LocaleKeys.validation_wifi_password_invalid.tr();
      }
    }

    if (widget.isWeb && value.isNotEmpty) {
      final webRegex = RegExp(
        r'^(https?:\/\/)?'
        r'(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+'
        r'[a-zA-Z]{2,})'
        r'(:\d+)?'
        r'(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?$',
        caseSensitive: false,
      );
      if (!webRegex.hasMatch(value)) {
        return LocaleKeys.validation_web_invalid.tr();
      }
    }

    if (widget.isFirstName && value.isNotEmpty) {
      if (value.length < 2) {
        return LocaleKeys.validation_first_name_invalid.tr();
      }
    }

    if (widget.isLastName && value.isNotEmpty) {
      if (value.length < 2) {
        return LocaleKeys.validation_last_name_invalid.tr();
      }
    }

    if (widget.isCompany && value.isNotEmpty) {
      if (value.length < 2) {
        return LocaleKeys.validation_company_invalid.tr();
      }
    }

    if (widget.isJobTitle && value.isNotEmpty) {
      if (value.length < 2) {
        return LocaleKeys.validation_job_title_invalid.tr();
      }
    }

    if (widget.isUrl && value.isNotEmpty) {
      final urlRegex = RegExp(
        r'^(https?:\/\/)?([\w\-]+\.)+[\w\-]+(\/[\w\- .\/?%&=]*)?$',
        caseSensitive: false,
      );
      if (!urlRegex.hasMatch(value)) {
        return LocaleKeys.validation_url_invalid.tr();
      }
    }

    if (widget.isPhoneNumber && value.isNotEmpty) {
      if (value.length < 6) {
        return LocaleKeys.validation_phone_invalid.tr();
      }
    }

    if (widget.isAddress && value.isNotEmpty) {
      if (value.length < 5) {
        return LocaleKeys.validation_address_invalid.tr();
      }
    }

    if (widget.isUserName && value.isNotEmpty) {
      if (value.length < 3) {
        return LocaleKeys.validation_username_invalid.tr();
      }
    }

    if (widget.isPassword && value.isNotEmpty) {
      if (value.length < 8) {
        return LocaleKeys.validation_password_weak.tr();
      }
    }

    return null;
  }

  String _getDefaultHint() {
    if (widget.hint != null) return widget.hint!;

    if (widget.isPhoneNumber) return LocaleKeys.hint_phone_number.tr();
    if (widget.isNumber) return LocaleKeys.hint_number.tr();
    if (widget.isPlainText) return LocaleKeys.hint_plain_text.tr();
    if (widget.isUrl) return LocaleKeys.hint_url.tr();
    if (widget.isWeb) return LocaleKeys.hint_web.tr();
    if (widget.isWifiName) return LocaleKeys.hint_wifi_name.tr();
    if (widget.isWifiPassword) return LocaleKeys.hint_wifi_password.tr();
    if (widget.isIndustryName) return LocaleKeys.hint_industry_name.tr();
    if (widget.isDateTime) return LocaleKeys.hint_date_time.tr();
    if (widget.isEmail) return LocaleKeys.hint_email.tr();
    if (widget.isAddress) return LocaleKeys.hint_address.tr();
    if (widget.isPassword) return LocaleKeys.hint_password.tr();
    if (widget.isUserName) return LocaleKeys.hint_username.tr();
    if (widget.isClientName) return LocaleKeys.hint_client_name.tr();
    if (widget.isDate) return LocaleKeys.hint_date.tr();
    if (widget.isMultiline) return LocaleKeys.hint_multiline.tr();
    if (widget.isZipCode) return LocaleKeys.hint_zip_code.tr();
    if (widget.isCity) return LocaleKeys.hint_city.tr();
    if (widget.isCountry) return LocaleKeys.hint_country.tr();
    if (widget.isCompany) return LocaleKeys.hint_company.tr();
    if (widget.isJobTitle) return LocaleKeys.hint_job_title.tr();
    if (widget.isNotes) return LocaleKeys.hint_notes.tr();
    if (widget.isFirstName) return LocaleKeys.hint_first_name.tr();
    if (widget.isLastName) return LocaleKeys.hint_last_name.tr();

    return LocaleKeys.hint_text.tr();
  }

  String? _getDefaultTitle() {
    if (widget.title != null) return widget.title;

    if (widget.isPhoneNumber) return LocaleKeys.field_phone.tr();
    if (widget.isEmail) return LocaleKeys.field_email.tr();
    if (widget.isPassword) return LocaleKeys.field_password.tr();
    if (widget.isAddress) return LocaleKeys.field_address.tr();
    if (widget.isCity) return LocaleKeys.field_city.tr();
    if (widget.isCountry) return LocaleKeys.field_country.tr();
    if (widget.isZipCode) return LocaleKeys.field_zip_code.tr();
    if (widget.isCompany) return LocaleKeys.field_company.tr();
    if (widget.isJobTitle) return LocaleKeys.field_job_title.tr();
    if (widget.isUrl) return LocaleKeys.field_website.tr();
    if (widget.isWeb) return LocaleKeys.field_web.tr();
    if (widget.isWifiName) return LocaleKeys.field_wifi_name.tr();
    if (widget.isWifiPassword) return LocaleKeys.field_wifi_password.tr();
    if (widget.isIndustryName) return LocaleKeys.field_industry_name.tr();
    if (widget.isMultiline) return LocaleKeys.field_description.tr();
    if (widget.isNotes) return LocaleKeys.field_notes.tr();
    if (widget.isUserName) return LocaleKeys.field_username.tr();
    if (widget.isPlainText) return LocaleKeys.field_plain_text.tr();
    if (widget.isFirstName) return LocaleKeys.field_first_name.tr();
    if (widget.isLastName) return LocaleKeys.field_last_name.tr();

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double scale = widget.isTablet ? 1.45 : 1.0;
    final bool isRTL =
        context.locale.languageCode == 'ar' ||
        context.locale.languageCode == 'fa' ||
        context.locale.languageCode == 'ur';

    int effectiveMaxLines = widget.isMultiline ? (widget.maxLines ?? 5) : 1;
    int effectiveMinLines = widget.isMultiline ? (widget.minLines ?? 1) : 1;

    final String displayTitle = _getDefaultTitle() ?? widget.title ?? '';

    return Container(
      key: widget.passedkey,
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (displayTitle.isNotEmpty)
            _buildTitleWidget(displayTitle, widget.isTablet, scale),
          SizedBox(
            height: displayTitle.isNotEmpty
                ? (widget.isTablet ? (20.h * scale) : 8.h)
                : 0,
          ),
          SizedBox(
            height: widget.isMultiline
                ? null
                : widget.height ?? (widget.isTablet ? (90.h * scale) : 55.h),
            child: _buildTextField(
              widget.isTablet,
              scale,
              effectiveMaxLines,
              effectiveMinLines,
            ),
          ),
          if (_errorText != null && _errorText!.isNotEmpty)
            Container(
              margin: EdgeInsets.only(
                top: widget.isTablet ? 8.h : 4.h,
                left: widget.isTablet ? 12.w : 8.w,
                right: widget.isTablet ? 12.w : 8.w,
              ),
              child: Align(
                alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
                child: Text(
                  _errorText!,
                  style: TextStyle(
                    fontFamily: getLocaleFont(),
                    fontWeight: FontWeight.w500,
                    fontSize: widget.isTablet ? (18.sp * scale) : 12.sp,
                    color: appColors.failed,
                    height: 1.4,
                  ),
                  textAlign: isRTL ? TextAlign.right : TextAlign.left,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            )
          else
            SizedBox(height: widget.isTablet ? 8.h : 4.h),
        ],
      ),
    );
  }

  Widget _buildTitleWidget(String title, bool isTablet, double scale) {
    final bool isRTL =
        context.locale.languageCode == 'ar' ||
        context.locale.languageCode == 'fa' ||
        context.locale.languageCode == 'ur';

    final List<InlineSpan> children = [];

    children.add(
      TextSpan(
        text: title,
        style:
            widget.titleStyle ??
            TextStyle(
              fontFamily: getLocaleFont(),
              fontWeight: FontWeight.w500,
              fontSize: isTablet ? (24.sp * scale) : 14.sp,
              color: appColors.primaryTextColor,
            ),
      ),
    );

    if (widget.showOptionalLabel && !widget.showRequiredStar) {
      children.add(
        TextSpan(
          text: ' (${LocaleKeys.common_optional.tr()})',
          style: TextStyle(
            fontFamily: getLocaleFont(),
            fontWeight: FontWeight.w400,
            fontSize: isTablet ? (20.sp * scale) : 12.sp,
            color: appColors.grey,
          ),
        ),
      );
    }

    if (widget.showRequiredStar) {
      children.add(
        WidgetSpan(
          child: Padding(
            padding: EdgeInsets.only(left: 4.sp),
            child: Text(
              "*",
              style: TextStyle(
                fontFamily: getLocaleFont(),
                fontWeight: FontWeight.w700,
                fontSize: isTablet ? (24.sp * scale) : 14.sp,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    }

    if (widget.titleCondition != null) {
      children.add(
        TextSpan(
          text: " (${widget.titleCondition}) ",
          style: TextStyle(
            fontFamily: getLocaleFont(),
            fontWeight: FontWeight.w700,
            fontSize: isTablet ? (24.sp * scale) : 14.sp,
            color: appColors.failed,
          ),
        ),
      );
    }

    return Text.rich(
      TextSpan(locale: context.locale, children: children),
      textAlign: isRTL ? TextAlign.right : TextAlign.left,
    );
  }

  Widget _buildTextField(
    bool isTablet,
    double scale,
    int maxLines,
    int minLines,
  ) {
    final bool isRTL =
        context.locale.languageCode == 'ar' ||
        context.locale.languageCode == 'fa' ||
        context.locale.languageCode == 'ur';

    final textAlign = (isRTL && !widget.isPhoneNumber && !widget.isNumber)
        ? TextAlign.right
        : TextAlign.start;

    return TextFormField(
      focusNode: widget.focusNode,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      cursorColor: appColors.primaryTextColor,
      cursorWidth: isTablet ? 3.w : 2.w,
      cursorHeight: isTablet ? 30.h : 20.h,
      textAlign: textAlign,
      onChanged: (value) {
        if (_errorText != null && mounted) {
          setState(() {
            _errorText = null;
            _hasBeenValidated = false;
          });
        }
        widget.onChanged?.call(value);
      },
      enabled: widget.enabled,
      onFieldSubmitted: widget.onFieldSubmitted,
      controller: widget.controller,
      textInputAction: widget.isMultiline
          ? TextInputAction.newline
          : TextInputAction.done,
      style:
          widget.textStyle ??
          TextStyle(
            fontFamily: getLocaleFont(),
            fontWeight: FontWeight.w500,
            fontSize: isTablet ? (24.sp * scale) : 14.sp,
            color: appColors.primaryTextColor,
          ),
      keyboardType: _keyboardType,
      maxLength: widget.isPhoneNumber ? 15 : null,
      maxLines: widget.isMultiline ? maxLines : 1,
      minLines: widget.isMultiline ? minLines : 1,
      expands: false,
      obscureText: widget.isPassword || widget.isWifiPassword
          ? isObscured
          : false,
      decoration: _buildInputDecoration(isTablet, scale),
      validator: (value) {
        _hasBeenValidated = true;

        final typeError = _validateFieldType(value);
        if (typeError != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && _errorText != typeError) {
              setState(() {
                _errorText = typeError;
              });
            }
          });
          return null;
        }

        if (widget.validator != null) {
          final error = widget.validator!(value);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && _errorText != error) {
              setState(() {
                _errorText = error;
              });
            }
          });
          return null;
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && _errorText != null) {
            setState(() {
              _errorText = null;
            });
          }
        });
        return null;
      },
      inputFormatters: widget.inputFormatters ?? _inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  InputDecoration _buildInputDecoration(bool isTablet, double scale) {
    final bool isRTL =
        context.locale.languageCode == 'ar' ||
        context.locale.languageCode == 'fa' ||
        context.locale.languageCode == 'ur';

    String hintText = _getDefaultHint();

    return InputDecoration(
      suffixText: widget.suffixText,
      suffixStyle: TextStyle(
        color: widget.background ?? appColors.textfield,
        fontSize: isTablet ? (22.sp * scale) : 14.sp,
      ),
      counterText: '',
      hintText: hintText,
      hintStyle:
          widget.hintStyle ??
          TextStyle(
            fontFamily: getLocaleFont(),
            fontWeight: FontWeight.w400,
            fontSize: isTablet ? (22.sp * scale) : 12.sp,
            color: appColors.grey,
          ),
      errorText: null,
      errorMaxLines: null,
      fillColor: (_errorText != null && _errorText!.isNotEmpty)
          ? appColors.failed.withOpacity(0.1)
          : widget.background ?? appColors.textfield,
      filled: true,
      suffixIcon: _buildSuffixIcon(isTablet, scale),
      prefixIconConstraints: widget.iconSize == null
          ? null
          : BoxConstraints.expand(width: isTablet ? (70.w * scale) : 32.w),
      prefixIcon: _buildPrefixIcon(isTablet, scale),
      border: _buildBorder(Colors.transparent, isTablet, scale),
      errorBorder: _buildBorder(appColors.failed, isTablet, scale),
      enabledBorder: _buildBorder(Colors.transparent, isTablet, scale),
      focusedBorder: _buildBorder(appColors.primary, isTablet, scale),
      focusedErrorBorder: _buildBorder(appColors.failed, isTablet, scale),
      disabledBorder: _buildBorder(Colors.transparent, isTablet, scale),
      contentPadding: widget.isMultiline
          ? EdgeInsets.symmetric(
              horizontal: isTablet ? (28.w * scale) : 16.w,
              vertical: isTablet ? (24.h * scale) : 14.h,
            )
          : EdgeInsets.symmetric(
              horizontal: isTablet ? (28.w * scale) : 16.w,
              vertical: isTablet ? (24.h * scale) : 14.h,
            ),
    );
  }

  OutlineInputBorder _buildBorder(Color color, bool isTablet, double scale) {
    final bool hasError = _errorText != null && _errorText!.isNotEmpty;

    return OutlineInputBorder(
      borderSide: BorderSide(
        width: isTablet ? (2.5.w * scale) : 1.w,
        color: hasError ? appColors.failed : color,
      ),
      borderRadius: widget.noborder != null
          ? BorderRadius.circular(0)
          : BorderRadius.circular(
              widget.radius ?? (isTablet ? (28.r * scale) : 12.r),
            ),
    );
  }

  Widget? _buildSuffixIcon(bool isTablet, double scale) {
    if (widget.suffixText != null) return null;
    if (widget.suffixIcon != null) return widget.suffixIcon;

    if (widget.isPassword || widget.isWifiPassword) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          isTablet ? (35.w * scale) : 16.w,
          isTablet ? (28.h * scale) : 16.h,
          isTablet ? (20.w * scale) : 8.w,
          isTablet ? (28.h * scale) : 16.h,
        ),
        child: InkWell(
          onTap: () {
            if (mounted) {
              setState(() => isObscured = !isObscured);
            }
          },
          child: Icon(
            isObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: appColors.grey,
            size: isTablet ? (38.sp * scale) : 20.sp,
          ),
        ),
      );
    }

    if (widget.isDate || widget.isDateTime) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          isTablet ? (35.w * scale) : 16.w,
          isTablet ? (28.h * scale) : 16.h,
          isTablet ? (20.w * scale) : 8.w,
          isTablet ? (28.h * scale) : 16.h,
        ),
        child: InkWell(
          onTap: widget.isDateTime
              ? widget.onDateTimeSelected
              : widget.onDateSelected,
          child: Icon(
            widget.isDateTime ? Icons.calendar_today : Icons.calendar_month,
            color: appColors.grey,
            size: isTablet ? (38.sp * scale) : 20.sp,
          ),
        ),
      );
    }

    if (widget.isUrl || widget.isWeb) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          isTablet ? (35.w * scale) : 16.w,
          isTablet ? (28.h * scale) : 16.h,
          isTablet ? (20.w * scale) : 8.w,
          isTablet ? (28.h * scale) : 16.h,
        ),
        child: Icon(
          widget.isWeb ? Icons.language : Icons.link,
          color: appColors.grey,
          size: isTablet ? (38.sp * scale) : 20.sp,
        ),
      );
    }

    return null;
  }

  Widget? _buildPrefixIcon(bool isTablet, double scale) {
    if (widget.isPhoneNumber) {
      final bool isRTL =
          context.locale.languageCode == 'ar' ||
          context.locale.languageCode == 'fa' ||
          context.locale.languageCode == 'ur';

      return Directionality(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          margin: EdgeInsets.only(
            left: isTablet ? (12.w * scale) : 6.w,
            right: isTablet ? (12.w * scale) : 6.w,
            top: isTablet ? (4.h * scale) : 2.h,
            bottom: isTablet ? (4.h * scale) : 2.h,
          ),
          decoration: BoxDecoration(
            color: CacheManager.getGlobalData().theme == 1
                ? Colors.white
                : widget.background ?? appColors.textfield,
            borderRadius: widget.noborder != null
                ? BorderRadius.circular(0)
                : BorderRadius.circular(isTablet ? (32.r * scale) : 16.r),
          ),
          child: Container(
            width: isTablet ? (170.w * scale) : 85.w,
            color: widget.background ?? appColors.textfield,
            child: Center(
              child: CountryCodeWidget(
                countryCode: widget.countryCode,
                isRegisteration: false,
                onCountryChanged: (dialcode, countryCode, countryName) {
                  if (mounted) {
                    setState(() => widget.onCountryChanged?.call(dialcode));
                  }
                },
                isTablet: isTablet,
              ),
            ),
          ),
        ),
      );
    }

    EdgeInsets _getIconPadding() {
      final double horizontalPadding = isTablet ? (20.w * scale) : 8.w;
      final double verticalPadding = isTablet ? (20.h * scale) : 12.h;
      return EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      );
    }

    double _getIconSize() {
      return isTablet ? (38.sp * scale) : 22.sp;
    }

    if (widget.isPassword || widget.isWifiPassword) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          widget.isWifiPassword ? Icons.wifi_lock_outlined : Icons.lock_outline,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isEmail) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.email_outlined,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isAddress) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.location_on_outlined,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isCompany) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.business_outlined,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isJobTitle) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.work_outline,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isIndustryName) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.factory_outlined,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isWeb) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.public_outlined,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isWifiName) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.wifi_outlined,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isFirstName || widget.isLastName || widget.isUserName) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.person_outline,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isCity || widget.isCountry) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          widget.isCity ? Icons.location_city_outlined : Icons.public_outlined,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    if (widget.isClientName) {
      return Padding(
        padding: _getIconPadding(),
        child: Icon(
          Icons.person_outline,
          color: appColors.grey,
          size: _getIconSize(),
        ),
      );
    }

    return widget.prefixIcon;
  }
}
