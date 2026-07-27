import '../qrtype.dart';

class RussianTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Текст';
      case QrType.website:
        return 'Веб-сайт';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Событие';
      case QrType.contact:
        return 'Контакт';
      case QrType.business:
        return 'Бизнес';
      case QrType.visa:
        return 'Карта Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Электронная почта';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Телефон';
      case QrType.data:
        return 'Данные';
    }
  }
}
