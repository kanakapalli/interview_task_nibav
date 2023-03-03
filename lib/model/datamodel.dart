// To parse this JSON data, do
//
//     final pageData = pageDataFromJson(jsonString);

import 'dart:convert';

PageData pageDataFromJson(String str) => PageData.fromJson(json.decode(str));

String pageDataToJson(PageData data) => json.encode(data.toJson());

class PageData {
  PageData({
    required this.result,
    required this.returnType,
    required this.subtype,
    required this.duration,
    required this.data,
  });

  String result;
  String returnType;
  String subtype;
  double duration;
  Data data;

  factory PageData.fromJson(Map<String, dynamic> json) => PageData(
        result: json["result"],
        returnType: json["return_type"],
        subtype: json["subtype"],
        duration: json["duration"]?.toDouble(),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "return_type": returnType,
        "subtype": subtype,
        "duration": duration,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.nextItems,
    required this.sport,
    required this.newslist,
  });

  int nextItems;
  String sport;
  List<Newslist> newslist;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nextItems: json["next_items"],
        sport: json["sport"],
        newslist: List<Newslist>.from(
            json["newslist"].map((x) => Newslist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "next_items": nextItems,
        "sport": sport,
        "newslist": List<dynamic>.from(newslist.map((x) => x.toJson())),
      };
}

class Newslist {
  Newslist({
    required this.id,
    required this.pid,
    required this.time,
    required this.timePst,
    required this.pname,
    required this.isFavorite,
    required this.position,
    required this.title,
    required this.details,
    required this.source,
    required this.sourceName,
    required this.sourceUrl,
    required this.sourceLogo,
    required this.hashUrl,
    required this.type,
    required this.playerImageUrl,
    required this.proOnly,
  });

  String id;
  String pid;
  Time time;
  DateTime timePst;
  String pname;
  bool isFavorite;
  String position;
  String title;
  String details;
  String source;
  SourceName sourceName;
  String sourceUrl;
  String sourceLogo;
  String hashUrl;
  Type type;
  String playerImageUrl;
  bool proOnly;

  factory Newslist.fromJson(Map<String, dynamic> json) => Newslist(
        id: json["id"],
        pid: json["pid"],
        time: timeValues.map[json["time"]]!,
        timePst: DateTime.parse(json["time_pst"]),
        pname: json["pname"],
        isFavorite: json["is_favorite"],
        position: json["position"],
        title: json["title"],
        details: json["details"],
        source: json["source"],
        sourceName: sourceNameValues.map[json["source_name"]]!,
        sourceUrl: json["source_url"],
        sourceLogo: json["source_logo"],
        hashUrl: json["hash_url"],
        type: typeValues.map[json["type"]]!,
        playerImageUrl: json["player_image_url"],
        proOnly: json["pro_only"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pid": pid,
        "time": timeValues.reverse[time],
        "time_pst": timePst.toIso8601String(),
        "pname": pname,
        "is_favorite": isFavorite,
        "position": position,
        "title": title,
        "details": details,
        "source": source,
        "source_name": sourceNameValues.reverse[sourceName],
        "source_url": sourceUrl,
        "source_logo": sourceLogo,
        "hash_url": hashUrl,
        "type": typeValues.reverse[type],
        "player_image_url": playerImageUrl,
        "pro_only": proOnly,
      };
}

enum SourceName { ROTOWORLD, CBSSPORTS, ROTOBALLER }

final sourceNameValues = EnumValues({
  "cbssports": SourceName.CBSSPORTS,
  "rotoballer": SourceName.ROTOBALLER,
  "rotoworld": SourceName.ROTOWORLD
});

enum Time { THE_101222 }

final timeValues = EnumValues({"10/12/22": Time.THE_101222});

enum Type { NEWS }

final typeValues = EnumValues({"news": Type.NEWS});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
