class Exhibition {
  String imgUrl;
  String date;
  String title;
  String address;

  Exhibition({this.imgUrl, this.date, this.title, this.address});

  Exhibition.fromJson(json){
    this.imgUrl = json['imgUrl'];
    this.title = json['title'];
    this.address = json['address'];
    this.date = json['date'];
  }
}
