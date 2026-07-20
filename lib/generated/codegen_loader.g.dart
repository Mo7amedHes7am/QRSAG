// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "hint": {
    "phone_number": "أدخل رقم الهاتف",
    "number": "أدخل الرقم",
    "plain_text": "أدخل النص",
    "url": "أدخل الرابط (مثال: https://example.com)",
    "date_time": "اختر التاريخ والوقت",
    "email": "أدخل البريد الإلكتروني",
    "address": "أدخل عنوانك",
    "card_number": "١٢٣٤ ٥٦٧٨ ٩٠١٢ ٣٤٥٦",
    "password": "أدخل كلمة المرور",
    "expiry_date": "شهر/سنة",
    "username": "أدخل اسم المستخدم",
    "client_name": "أدخل اسم العميل",
    "date": "اختر التاريخ",
    "multiline": "أدخل الوصف",
    "text": "أدخل النص",
    "cvv": "رمز التحقق",
    "card_holder_name": "اسم حامل البطاقة",
    "zip_code": "أدخل الرمز البريدي",
    "city": "أدخل المدينة",
    "country": "أدخل الدولة",
    "company": "أدخل اسم الشركة",
    "notes": "أضف ملاحظات"
  },
  "validation": {
    "email_invalid": "يرجى إدخال بريد إلكتروني صحيح",
    "url_invalid": "يرجى إدخال رابط صحيح",
    "card_invalid": "يرجى إدخال رقم بطاقة صحيح مكون من ١٦ رقم",
    "expiry_invalid": "يرجى استخدام صيغة شهر/سنة وإدخال شهر صحيح",
    "expiry_expired": "البطاقة منتهية الصلاحية",
    "phone_invalid": "يرجى إدخال رقم هاتف صحيح",
    "required": "هذا الحقل مطلوب",
    "username_invalid": "اسم المستخدم يجب أن يكون ٣ أحرف على الأقل",
    "password_weak": "كلمة المرور يجب أن تكون ٨ أحرف على الأقل مع أحرف وأرقام",
    "password_mismatch": "كلمات المرور غير متطابقة",
    "confirm_password": "يرجى تأكيد كلمة المرور",
    "date_invalid": "يرجى إدخال تاريخ صحيح",
    "card_name_invalid": "يرجى إدخال اسم صحيح لحامل البطاقة",
    "cvv_invalid": "يرجى إدخال رمز تحقق صحيح (٣-٤ أرقام)",
    "address_invalid": "يرجى إدخال عنوان صحيح (على الأقل ٥ أحرف)"
  },
  "field": {
    "full_name": "الاسم الكامل",
    "email": "البريد الإلكتروني",
    "phone": "رقم الهاتف",
    "password": "كلمة المرور",
    "confirm_password": "تأكيد كلمة المرور",
    "card_number": "رقم البطاقة",
    "card_name": "اسم حامل البطاقة",
    "expiry_date": "تاريخ الانتهاء",
    "cvv": "رمز التحقق",
    "address": "العنوان",
    "city": "المدينة",
    "country": "الدولة",
    "zip_code": "الرمز البريدي",
    "company": "الشركة",
    "website": "الموقع الإلكتروني",
    "description": "الوصف",
    "notes": "ملاحظات",
    "username": "اسم المستخدم"
  },
  "common": {
    "optional": "اختياري",
    "required": "مطلوب",
    "continue": "متابعة",
    "next": "التالي",
    "skip": "تخطي",
    "ok": "حسنا",
    "search": "بحث",
    "close": "إغلاق",
    "cancel": "إلغاء",
    "apply": "تطبيق",
    "reset": "إعادة تعيين",
    "back": "العودة",
    "save": "حفظ",
    "remove": "إزالة"
  },
  "chooseLanguage": {
    "title": "اختر اللغة",
    "subtitle": "اختر لغتك المفضلة أدناه، هذا يُساعدنا على خدمتك بشكل أفضل",
    "selected": "لقد اخترت",
    "all": "جميع اللغات",
    "nodata": "لا توجد لغات"
  },
  "chooseTheme": {
    "title": "اختر السمة",
    "subtitle": "اختر سمتك المفضلة أدناه. هذا يُساعدنا على خدمتك بشكل أفضل.",
    "lightMode": "الوضع الفاتح",
    "darkMode": "الوضع الداكن"
  }
};
static const Map<String,dynamic> _en = {
  "hint": {
    "phone_number": "Enter phone number",
    "number": "Enter number",
    "plain_text": "Enter text",
    "url": "Enter URL (e.g., https://example.com)",
    "date_time": "Select date & time",
    "email": "Enter email address",
    "address": "Enter your address",
    "card_number": "1234 5678 9012 3456",
    "password": "Enter password",
    "expiry_date": "MM/YY",
    "username": "Enter username",
    "client_name": "Enter client name",
    "date": "Select date",
    "multiline": "Enter description",
    "text": "Enter text",
    "cvv": "CVV",
    "card_holder_name": "Card holder name",
    "zip_code": "Enter ZIP code",
    "city": "Enter city",
    "country": "Enter country",
    "company": "Enter company name",
    "notes": "Add notes"
  },
  "validation": {
    "email_invalid": "Please enter a valid email address",
    "url_invalid": "Please enter a valid URL",
    "card_invalid": "Please enter a valid 16-digit card number",
    "expiry_invalid": "Please use MM/YY format and enter a valid month",
    "expiry_expired": "Card is expired",
    "phone_invalid": "Please enter a valid phone number",
    "required": "This field is required",
    "username_invalid": "Username must be at least 3 characters",
    "password_weak": "Password must be at least 8 characters with letters and numbers",
    "password_mismatch": "Passwords do not match",
    "confirm_password": "Please confirm your password",
    "date_invalid": "Please enter a valid date",
    "card_name_invalid": "Please enter a valid card holder name",
    "cvv_invalid": "Please enter a valid CVV (3-4 digits)",
    "address_invalid": "Please enter a valid address (at least 5 characters)"
  },
  "field": {
    "full_name": "Full Name",
    "email": "Email Address",
    "phone": "Phone Number",
    "password": "Password",
    "confirm_password": "Confirm Password",
    "card_number": "Card Number",
    "card_name": "Card Holder Name",
    "expiry_date": "Expiry Date",
    "cvv": "CVV",
    "address": "Address",
    "city": "City",
    "country": "Country",
    "zip_code": "ZIP Code",
    "company": "Company",
    "website": "Website",
    "description": "Description",
    "notes": "Notes",
    "username": "Username"
  },
  "common": {
    "optional": "optional",
    "required": "required",
    "continue": "Continue",
    "next": "Next",
    "skip": "Skip",
    "ok": "OK",
    "search": "Search",
    "close": "Close",
    "cancel": "Cancel",
    "apply": "Apply",
    "reset": "Reset",
    "back": "Back",
    "save": "Save",
    "remove": "Remove"
  },
  "chooseLanguage": {
    "title": "Choose the language",
    "subtitle": "Select your preferred language below. This helps us serve you better.",
    "selected": "You Selected",
    "all": "All Languages",
    "nodata": "No Languages Found"
  },
  "chooseTheme": {
    "title": "Choose the theme",
    "subtitle": "Select your preferred theme below. This helps us serve you better.",
    "lightMode": "Light Mode",
    "darkMode": "Dark Mode"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
