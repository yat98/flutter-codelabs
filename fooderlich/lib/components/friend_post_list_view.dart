import 'package:flutter/material.dart';
import 'package:fooderlich/components/friend_post_tile.dart';
import 'package:fooderlich/models/models.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPost;

  const FriendPostListView({Key? key, required this.friendPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs 👩‍🍳',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 16),
          ListView.separated(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final post = friendPost[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemCount: friendPost.length),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
