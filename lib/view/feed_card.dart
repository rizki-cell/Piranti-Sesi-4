import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/feed.dart';

class Feedcard extends StatefulWidget {
  final Feed feed;
  final bool isBookmarked; // Tambahkan ini untuk kontrol bookmark dari luar
  final VoidCallback onBookmarkToggle;

  const Feedcard({
    super.key,
    required this.feed,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  _FeedcardState createState() => _FeedcardState();
}

class _FeedcardState extends State<Feedcard> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
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
            title: Text(
              widget.feed.user.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                  onTap: widget.onBookmarkToggle, // Panggil callback
                  child: Icon(
                    widget.isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '${isLiked ? 1824 : 1823} likes',
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
