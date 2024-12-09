enum BlockType {
  story,
  banner,
  reels,
  cta,
  inShorts,
  masterClass,
  events,
}

extension BlockTypeExtension on BlockType {
  String get stringValue {
    switch (this) {
      case BlockType.story:
        return "story";
      case BlockType.banner:
        return "banners";
      case BlockType.reels:
        return "reels";
      case BlockType.cta:
        return "cta";
      case BlockType.inShorts:
        return "inshorts";
      case BlockType.masterClass:
        return "masterclass";
      case BlockType.events:
        return "events";
    }
  }
}
enum MediaType{
  image,
  video,
}

extension MediaTypeExtension on MediaType {
  String get stringValue {
    switch (this) {
      case MediaType.image:
        return "image";
      case MediaType.video:
        return "video";
     
    }
  }
}
