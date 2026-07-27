import '../qrtype.dart';

class PolishTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Tekst';
      case QrType.website:
        return 'Strona';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Wydarzenie';
      case QrType.contact:
        return 'Kontakt';
      case QrType.business:
        return 'Biznes';
      case QrType.visa:
        return 'Karta Visa';
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
        return 'Dane';
    }
  }
}
