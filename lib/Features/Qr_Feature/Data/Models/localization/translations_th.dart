import '../qrtype.dart';

class ThaiTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'ข้อความ';
      case QrType.website:
        return 'เว็บไซต์';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'กิจกรรม';
      case QrType.contact:
        return 'ติดต่อ';
      case QrType.business:
        return 'ธุรกิจ';
      case QrType.visa:
        return 'บัตรวีซ่า';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'อีเมล';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'โทรศัพท์';
      case QrType.data:
        return 'ข้อมูล';
    }
  }
}
