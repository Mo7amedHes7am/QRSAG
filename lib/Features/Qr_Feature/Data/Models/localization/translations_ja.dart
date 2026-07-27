import '../qrtype.dart';

class JapaneseTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'テキスト';
      case QrType.website:
        return 'ウェブサイト';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'イベント';
      case QrType.contact:
        return '連絡先';
      case QrType.business:
        return 'ビジネス';
      case QrType.visa:
        return 'Visaカード';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'メール';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return '電話';
      case QrType.data:
        return 'データ';
    }
  }
}
