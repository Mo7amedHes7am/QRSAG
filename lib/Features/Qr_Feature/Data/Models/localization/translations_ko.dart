import '../qrtype.dart';

class KoreanTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return '텍스트';
      case QrType.website:
        return '웹사이트';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return '이벤트';
      case QrType.contact:
        return '연락처';
      case QrType.business:
        return '비즈니스';
      case QrType.visa:
        return '비자 카드';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return '이메일';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return '전화';
      case QrType.data:
        return '데이터';
    }
  }
}
