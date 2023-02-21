// ignore_for_file: public_member_api_docs, sort_constructors_first

class ContentModel {
  ContentModel({
    required this.module,
    required this.listData,
    required this.dataCount,
    required this.params,
  });

  final String module;
  final List<Datum> listData;
  final int dataCount;
  final Params params;

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        module: json["module"],
        listData: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"],
        params: Params.fromJson(json["params"]),
      );

  Map<String, dynamic> toJson() => {
        "module": module,
        "data": List<dynamic>.from(listData.map((x) => x.toJson())),
        "data_count": dataCount,
        "params": params.toJson(),
      };
}

class Datum {
  Datum({
    required this.judul,
    required this.catatan,
    required this.id,
  });

  final String? judul;
  final String? catatan;
  final int id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        judul: json["judul"] ?? '',
        catatan: json["catatan"] ?? '',
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "catatan": catatan,
        "id": id,
      };

  @override
  String toString() => 'Datum(judul: $judul, catatan: $catatan, id: $id)';
}

class Params {
  Params();

  factory Params.fromJson(Map<String, dynamic> json) => Params();

  Map<String, dynamic> toJson() => {};
}
