import '../qrtype.dart';

class SpanishTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Texto';
      case QrType.website:
        return 'Sitio web';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Evento';
      case QrType.contact:
        return 'Contacto';
      case QrType.business:
        return 'Negocio';
      case QrType.visa:
        return 'Tarjeta Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Correo electrónico';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Teléfono';
      case QrType.data:
        return 'Datos';
    }
  }
}
