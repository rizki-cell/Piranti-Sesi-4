import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/feed.dart';

class BookmarkPage extends StatelessWidget {
  final List<Feed> bookmarkedFeeds;

  const BookmarkPage({super.key, required this.bookmarkedFeeds});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked Feeds'),
      ),
      body: bookmarkedFeeds.isEmpty
          ? Center(
              child: Text(
                'No bookmarks yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedFeeds.length,
              itemBuilder: (context, index) {
                final feed = bookmarkedFeeds[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(feed.user.avatar),
                        ),
                        title: Text(
                          feed.user.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(feed.user.place),
                        trailing: Icon(Icons.more_vert),
                      ),
                      Image.network(
                        feed.content.image,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.favorite_border, color: Colors.black),
                            SizedBox(width: 16),
                            Icon(Icons.chat_bubble_outline),
                            SizedBox(width: 16),
                            Icon(Icons.send),
                            Spacer(),
                            Icon(Icons.bookmark, color: Colors.black),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          '${feed.content.likes} likes',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: feed.content.description,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
