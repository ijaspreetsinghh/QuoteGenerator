import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

List<Tags> tagsFromJson(String str) =>
    List<Tags>.from(json.decode(str).map((x) => Tags.fromJson(x)));

String tagsToJson(List<Tags> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tags with ChangeNotifier {
  Tags({
    this.id,
    this.name,
    this.v,
    this.quoteCount,
  });

  String id;
  String name;
  int v;
  int quoteCount;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
        quoteCount: json["quoteCount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
        "quoteCount": quoteCount,
      };
  Future<List<Tags>> getTags() async {
    http.Response response =
        await http.get(Uri.https('api.quotable.io', 'tags'));
    final tags = tagsFromJson(response.body);
    return tags;
  }
}
