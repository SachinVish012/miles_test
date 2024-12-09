class HomeDataModel {
  HomeDataModel({
    this.data = const [],
  });

  List<BlockData> data;

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        data: json["data"] != null
            ? List<BlockData>.from(json["data"].map((x) => BlockData.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BlockData {
  BlockData({
    this.id = "",
    this.blockType = "",
    this.name = "",
    this.heading = "",
    this.position = 0,
    this.count = 0,
    this.active = false,
    this.createdAt,
    this.updatedAt,
    this.vertical = "",
    this.createdBy = "",
    this.modifiedBy = "",
    this.posts = const [],
  });

  String id;
  String blockType;
  String name;
  String? heading;
  int position;
  int count;
  bool active;
  DateTime? createdAt;
  DateTime? updatedAt;
  String vertical;
  String? createdBy;
  String? modifiedBy;
  List<Post> posts;

  factory BlockData.fromJson(Map<String, dynamic> json) => BlockData(
        id: json["id"] ?? "",
        blockType: json["block_type"] ?? "",
        name: json["name"] ?? "",
        heading: json["heading"] ?? "",
        position: json["position"] ?? 0,
        count: json["count"] ?? 0,
        active: json["active"] ?? false,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        vertical: json["vertical"] ?? "",
        createdBy: json["created_by"] ?? "",
        modifiedBy: json["modified_by"] ?? "",
        posts: json["posts"] != null
            ? List<Post>.from(json["posts"].map((x) => Post.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "block_type": blockType,
        "name": name,
        "heading": heading,
        "position": position,
        "count": count,
        "active": active,
        "created_at": createdAt?.toIso8601String() ?? "",
        "updated_at": updatedAt?.toIso8601String() ?? "",
        "vertical": vertical,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class Post {
  Post({
    this.id = "",
    this.files = const [],
    this.likedByMe = false,
    this.title = "",
    this.postType = "",
    this.description = "",
    this.metadata = "",
    this.fullVideoUrl,
    this.blogUrl,
    this.active = false,
    this.featured = false,
    this.priority = 0,
    this.likes = 0,
    this.createdAt,
    this.updatedAt,
    this.createdBy = "",
    this.layout = "",
    this.persona,
    this.modifiedBy,
  });

  String id;
  List<FileElement> files;
  bool likedByMe;
  String title;
  String postType;
  String description;
  String metadata;
  String? fullVideoUrl;
  String? blogUrl;
  bool active;
  bool featured;
  int priority;
  int likes;
  DateTime? createdAt;
  DateTime? updatedAt;
  String createdBy;
  String layout;
  dynamic persona;
  String? modifiedBy;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"] ?? "",
        files: json["files"] != null
            ? List<FileElement>.from(
                json["files"].map((x) => FileElement.fromJson(x)))
            : [],
        likedByMe: json["liked_by_me"] ?? false,
        title: json["title"] ?? "",
        postType: json["post_type"] ?? "",
        description: json["description"] ?? "",
        metadata: json["metadata"] ?? "",
        fullVideoUrl: json["full_video_url"],
        blogUrl: json["blog_url"],
        active: json["active"] ?? false,
        featured: json["featured"] ?? false,
        priority: json["priority"] ?? 0,
        likes: json["likes"] ?? 0,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        createdBy: json["created_by"] ?? "",
        layout: json["layout"] ?? "",
        persona: json["persona"],
        modifiedBy: json["modified_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "liked_by_me": likedByMe,
        "title": title,
        "post_type": postType,
        "description": description,
        "metadata": metadata,
        "full_video_url": fullVideoUrl,
        "blog_url": blogUrl,
        "active": active,
        "featured": featured,
        "priority": priority,
        "likes": likes,
        "created_at": createdAt?.toIso8601String() ?? "",
        "updated_at": updatedAt?.toIso8601String() ?? "",
        "created_by": createdBy,
        "layout": layout,
        "persona": persona,
        "modified_by": modifiedBy,
      };
}

class FileElement {
  FileElement({
    this.id = "",
    this.mediaType = "",
    this.videoUrl,
    this.thumbnail,
    this.imagePath,
    this.mediaOrder = 0,
    this.ratio,
    this.active = false,
    this.post = "",
  });

  String id;
  String mediaType;
  String? videoUrl;
  String? thumbnail;
  String? imagePath;
  int mediaOrder;
  dynamic ratio;
  bool active;
  String post;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"] ?? "",
        mediaType: json["media_type"] ?? "",
        videoUrl: json["video_url"],
        thumbnail: json["thumbnail"],
        imagePath: json["image_path"],
        mediaOrder: json["media_order"] ?? 0,
        ratio: json["ratio"],
        active: json["active"] ?? false,
        post: json["post"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media_type": mediaType,
        "video_url": videoUrl,
        "thumbnail": thumbnail,
        "image_path": imagePath,
        "media_order": mediaOrder,
        "ratio": ratio,
        "active": active,
        "post": post,
      };
}
