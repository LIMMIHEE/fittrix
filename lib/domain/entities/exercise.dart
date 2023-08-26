class Exercise {
  String name = '';
  String imageUrl = '';
  String imageCopyright = '';
  String id = '';

  Exercise({
    this.name = '',
    this.imageUrl = '',
    this.imageCopyright = '',
    this.id = '',
  });

  Exercise.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    imageCopyright = json['imageCopyright'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['imageCopyright'] = imageCopyright;
    data['id'] = id;
    return data;
  }
}
