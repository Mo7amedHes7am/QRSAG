import '../qrtype.dart';

class ItalianTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Testo';
      case QrType.website:
        return 'Sito web';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Evento';
      case QrType.contact:
        return 'Contatto';
      case QrType.business:
        return 'Azienda';
      case QrType.visa:
        return 'Carta Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Email';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telefono';
      case QrType.data:
        return 'Dati';
    }
  }
}
