import '../qrtype.dart';

class FrenchTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Texte';
      case QrType.website:
        return 'Site web';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Événement';
      case QrType.contact:
        return 'Contact';
      case QrType.business:
        return 'Entreprise';
      case QrType.visa:
        return 'Carte Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'E-mail';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Téléphone';
      case QrType.data:
        return 'Données';
    }
  }
}
