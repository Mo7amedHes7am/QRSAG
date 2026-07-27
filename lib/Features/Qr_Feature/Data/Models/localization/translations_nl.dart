import '../qrtype.dart';

class DutchTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Tekst';
      case QrType.website:
        return 'Website';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Evenement';
      case QrType.contact:
        return 'Contact';
      case QrType.business:
        return 'Bedrijf';
      case QrType.visa:
        return 'Visa-kaart';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'E-mail';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telefoon';
      case QrType.data:
        return 'Gegevens';
    }
  }
}
