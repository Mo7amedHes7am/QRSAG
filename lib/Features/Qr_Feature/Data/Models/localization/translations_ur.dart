import '../qrtype.dart';

class UrduTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'متن';
      case QrType.website:
        return 'ویب سائٹ';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'ایونٹ';
      case QrType.contact:
        return 'رابطہ';
      case QrType.business:
        return 'کاروبار';
      case QrType.visa:
        return 'ویزا کارڈ';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'ای میل';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'فون';
      case QrType.data:
        return 'ڈیٹا';
    }
  }
}
