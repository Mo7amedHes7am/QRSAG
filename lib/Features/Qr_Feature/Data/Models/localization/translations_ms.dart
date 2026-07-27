import '../qrtype.dart';

class MalayTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Teks';
      case QrType.website:
        return 'Laman web';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Acara';
      case QrType.contact:
        return 'Hubungi';
      case QrType.business:
        return 'Perniagaan';
      case QrType.visa:
        return 'Kad Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'E-mel';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telefon';
      case QrType.data:
        return 'Data';
    }
  }
}
