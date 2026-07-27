import '../qrtype.dart';

class VietnameseTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Văn bản';
      case QrType.website:
        return 'Trang web';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Sự kiện';
      case QrType.contact:
        return 'Liên hệ';
      case QrType.business:
        return 'Doanh nghiệp';
      case QrType.visa:
        return 'Thẻ Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Email';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Điện thoại';
      case QrType.data:
        return 'Dữ liệu';
    }
  }
}
