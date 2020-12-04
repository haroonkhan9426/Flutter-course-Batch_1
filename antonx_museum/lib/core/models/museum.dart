class Museum {
  String title;
  String address;
  String imgUrl;

  Museum({this.title, this.address, this.imgUrl});

  Museum.fromJson(json) {
    this.title = json['title'];
    this.address = json['address'];
    this.imgUrl = json['imgUrl'];
  }

  toJson() {
    return {
      'title': this.title,
      'address': this.address,
      'imgUrl': this.imgUrl
    };
  }
}
