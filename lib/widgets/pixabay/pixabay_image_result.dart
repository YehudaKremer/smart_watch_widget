// ignore_for_file: non_constant_identifier_names

class PixabayImage {
  int? id;
  String? pageURL;
  String? type;
  String? tags;
  String? previewURL;
  int? previewWidth;
  int? previewHeight;
  String? webformatURL;
  int? webformatWidth;
  int? webformatHeight;
  String? largeImageURL;
  String? fullHDURL;
  String? imageURL;
  int? imageWidth;
  int? imageHeight;
  int? imageSize;
  int? views;
  int? downloads;
  int? likes;
  int? comments;
  int? user_id;
  String? user;
  String? userImageURL;

  PixabayImage(
      {this.id,
      this.pageURL,
      this.type,
      this.tags,
      this.previewURL,
      this.previewWidth,
      this.previewHeight,
      this.webformatURL,
      this.webformatWidth,
      this.webformatHeight,
      this.largeImageURL,
      this.fullHDURL,
      this.imageURL,
      this.imageWidth,
      this.imageHeight,
      this.imageSize,
      this.views,
      this.downloads,
      this.likes,
      this.comments,
      this.user_id,
      this.user,
      this.userImageURL});

  factory PixabayImage.fromJson(Map<String, dynamic> json) => PixabayImage(
        id: json["id"],
        pageURL: json["pageURL"],
        type: json["type"],
        tags: json["tags"],
        previewURL: json["previewURL"],
        previewWidth: json["previewWidth"],
        previewHeight: json["previewHeight"],
        webformatURL: json["webformatURL"],
        webformatWidth: json["webformatWidth"],
        webformatHeight: json["webformatHeight"],
        largeImageURL: json["largeImageURL"],
        fullHDURL: json["fullHDURL"],
        imageURL: json["imageURL"],
        imageWidth: json["imageWidth"],
        imageHeight: json["imageHeight"],
        imageSize: json["imageSize"],
        views: json["views"],
        downloads: json["downloads"],
        likes: json["likes"],
        comments: json["comments"],
        user_id: json["user_id"],
        user: json["user"],
        userImageURL: json["userImageURL"],
      );
}

class PixabayImageResult {
  int? total;
  int? totalHits;
  List<PixabayImage>? hits;

  PixabayImageResult({this.total, this.totalHits, this.hits});

  factory PixabayImageResult.fromJson(Map<String, dynamic> json) =>
      PixabayImageResult(
          total: json["total"],
          totalHits: json["totalHits"],
          hits: json["hits"]
              .map<PixabayImage>((json) => PixabayImage.fromJson(json))
              .toList());
}
