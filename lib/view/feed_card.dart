import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/feed.dart';

class Feedcard extends StatefulWidget {
  final Feed feed;

  const Feedcard({super.key, required this.feed});

  @override
  _FeedcardState createState() => _FeedcardState();
}

class _FeedcardState extends State<Feedcard> {
  bool isLiked = false;
  bool isBookmarked = false; // Added to track the bookmark state

  // Toggle the like button state
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  // Toggle the bookmark state
  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.feed.user.avatar),
            ),
            title: Text(widget.feed.user.name,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(widget.feed.user.place),
            trailing: Icon(Icons.more_vert),
          ),
          Image.network(
            widget.feed.content.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.8,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: toggleLike,
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.black,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.chat_bubble_outline),
                SizedBox(width: 16),
                Icon(Icons.send),
                Spacer(),
                GestureDetector(
                  onTap: toggleBookmark, // Bookmark toggle function
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Colors.black : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '${isLiked ? 1824 : 1823} likes', // Update the like count based on state
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: widget.feed.content.description,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ''),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Wrap(
              spacing: 8.0,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
