class Workout {
  String createTime = '';
  String exerciseType = '';
  String message = '';
  String id = '';

  Workout(
      {this.createTime = '',
      this.exerciseType = '',
      this.message = '',
      this.id = ''});

  Workout.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    exerciseType = json['exerciseType'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createTime'] = createTime;
    data['exerciseType'] = exerciseType;
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}
