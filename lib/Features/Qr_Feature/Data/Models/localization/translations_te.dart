import '../qrtype.dart';

class TeluguTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'వచనం';
      case QrType.website:
        return 'వెబ్సైట్';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'ఈవెంట్';
      case QrType.contact:
        return 'పరిచయం';
      case QrType.business:
        return 'వ్యాపారం';
      case QrType.visa:
        return 'వీసా కార్డ్';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'ఇమెయిల్';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'ఫోన్';
      case QrType.data:
        return 'డేటా';
    }
  }
}
