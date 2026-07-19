import 'package:hive/hive.dart' show BinaryWriter, BinaryReader, TypeAdapter;
import 'package:qr_scanner_and_generator/core/cache/Models/GlobalCacheModel.dart';

class GlobalCacheAdapter extends TypeAdapter<GlobalCacheModel> {
  @override
  final int typeId = 1;

  @override
  GlobalCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < numOfFields; i++) {
      final key = reader.readByte();
      fields[key] = reader.read();
    }

    return GlobalCacheModel(
      onboarding: fields[0] as bool,
      theme: fields[1] as int,
      language: fields[2] as String,
      vibrate: fields[3] as bool,
      beep: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GlobalCacheModel obj) {
    final fields = <int, dynamic>{
      0: obj.onboarding,
      1: obj.theme,
      2: obj.language,
      3: obj.vibrate,
      4: obj.beep,
    };

    writer.writeByte(fields.length);
    fields.forEach((key, value) {
      writer
        ..writeByte(key)
        ..write(value);
    });
  }
}
