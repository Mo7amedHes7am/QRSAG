import 'package:hive/hive.dart' show BinaryWriter, BinaryReader, TypeAdapter;
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';

class HistoryAdapter extends TypeAdapter<HistoryModel> {
  @override
  final int typeId = 2;

  @override
  HistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};

    for (var i = 0; i < numOfFields; i++) {
      final key = reader.readByte();
      fields[key] = reader.read();
    }

    return HistoryModel(
      data: fields[0] as String,
      id: fields[1] as String,
      type: fields[2] as String,
      img: fields[3] as String,
      arlabel: fields[4] as String,
      enlabel: fields[5] as String,
      datesubmitted: fields[6] as int,
      wifi: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    final fields = <int, dynamic>{
      0: obj.data,
      1: obj.id,
      2: obj.type,
      3: obj.img,
      4: obj.arlabel,
      5: obj.enlabel,
      6: obj.datesubmitted,
      7: obj.wifi,
    };

    writer.writeByte(fields.length);
    fields.forEach((key, value) {
      writer
        ..writeByte(key)
        ..write(value);
    });
  }
}
