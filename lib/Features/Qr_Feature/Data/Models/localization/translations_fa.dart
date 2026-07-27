import '../qrtype.dart';

class PersianTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'متن';
      case QrType.website:
        return 'وبسایت';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'رویداد';
      case QrType.contact:
        return 'تماس';
      case QrType.business:
        return 'کسب و کار';
      case QrType.visa:
        return 'کارت ویزا';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'ایمیل';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'تلفن';
      case QrType.data:
        return 'داده';
    }
  }
}
