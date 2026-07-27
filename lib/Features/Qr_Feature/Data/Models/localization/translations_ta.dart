import '../qrtype.dart';

class TamilTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'உரை';
      case QrType.website:
        return 'வலைத்தளம்';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'நிகழ்வு';
      case QrType.contact:
        return 'தொடர்பு';
      case QrType.business:
        return 'வணிகம்';
      case QrType.visa:
        return 'விசா அட்டை';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'மின்னஞ்சல்';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'தொலைபேசி';
      case QrType.data:
        return 'தரவு';
    }
  }
}
