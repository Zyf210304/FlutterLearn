class HomePageEntity {
  List<BannerEntity> bannerList;
  List<BrandEntity> brandList;
  List<ShareEntity> shareList;

  HomePageEntity({this.bannerList, this.brandList, this.shareList});

  HomePageEntity.fromJson(Map<String, dynamic> data) {
  //  this.bannerList = data['ad_list_1'];
    this.brandList = (data['brand_list'] as List)
        .map((i) => BrandEntity.fromJson(i))
        .toList();
    this.shareList = (data['share_list'] as List)
        .map((i) => ShareEntity.fromJson(i))
        .toList();
  }
}

class BannerEntity {
}

class BrandEntity {
  int brandId;
  String brandName;
  String logo;

  BrandEntity({this.brandId, this.brandName, this.logo});

  BrandEntity.fromJson(Map<String, dynamic> map) {
    this.brandId = map["brand_id"];
    this.brandName = map["brand_name"];
    this.logo = map["logo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map();
    map["brand_id"] = this.brandId;
    map["brand_name"] = this.brandName;
    map["logo"] = this.logo;
    return map;
  }
}

class ShareEntity {
  int articleId;
  String title;
  String coverPic;
  String h5Details;

  ShareEntity({this.articleId, this.title, this.coverPic, this.h5Details});

  ShareEntity.fromJson(Map<String, dynamic> data) {
    this.articleId = data["article_id"];
    this.title = data["title"];
    this.coverPic = data["cover_pic"];
    this.h5Details = data["h5_details"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map["article_id"] = this.articleId;
    map["title"] = this.title;
    map["cover_pic"] = this.coverPic;
    map["h5_details"] = this.h5Details;
    return map;
  }

}