import '../qrtype.dart';

class TurkishTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Metin';
      case QrType.website:
        return 'Web sitesi';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Etkinlik';
      case QrType.contact:
        return 'İletişim';
      case QrType.business:
        return 'İş';
      case QrType.visa:
        return 'Visa Kart';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'E-posta';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telefon';
      case QrType.data:
        return 'Veri';
    }
  }
}
