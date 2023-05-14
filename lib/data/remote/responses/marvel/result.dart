import 'package:marvel_app/data/remote/responses/marvel/characters.dart';
import 'package:marvel_app/data/remote/responses/marvel/creators.dart';
import 'package:marvel_app/data/remote/responses/marvel/date.dart';
import 'package:marvel_app/data/remote/responses/marvel/price.dart';
import 'package:marvel_app/data/remote/responses/marvel/variant.dart';
import 'comics.dart';
import 'events.dart';
import 'series.dart';
import 'stories.dart';
import 'thumbnail.dart';
import 'url.dart';

class Result {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceUri;
  Series? series;
  Stories? stories;
  Events? events;
  List<Url>? urls;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<dynamic>? textObjects;
  List<Variant>? variants;
  List<dynamic>? collections;
  List<dynamic>? collectedIssues;
  List<Date>? dates;
  List<Price>? prices;
  List<dynamic>? images;
  Creators? creators;
  Characters? characters;
  Comics? comics;

  Result({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        modified: json['modified'] as String?,
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
        resourceUri: json['resourceURI'] as String?,
        comics: json['comics'] == null
            ? null
            : Comics.fromJson(json['comics'] as Map<String, dynamic>),
        series: json['series'] == null
            ? null
            : Series.fromJson(json['series'] as Map<String, dynamic>),
        stories: json['stories'] == null
            ? null
            : Stories.fromJson(json['stories'] as Map<String, dynamic>),
        events: json['events'] == null
            ? null
            : Events.fromJson(json['events'] as Map<String, dynamic>),
        urls: (json['urls'] as List<dynamic>?)
            ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'modified': modified,
        'thumbnail': thumbnail?.toJson(),
        'resourceURI': resourceUri,
        'comics': comics?.toJson(),
        'series': series?.toJson(),
        'stories': stories?.toJson(),
        'events': events?.toJson(),
        'urls': urls?.map((e) => e.toJson()).toList(),
      };
}
