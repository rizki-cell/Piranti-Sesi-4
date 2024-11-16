import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/feed_controller.dart';
import 'package:flutter_application_1/model/feed.dart';
import 'package:flutter_application_1/view/feed_card.dart';
import 'package:flutter_application_1/view/bookmark_page.dart'; // Import BookmarkPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FeedController feedController = FeedController();
  final List<Feed> bookmarkedFeeds = [];

  void toggleBookmark(Feed feed) {
    setState(() {
      if (bookmarkedFeeds.contains(feed)) {
        bookmarkedFeeds.remove(feed);
      } else {
        bookmarkedFeeds.add(feed);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Demo',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // Navigate to BookmarkPage
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookmarkPage(
                          bookmarkedFeeds: bookmarkedFeeds,
                        )),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: feedController.feeds.length,
        itemBuilder: (context, index) {
          final feed = feedController.feeds[index];
          return Feedcard(
            feed: feed,
            isBookmarked: bookmarkedFeeds.contains(feed),
            onBookmarkToggle: () => toggleBookmark(feed), // Kirim callback
          );
        },
      ),
    );
  }
}
