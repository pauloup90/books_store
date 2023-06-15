class BookModels {
  String? kind;
  num? totalItems;
  List<Items>? items;

  BookModels({
    this.kind,
    this.totalItems,
    this.items,
  });

  BookModels.fromJson(Map<String, dynamic> json) {
    kind = json['kind'] as String?;
    totalItems = json['totalItems'] as num?;
    items = (json['items'] as List?)
        ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class Items {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Items({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'] as String?;
    id = json['id'] as String?;
    etag = json['etag'] as String?;
    selfLink = json['selfLink'] as String?;
    volumeInfo = (json['volumeInfo'] as Map<String, dynamic>?) != null
        ? VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>)
        : null;
    saleInfo = (json['saleInfo'] as Map<String, dynamic>?) != null
        ? SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>)
        : null;
    accessInfo = (json['accessInfo'] as Map<String, dynamic>?) != null
        ? AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>)
        : null;
    searchInfo = (json['searchInfo'] as Map<String, dynamic>?) != null
        ? SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>)
        : null;
  }
}

class VolumeInfo {
  String? title;
  String? subtitle;
  List<dynamic>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  num? pageCount;
  String? printType;
  List<dynamic>? categories;
  num? averageRating;
  num? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo(
      {this.title,
        this.subtitle,
        this.authors,
        this.publisher,
        this.publishedDate,
        this.description,
        this.industryIdentifiers,
        this.readingModes,
        this.pageCount,
        this.printType,
        this.categories,
        this.averageRating,
        this.ratingsCount,
        this.maturityRating,
        this.allowAnonLogging,
        this.contentVersion,
        this.panelizationSummary,
        this.imageLinks,
        this.language,
        this.previewLink,
        this.infoLink,
        this.canonicalVolumeLink});

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    subtitle = json['subtitle'] ?? "";
    authors = (json['authors'] as List<dynamic>?)?.cast<String>();
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = <IndustryIdentifiers>[];
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers!.add(IndustryIdentifiers.fromJson(v));
      });
    }
    readingModes = json['readingModes'] != null
        ? ReadingModes.fromJson(json['readingModes'])
        : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    categories = (json['categories'] as List<dynamic>?)?.cast<String>();
    averageRating = json['averageRating'];
    ratingsCount = json['ratingsCount'];
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null
        ? PanelizationSummary.fromJson(json['panelizationSummary'])
        : null;
    imageLinks = json['imageLinks'] != null
        ? ImageLinks.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
  }
}

//--------
class IndustryIdentifiers {
  String? type;
  String? identifier;

  IndustryIdentifiers({
    this.type,
    this.identifier,
  });

  IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String?;
    identifier = json['identifier'] as String?;
  }
}

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({
    this.text,
    this.image,
  });

  ReadingModes.fromJson(Map<String, dynamic> json) {
    text = json['text'] as bool?;
    image = json['image'] as bool?;
  }
}

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  PanelizationSummary.fromJson(Map<String, dynamic> json) {
    containsEpubBubbles = json['containsEpubBubbles'] as bool?;
    containsImageBubbles = json['containsImageBubbles'] as bool?;
  }
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'] as String?;
    thumbnail = json['thumbnail'] as String?;
  }
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'] as String?;
    saleability = json['saleability'] as String?;
    isEbook = json['isEbook'] as bool?;
  }
}

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  AccessInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'] as String?;
    viewability = json['viewability'] as String?;
    embeddable = json['embeddable'] as bool?;
    publicDomain = json['publicDomain'] as bool?;
    textToSpeechPermission = json['textToSpeechPermission'] as String?;
    epub = (json['epub'] as Map<String, dynamic>?) != null
        ? Epub.fromJson(json['epub'] as Map<String, dynamic>)
        : null;
    pdf = (json['pdf'] as Map<String, dynamic>?) != null
        ? Pdf.fromJson(json['pdf'] as Map<String, dynamic>)
        : null;
    webReaderLink = json['webReaderLink'] as String?;
    accessViewStatus = json['accessViewStatus'] as String?;
    quoteSharingAllowed = json['quoteSharingAllowed'] as bool?;
  }
}

class Epub {
  bool? isAvailable;

  Epub({
    this.isAvailable,
  });

  Epub.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'] as bool?;
  }
}

class Pdf {
  bool? isAvailable;
  String? acsTokenLink;

  Pdf({
    this.isAvailable,
    this.acsTokenLink,
  });

  Pdf.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'] as bool?;
    acsTokenLink = json['acsTokenLink'] as String?;
  }
}

class SearchInfo {
  String? textSnippet;

  SearchInfo({
    this.textSnippet,
  });

  SearchInfo.fromJson(Map<String, dynamic> json) {
    textSnippet = json['textSnippet'] as String?;
  }
}