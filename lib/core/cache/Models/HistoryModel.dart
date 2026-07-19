
class HistoryModel{
  String data, id, type, img;
  String? wifi;
  int datesubmitted;

  HistoryModel({
    required this.data,
    required this.id,
    required this.type,
    required this.img,
    required this.datesubmitted,
    this.wifi
  });
}