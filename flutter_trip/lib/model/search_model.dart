


class SearchModel {
  final List<SearchItem> data;
  String keyword;
  
  SearchModel({this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List;
    List<SearchItem> data = dataJson.map((i)=>SearchItem.fromJson(i)).toList();
    return SearchModel(data:  data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }

}




class SearchItem {

  final String word;
  final String type;
  final String price;
  final String star;
  final String zonename;
  final String districtname;
  final String url;

  SearchItem({this.word, this.type, this.price, this.star, this.zonename, this.districtname, this.url});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      word: json['word'],
      type: json['type'],
      price: json['type'],
      star: json['star'],
      zonename: json['zonename'],
      districtname: json['districtname'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    data['type'] = this.type;
    data['url'] = this.url;
    data['type'] = this.type;
    data['star'] = this.star;
    data['zonename'] = this.zonename;
    data['districtname'] = this.districtname;
    return data;
  }


}