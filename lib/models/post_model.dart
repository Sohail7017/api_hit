class ReactionsModel {
  int likes;
  int dislikes;

  ReactionsModel({
    required this.likes ,
    required this.dislikes});

  /// From JSON

factory ReactionsModel.fromJson(Map<String,dynamic> json){
  return ReactionsModel(
      likes: json['likes'],
      dislikes: json['dislikes']);
}

}

class PostModel {
  String body;
  int id;
  ReactionsModel reactions;
  List<dynamic> tags;
  String title;
  int userID;
  int views;

  PostModel({required this.body,
    required this.id,
    required this.reactions,
    required this.tags,
    required this.title,
    required this.userID,
    required this.views});

  /// From JSON

    factory PostModel.fromJson(Map<String, dynamic> json){
      return PostModel(
        body: json['body'],
        id: json['id'],
        reactions: ReactionsModel.fromJson(json['reactions']),
        tags: json['tags'],
        title: json['title'],
        userID: json['userID'],
        views: json['views'],
      );
    }

}

class PostDataModel {
  int limit;
  List<PostModel> posts;
  int skip;
  int total;

  PostDataModel({required this.limit, required this.posts,required this.skip,required this.total});

  /// From JSON
  factory PostDataModel.fromJson(Map<String,dynamic> json){
    List<PostModel> mPost =[];
    for(Map<String,dynamic> eachPost in json['posts']){
      PostModel posts = PostModel.fromJson(eachPost);
      mPost.add(posts);

    }
    return PostDataModel(
      limit: json['limit'],
      posts: mPost,
      skip: json['skip'],
      total: json['total']
    );
  }


}