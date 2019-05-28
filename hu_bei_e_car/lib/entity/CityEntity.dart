class CityEntity {
  NowRegionEntity nowRegion;
  List<HotListEntity> hotList;
  List<CityListEntity> cityList;

  CityEntity(this.nowRegion, this.hotList, this.cityList);

  CityEntity.fromJson(Map<String, dynamic> data) {
    this.nowRegion = NowRegionEntity.fromJson(data['now_region']);
    this.hotList = (data['hot_list'] as List)
        .map((i) => HotListEntity.fromJson(i))
        .toList();
    this.cityList = (data['city_list'] as List)
        .map((i) => CityListEntity.fromJson(i))
        .toList();
  }
}

class NowRegionEntity {
  int code;
  String fullName;
  int isHot;

  NowRegionEntity(this.code, this.fullName, this.isHot);

  NowRegionEntity.fromJson(Map<String, dynamic> map) {
    this.code = map["code"];
    this.fullName = map["fullName"];
    this.isHot = map["is_hot"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map();
    map["code"] = this.code;
    map["fullName"] = this.fullName;
    map["is_hot"] = this.isHot;
    return map;
  }
}

class HotListEntity {
  int code;
  String fullName;
  int isHot;
  String initial;

  HotListEntity(this.code, this.fullName, this.isHot, this.initial);

  HotListEntity.fromJson(Map<String, dynamic> map) {
    this.code = map["code"];
    this.fullName = map["fullName"];
    this.isHot = map["is_hot"];
    this.initial = map["initial"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map();
    map["code"] = this.code;
    map["fullName"] = this.fullName;
    map["is_hot"] = this.isHot;
    map["initial"] = this.initial;
    return map;
  }
}

class CityListEntity {
  int code;
  String fullName;
  int isHot;
  String initial;

  CityListEntity(this.code, this.fullName, this.isHot, this.initial);

  CityListEntity.fromJson(Map<String, dynamic> map) {
    this.code = map["code"];
    this.fullName = map["fullName"];
    this.isHot = map["is_hot"];
    this.initial = map["initial"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map();
    map["code"] = this.code;
    map["fullName"] = this.fullName;
    map["is_hot"] = this.isHot;
    map["initial"] = this.initial;
    return map;
  }
}
