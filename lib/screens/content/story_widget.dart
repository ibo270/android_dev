import "package:android_dev/screens/home_screen/models/story_model.dart";
import "package:flutter/material.dart";

class StoryWidget extends StatelessWidget {
  final StoryModel story;
  const StoryWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          // Outer circle = colored ring around the avatar.
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.pink,
            child: CircleAvatar(
              radius: 29,
              backgroundImage: NetworkImage(story.avatarUrl),
            ),
          ),
          const SizedBox(height: 4),
          Text(story.userName, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
