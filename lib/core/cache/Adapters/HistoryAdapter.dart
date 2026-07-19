import 'package:hive/hive.dart';
import 'package:qr_scanner_and_generator/core/cache/Models/HistoryModel.dart';

class HistoryAdapter extends TypeAdapter<HistoryModel> {
  @override
  final int typeId = 2;

  @override
  HistoryModel read(BinaryReader reader) {
    final data = reader.readString();
    final id = reader.readString();
    final type = reader.readString();
    final datesubmitted = reader.readInt();
    final img = reader.readString();

    return HistoryModel(
      data: data,
      id: id,
      type: type,
      datesubmitted: datesubmitted,
      img: img,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    writer.writeString(obj.data);
    writer.writeString(obj.id);
    writer.writeString(obj.type);
    writer.writeInt(obj.datesubmitted);
    writer.writeString(obj.img);
  }
}
