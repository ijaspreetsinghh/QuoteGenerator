import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

List<Tags> tagsFromJson(String str) =>
    List<Tags>.from(json.decode(str).map((x) => Tags.fromJson(x)));

String tagsToJson(List<Tags> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tags extends ChangeNotifier {
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
  Future gettingTags;

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

Quotes quotesFromJson(String str) => Quotes.fromJson(json.decode(str));

String quotesToJson(Quotes data) => json.encode(data.toJson());

class Quotes extends ChangeNotifier {
  Quotes(
      {this.count,
      this.totalCount,
      this.lastItemIndex,
      this.results,
      this.category});

  int count;
  int totalCount;
  int lastItemIndex;
  String category;
  List<Result> results;

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        count: json["count"],
        totalCount: json["totalCount"],
        lastItemIndex: json["lastItemIndex"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "totalCount": totalCount,
        "lastItemIndex": lastItemIndex,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result extends ChangeNotifier {
  Result({
    this.tags,
    this.id,
    this.content,
    this.author,
    this.authorSlug,
    this.length,
  });

  List<Tag> tags;
  String id;
  String content;
  String author;
  String authorSlug;
  int length;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tags: List<Tag>.from(json["tags"].map((x) => tagValues.map[x])),
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        authorSlug: json["authorSlug"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => tagValues.reverse[x])),
        "_id": id,
        "content": content,
        "author": author,
        "authorSlug": authorSlug,
        "length": length,
      };
}

enum Tag {
  FRIENDSHIP,
  FAMOUS_QUOTES,
  WISDOM,
  INSPIRATIONAL,
  TECHNOLOGY,
  RELIGION
}

final tagValues = EnumValues({
  "famous-quotes": Tag.FAMOUS_QUOTES,
  "friendship": Tag.FRIENDSHIP,
  "inspirational": Tag.INSPIRATIONAL,
  "religion": Tag.RELIGION,
  "technology": Tag.TECHNOLOGY,
  "wisdom": Tag.WISDOM
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
