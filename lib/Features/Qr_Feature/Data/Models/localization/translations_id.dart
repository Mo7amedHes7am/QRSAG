import '../qrtype.dart';

class IndonesianTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Teks';
      case QrType.website:
        return 'Situs web';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Acara';
      case QrType.contact:
        return 'Kontak';
      case QrType.business:
        return 'Bisnis';
      case QrType.visa:
        return 'Kartu Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Email';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telepon';
      case QrType.data:
        return 'Data';
    }
  }
}
