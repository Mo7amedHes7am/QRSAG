import '../qrtype.dart';

class MarathiTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'मजकूर';
      case QrType.website:
        return 'वेबसाइट';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'कार्यक्रम';
      case QrType.contact:
        return 'संपर्क';
      case QrType.business:
        return 'व्यवसाय';
      case QrType.visa:
        return 'व्हिसा कार्ड';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'ईमेल';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'फोन';
      case QrType.data:
        return 'डेटा';
    }
  }
}
