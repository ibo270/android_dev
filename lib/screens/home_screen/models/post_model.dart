import 'package:android_dev/screens/home_screen/models/comment_model.dart';
class PostModel {
  final String? imageUrl;
  int? likeCount;
  int? commentCount;
  final String? description;
  final List<CommentModel> comments ;

  PostModel({
    this.imageUrl,
    this.likeCount,
    this.commentCount,
    this.description,
    this.comments = const [],
  });

  void addLike(int newCount) {
    // This method should ideally update the like count in a state management solution
    likeCount = newCount;
  }

  void addComment(int newCount) {
    // This method should ideally update the comment count in a state management solution
    commentCount = newCount;
  }

}