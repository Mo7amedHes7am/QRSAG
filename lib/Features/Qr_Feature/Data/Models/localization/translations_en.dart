import '../qrtype.dart';

class EnglishTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Text';
      case QrType.website:
        return 'Website';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Event';
      case QrType.contact:
        return 'Contact';
      case QrType.business:
        return 'Business';
      case QrType.visa:
        return 'Visa Card';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Email';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telephone';
      case QrType.data:
        return 'Data';
    }
  }
}
