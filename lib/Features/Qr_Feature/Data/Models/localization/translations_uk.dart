import '../qrtype.dart';

class UkrainianTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Текст';
      case QrType.website:
        return 'Сайт';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Подія';
      case QrType.contact:
        return 'Контакт';
      case QrType.business:
        return 'Бізнес';
      case QrType.visa:
        return 'Картка Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Електронна пошта';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Телефон';
      case QrType.data:
        return 'Дані';
    }
  }
}
