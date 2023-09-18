// To parse this JSON data, do
//
//     final gymResponse = gymResponseFromJson(jsonString);

import 'dart:convert';

GymResponse gymResponseFromJson(String str) =>
    GymResponse.fromJson(json.decode(str));

class GymResponse {
  List<Pagination>? pagination;
  bool? status;
  String? message;
  List<Gym>? gym;

  GymResponse({
    this.pagination,
    this.status,
    this.message,
    this.gym,
  });

  factory GymResponse.fromJson(Map<String, dynamic> json) => GymResponse(
        pagination: json["pagination"] == null
            ? []
            : List<Pagination>.from(
                json["pagination"].map((x) => Pagination.fromJson(x))),
        status: json["status"],
        message: json["message"],
        gym: json["data"] == null
            ? []
            : List<Gym>.from(json["data"].map((x) => Gym.fromJson(x))),
      );
}

class Gym {
  List<SeoContent>? seoContent;
  String? pocName;
  String? pocMobile;
  String? userId;
  String? gymName;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? latitude;
  String? longitude;
  String? pin;
  String? country;
  String? name;
  String? distance;
  String? addonCategory;
  String? addonCatId;
  String? offerType;
  String? offerValue;
  String? distanceText;
  String? durationText;
  String? duration;
  double? rating;
  String? text1;
  String? text2;
  String? planName;
  String? planDuration;
  String? planPrice;
  String? planDescription;
  String? coverImage;
  List<Gallery>? gallery;
  List<Benefit>? benefits;
  String? type;
  String? description;
  String? status;
  String? slug;
  String? categoryId;
  int? totalRating;
  String? isPartial;
  int? isCash;
  String? categoryName;
  String? wtfShare;
  String? isDiscount;

  Gym({
    this.seoContent,
    this.pocName,
    this.pocMobile,
    this.userId,
    this.gymName,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.latitude,
    this.longitude,
    this.pin,
    this.country,
    this.name,
    this.distance,
    this.addonCategory,
    this.addonCatId,
    this.offerType,
    this.offerValue,
    this.distanceText,
    this.durationText,
    this.duration,
    this.rating,
    this.text1,
    this.text2,
    this.planName,
    this.planDuration,
    this.planPrice,
    this.planDescription,
    this.coverImage,
    this.gallery,
    this.benefits,
    this.type,
    this.description,
    this.status,
    this.slug,
    this.categoryId,
    this.totalRating,
    this.isPartial,
    this.isCash,
    this.categoryName,
    this.wtfShare,
    this.isDiscount,
  });

  factory Gym.fromJson(Map<String, dynamic> json) => Gym(
        seoContent: json["seo_content"] == null
            ? []
            : List<SeoContent>.from(
                json["seo_content"].map((x) => SeoContent.fromJson(x))),
        pocName: json["poc_name"],
        pocMobile: json["poc_mobile"],
        userId: json["user_id"],
        gymName: json["gym_name"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        pin: json["pin"],
        country: json["country"],
        name: json["name"],
        distance: json["distance"],
        addonCategory: json["addon_category"],
        addonCatId: json["addon_cat_id"],
        offerType: json["offer_type"],
        offerValue: json["offer_value"],
        distanceText: json["distance_text"],
        durationText: json["duration_text"],
        duration: json["duration"],
        rating: json["rating"].toDouble(),
        text1: json["text1"],
        text2: json["text2"],
        planName: json["plan_name"],
        planDuration: json["plan_duration"],
        planPrice: json["plan_price"],
        planDescription: json["plan_description"],
        coverImage: json["cover_image"],
        gallery: json["gallery"] == null
            ? []
            : List<Gallery>.from(
                json["gallery"].map((x) => Gallery.fromJson(x))),
        benefits: json["benefits"] == null
            ? []
            : List<Benefit>.from(
                json["benefits"].map((x) => Benefit.fromJson(x))),
        type: json["type"],
        description: json["description"],
        status: json["status"],
        slug: json["slug"],
        categoryId: json["category_id"],
        totalRating: json["total_rating"],
        isPartial: json["is_partial"],
        isCash: json["is_cash"],
        categoryName: json["category_name"],
        wtfShare: json["wtf_share"].toString(),
        isDiscount: json["is_discount"].toString(),
      );
}

class Benefit {
  int? id;
  String? uid;
  String? gymId;
  String? name;
  String? breif;
  String? image;
  String? status;
  String? dateAdded;
  String? lastUpdated;
  String? images;

  Benefit({
    this.id,
    this.uid,
    this.gymId,
    this.name,
    this.breif,
    this.image,
    this.status,
    this.dateAdded,
    this.lastUpdated,
    this.images,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) => Benefit(
        id: json["id"],
        uid: json["uid"],
        gymId: json["gym_id"],
        name: json["name"],
        breif: json["breif"],
        image: json["image"],
        status: json["status"],
        dateAdded: json["date_added"],
        lastUpdated: json["last_updated"],
        images: json["images"],
      );
}

class Gallery {
  int? id;
  String? uid;
  String? gymId;
  String? categoryId;
  String? images;
  String? status;
  String? dateAdded;
  String? lastUpdated;
  String? type;

  Gallery({
    this.id,
    this.uid,
    this.gymId,
    this.categoryId,
    this.images,
    this.status,
    this.dateAdded,
    this.lastUpdated,
    this.type,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        uid: json["uid"],
        gymId: json["gym_id"],
        categoryId: json["category_id"],
        images: json["images"],
        status: json["status"],
        dateAdded: json["date_added"],
        lastUpdated: json["last_updated"],
        type: json["type"],
      );
}

class SeoContent {
  int? id;
  String? uid;
  String? gymId;
  String? htmlContent;
  String? status;
  String? dateAdded;
  String? addedBy;
  String? lastUpdated;
  String? pageName;
  String? className;

  SeoContent({
    this.id,
    this.uid,
    this.gymId,
    this.htmlContent,
    this.status,
    this.dateAdded,
    this.addedBy,
    this.lastUpdated,
    this.pageName,
    this.className,
  });

  factory SeoContent.fromJson(Map<String, dynamic> json) => SeoContent(
        id: json["id"],
        uid: json["uid"],
        gymId: json["gym_id"],
        htmlContent: json["html_content"],
        status: json["status"],
        dateAdded: json["date_added"],
        addedBy: json["added_by"],
        lastUpdated: json["last_updated"],
        pageName: json["page_name"],
        className: json["class_name"],
      );
}

class Pagination {
  int? pagination;
  int? limit;
  int? pages;

  Pagination({
    this.pagination,
    this.limit,
    this.pages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        pagination: json["pagination"],
        limit: json["limit"],
        pages: json["pages"],
      );
}
