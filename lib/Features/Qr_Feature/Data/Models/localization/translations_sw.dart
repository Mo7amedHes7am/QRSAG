import '../qrtype.dart';

class SwahiliTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Maandishi';
      case QrType.website:
        return 'Tovuti';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Tukio';
      case QrType.contact:
        return 'Mawasiliano';
      case QrType.business:
        return 'Biashara';
      case QrType.visa:
        return 'Kadi ya Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Barua pepe';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Simu';
      case QrType.data:
        return 'Data';
    }
  }
}
