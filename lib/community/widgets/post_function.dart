import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  int likes = 1200;
  bool liked = false;

  void handleLikeToggle() {
    setState(() {
      if (liked) {
        likes--;
        liked = false;
      } else {
        likes++;
        liked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PostFunction(
      likeCount: likes,
      isLiked: liked,
      likedIcon: Icons.thumb_up_alt,
      unlikedIcon: Icons.thumb_up_off_alt_outlined,
      onLikeToggle: handleLikeToggle,
    );
  }
}

// Reusable Post Function Widget
class PostFunction extends StatelessWidget {
  final int likeCount;
  final bool isLiked;
  final IconData likedIcon;
  final IconData unlikedIcon;
  final VoidCallback? onLikeToggle;

  const PostFunction({
    super.key,
    required this.likeCount,
    required this.isLiked,
    this.likedIcon = Icons.thumb_up,
    this.unlikedIcon = Icons.thumb_up_off_alt_outlined,
    this.onLikeToggle,
  });

  // Format large numbers dynamically
  String formatLikes(int count) {
    if (count >= 1000000) {
      return "${(count / 1000000).toStringAsFixed(1)}M+";
    } else if (count >= 1000) {
      return "${(count / 1000).toStringAsFixed(1)}k+";
    } else if (count > 0) {
      return "$count+";
    } else {
      return count.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            isLiked ? likedIcon : unlikedIcon,
            color: isLiked ? Colors.blue : Colors.grey,
          ),
          onPressed: onLikeToggle,
        ),
        const Gap(5),
        Text(
          formatLikes(likeCount),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0x998492AB),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.43,
          ),
        ),
      ],
    );
  }
}
