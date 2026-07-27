import '../qrtype.dart';

class ArabicTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'نص';
      case QrType.website:
        return 'موقع إلكتروني';
      case QrType.wifi:
        return 'واي فاي';
      case QrType.event:
        return 'حدث';
      case QrType.contact:
        return 'جهة اتصال';
      case QrType.business:
        return 'عمل تجاري';
      case QrType.visa:
        return 'بطاقة فيزا';
      case QrType.whatsapp:
        return 'واتساب';
      case QrType.x:
        return 'إكس';
      case QrType.email:
        return 'بريد إلكتروني';
      case QrType.instagram:
        return 'إنستغرام';
      case QrType.phone:
        return 'هاتف';
      case QrType.data:
        return 'بيانات';
    }
  }
}
