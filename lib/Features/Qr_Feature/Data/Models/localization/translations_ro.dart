import '../qrtype.dart';

class RomanianTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Text';
      case QrType.website:
        return 'Site web';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Eveniment';
      case QrType.contact:
        return 'Contact';
      case QrType.business:
        return 'Afacere';
      case QrType.visa:
        return 'Card Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'E-mail';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telefon';
      case QrType.data:
        return 'Date';
    }
  }
}
