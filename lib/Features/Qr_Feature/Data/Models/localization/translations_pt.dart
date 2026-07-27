import '../qrtype.dart';

class PortugueseTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Texto';
      case QrType.website:
        return 'Site';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Evento';
      case QrType.contact:
        return 'Contato';
      case QrType.business:
        return 'Negócio';
      case QrType.visa:
        return 'Cartão Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'E-mail';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Telefone';
      case QrType.data:
        return 'Dados';
    }
  }
}
