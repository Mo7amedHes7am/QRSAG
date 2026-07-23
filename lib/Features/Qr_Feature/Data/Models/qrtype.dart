import 'package:qr_scanner_and_generator/core/utils/app_images.dart';

enum QrType {
  text('نص', 'Text', AppSvgs.text),
  website('موقع إلكتروني', 'Website', AppSvgs.website),
  wifi('واي فاي', 'Wifi', AppSvgs.wifi),
  // event('حدث', 'Event', AppSvgs.event),
  contact('جهة اتصال', 'Contact', AppSvgs.contact),
  // business('عمل تجاري', 'Business', AppSvgs.business),
  // visa('بطاقة فيزا', 'Visa Card', AppSvgs.visa),
  whatsapp('واتساب', 'WhatsApp', AppSvgs.whatsapp),
  x('إكس', 'X', AppSvgs.twitter),
  email('بريد إلكتروني', 'Email', AppSvgs.email),
  instagram('إنستغرام', 'Instagram', AppSvgs.instagram),
  phone('هاتف', 'Telephone', AppSvgs.phone),
  data('بيانات', 'Data', AppSvgs.data);

  final String arlabel;
  final String enlabel;
  final String image;

  const QrType(this.arlabel, this.enlabel, this.image);

  static List<QrType> get all => [
    QrType.text,
    QrType.website,
    QrType.wifi,
    // QrType.event,
    QrType.contact,
    // QrType.business,
    // QrType.visa,
    QrType.whatsapp,
    QrType.x,
    QrType.email,
    QrType.instagram,
    QrType.phone,
  ];
}
