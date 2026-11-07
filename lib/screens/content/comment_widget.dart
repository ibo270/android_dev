import "package:android_dev/screens/home_screen/models/comment_model.dart";
import "package:flutter/material.dart";

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(comment.userName[0])),
      title: Text(comment.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(comment.commentText),
    );
  }
}
