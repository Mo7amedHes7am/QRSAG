import '../qrtype.dart';

class BengaliTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'পাঠ্য';
      case QrType.website:
        return 'ওয়েবসাইট';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'ইভেন্ট';
      case QrType.contact:
        return 'যোগাযোগ';
      case QrType.business:
        return 'ব্যবসা';
      case QrType.visa:
        return 'ভিসা কার্ড';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'ইমেইল';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'ফোন';
      case QrType.data:
        return 'ডেটা';
    }
  }
}
