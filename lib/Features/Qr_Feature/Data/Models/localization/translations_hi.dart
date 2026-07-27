import '../qrtype.dart';

class HindiTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'पाठ';
      case QrType.website:
        return 'वेबसाइट';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'इवेंट';
      case QrType.contact:
        return 'संपर्क';
      case QrType.business:
        return 'व्यवसाय';
      case QrType.visa:
        return 'वीज़ा कार्ड';
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
