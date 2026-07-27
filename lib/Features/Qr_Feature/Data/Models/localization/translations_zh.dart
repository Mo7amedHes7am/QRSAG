import '../qrtype.dart';

class ChineseTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return '文本';
      case QrType.website:
        return '网站';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return '活动';
      case QrType.contact:
        return '联系人';
      case QrType.business:
        return '商业';
      case QrType.visa:
        return 'Visa卡';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return '电子邮件';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return '电话';
      case QrType.data:
        return '数据';
    }
  }
}
