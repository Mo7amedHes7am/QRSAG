import '../qrtype.dart';

class PunjabiTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'ਪਾਠ';
      case QrType.website:
        return 'ਵੈਬਸਾਈਟ';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'ਇਵੈਂਟ';
      case QrType.contact:
        return 'ਸੰਪਰਕ';
      case QrType.business:
        return 'ਕਾਰੋਬਾਰ';
      case QrType.visa:
        return 'ਵੀਜ਼ਾ ਕਾਰਡ';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'ਈਮੇਲ';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'ਫ਼ੋਨ';
      case QrType.data:
        return 'ਡੇਟਾ';
    }
  }
}
