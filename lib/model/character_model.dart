import 'dart:convert';

import 'package:flutter/foundation.dart';

class CharacterModel {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  Data data;

  CharacterModel(
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.etag,
    this.data,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'status': status});
    result.addAll({'copyright': copyright});
    result.addAll({'attributionText': attributionText});
    result.addAll({'attributionHTML': attributionHTML});
    result.addAll({'etag': etag});
    result.addAll({'data': data.toMap()});

    return result;
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      map['code']?.toInt(),
      map['status'],
      map['copyright'],
      map['attributionText'],
      map['attributionHTML'],
      map['etag'],
      map['data'] = Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharacterModel(code: $code, status: $status, copyright: $copyright, attributionText: $attributionText, attributionHTML: $attributionHTML, etag: $etag, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharacterModel &&
        other.code == code &&
        other.status == status &&
        other.copyright == copyright &&
        other.attributionText == attributionText &&
        other.attributionHTML == attributionHTML &&
        other.etag == etag &&
        other.data == data;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        status.hashCode ^
        copyright.hashCode ^
        attributionText.hashCode ^
        attributionHTML.hashCode ^
        etag.hashCode ^
        data.hashCode;
  }
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Results> results;

  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  Data copyWith({
    int? offset,
    int? limit,
    int? total,
    int? count,
    List<Results>? results,
  }) {
    return Data(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      total: total ?? this.total,
      count: count ?? this.count,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'offset': offset});
    result.addAll({'limit': limit});
    result.addAll({'total': total});
    result.addAll({'count': count});
    result.addAll({'results': results.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      offset: map['offset']?.toInt(),
      limit: map['limit']?.toInt(),
      total: map['total']?.toInt(),
      count: map['count']?.toInt(),
      results: map['results'] =
          List<Results>.from(map['results']?.map((x) => Results.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(offset: $offset, limit: $limit, total: $total, count: $count, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.offset == offset &&
        other.limit == limit &&
        other.total == total &&
        other.count == count &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return offset.hashCode ^
        limit.hashCode ^
        total.hashCode ^
        count.hashCode ^
        results.hashCode;
  }
}

class Results {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceURI;
  Comics comics;
  Comics series;
  Comics stories;
  Comics events;
  List<Urls> urls;

  Results(
      this.id,
      this.name,
      this.description,
      this.modified,
      this.thumbnail,
      this.resourceURI,
      this.comics,
      this.series,
      this.stories,
      this.events,
      this.urls);

  Results copyWith({
    int? id,
    String? name,
    String? description,
    String? modified,
    Thumbnail? thumbnail,
    String? resourceURI,
    Comics? comics,
    Comics? series,
    Comics? stories,
    Comics? events,
    List<Urls>? urls,
  }) {
    return Results(
      id ?? this.id,
      name ?? this.name,
      description ?? this.description,
      modified ?? this.modified,
      thumbnail ?? this.thumbnail,
      resourceURI ?? this.resourceURI,
      comics ?? this.comics,
      series ?? this.series,
      stories ?? this.stories,
      events ?? this.events,
      urls ?? this.urls,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'modified': modified});
    result.addAll({'thumbnail': thumbnail.toMap()});
    result.addAll({'resourceURI': resourceURI});
    result.addAll({'comics': comics.toMap()});
    result.addAll({'series': series.toMap()});
    result.addAll({'stories': stories.toMap()});
    result.addAll({'events': events.toMap()});
    result.addAll({'urls': urls.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      map['id']?.toInt(),
      map['name'],
      map['description'],
      map['modified'],
      map['thumbnail'] = Thumbnail.fromMap(map['thumbnail']),
      map['resourceURI'],
      map['comics'] = Comics.fromMap(map['comics']),
      map['series'] = Comics.fromMap(map['series']),
      map['stories'] = Comics.fromMap(map['stories']),
      map['events'] = Comics.fromMap(map['events']),
      map['urls'] = List<Urls>.from(map['urls']?.map((x) => Urls.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Results(id: $id, name: $name, description: $description, modified: $modified, thumbnail: $thumbnail, resourceURI: $resourceURI, comics: $comics, series: $series, stories: $stories, events: $events, urls: $urls)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Results &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.modified == modified &&
        other.thumbnail == thumbnail &&
        other.resourceURI == resourceURI &&
        other.comics == comics &&
        other.series == series &&
        other.stories == stories &&
        other.events == events &&
        listEquals(other.urls, urls);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        modified.hashCode ^
        thumbnail.hashCode ^
        resourceURI.hashCode ^
        comics.hashCode ^
        series.hashCode ^
        stories.hashCode ^
        events.hashCode ^
        urls.hashCode;
  }
}

class Thumbnail {
  String path;
  String ext;

  Thumbnail({
    required this.path,
    required this.ext,
  });

  Thumbnail copyWith({
    String? path,
    String? ext,
  }) {
    return Thumbnail(
      path: path ?? this.path,
      ext: ext ?? this.ext,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'path': path});
    result.addAll({'extension': ext});

    return result;
  }

  factory Thumbnail.fromMap(Map<String, dynamic> map) {
    return Thumbnail(
      path: map['path'],
      ext: map['extension'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromJson(String source) =>
      Thumbnail.fromMap(json.decode(source));

  @override
  String toString() => 'Thumbnail(path: $path, ext: $ext)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Thumbnail && other.path == path && other.ext == ext;
  }

  @override
  int get hashCode => path.hashCode ^ ext.hashCode;
}

class Comics {
  int available;
  String collectionURI;
  List<Items> items;
  int returned;

  Comics({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  Comics copyWith({
    int? available,
    String? collectionURI,
    List<Items>? items,
    int? returned,
  }) {
    return Comics(
      available: available ?? this.available,
      collectionURI: collectionURI ?? this.collectionURI,
      items: items ?? this.items,
      returned: returned ?? this.returned,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'available': available});
    result.addAll({'collectionURI': collectionURI});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});
    result.addAll({'returned': returned});

    return result;
  }

  factory Comics.fromMap(Map<String, dynamic> map) {
    return Comics(
      available: map['available']?.toInt(),
      collectionURI: map['collectionURI'],
      items: map['items'] =
          List<Items>.from(map['items']?.map((x) => Items.fromMap(x))),
      returned: map['returned']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comics.fromJson(String source) => Comics.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comics(available: $available, collectionURI: $collectionURI, items: $items, returned: $returned)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comics &&
        other.available == available &&
        other.collectionURI == collectionURI &&
        listEquals(other.items, items) &&
        other.returned == returned;
  }

  @override
  int get hashCode {
    return available.hashCode ^
        collectionURI.hashCode ^
        items.hashCode ^
        returned.hashCode;
  }
}

class Items {
  String resourceURI;
  String name;
  String type;

  Items({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  Items copyWith({
    String? resourceURI,
    String? name,
    String? type,
  }) {
    return Items(
      resourceURI: resourceURI ?? this.resourceURI,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'resourceURI': resourceURI});
    result.addAll({'name': name});
    result.addAll({'type': type});

    return result;
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      resourceURI: map['resourceURI'],
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));

  @override
  String toString() =>
      'Items(resourceURI: $resourceURI, name: $name, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Items &&
        other.resourceURI == resourceURI &&
        other.name == name &&
        other.type == type;
  }

  @override
  int get hashCode => resourceURI.hashCode ^ name.hashCode ^ type.hashCode;
}

class Urls {
  String type;
  String url;

  Urls({
    required this.type,
    required this.url,
  });

  Urls copyWith({
    String? type,
    String? url,
  }) {
    return Urls(
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'url': url});

    return result;
  }

  factory Urls.fromMap(Map<String, dynamic> map) {
    return Urls(
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Urls.fromJson(String source) => Urls.fromMap(json.decode(source));

  @override
  String toString() => 'Urls(type: $type, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Urls && other.type == type && other.url == url;
  }

  @override
  int get hashCode => type.hashCode ^ url.hashCode;
}
