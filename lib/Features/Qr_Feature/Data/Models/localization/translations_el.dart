import '../qrtype.dart';

class GreekTranslations {
  static String getTranslation(QrType type) {
    switch (type) {
      case QrType.text:
        return 'Κείμενο';
      case QrType.website:
        return 'Ιστοσελίδα';
      case QrType.wifi:
        return 'WiFi';
      case QrType.event:
        return 'Εκδήλωση';
      case QrType.contact:
        return 'Επαφή';
      case QrType.business:
        return 'Επιχείρηση';
      case QrType.visa:
        return 'Κάρτα Visa';
      case QrType.whatsapp:
        return 'WhatsApp';
      case QrType.x:
        return 'X';
      case QrType.email:
        return 'Email';
      case QrType.instagram:
        return 'Instagram';
      case QrType.phone:
        return 'Τηλέφωνο';
      case QrType.data:
        return 'Δεδομένα';
    }
  }
}
