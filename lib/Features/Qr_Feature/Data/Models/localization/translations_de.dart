import '../qrtype.dart';

class GermanTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Text';
      case QrType.website:
        return 'Webseite';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Veranstaltung';
      case QrType.contact:
        return 'Kontakt';
      case QrType.business:
        return 'Unternehmen';
      case QrType.visa:
        return 'Visa-Karte';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'E-Mail';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telefon';
      case QrType.data:
        return 'Daten';
    }
  }
}
