class CommentsModel {
  int ?id;
  int ?postId;
  String ?name;
  String ?email;
  String ?body;

  CommentsModel(this.id, this.postId, this.name, this.email, this.body);

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

}