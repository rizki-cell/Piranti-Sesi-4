// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/feed_controller.dart';
import 'package:flutter_application_1/view/feed_card.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => FeedBookmarkPage();
}

class FeedBookmarkPage extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    // var feedController = FeedController();
    final controller = context.watch<FeedController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmark Page',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          controller.refresh();
        },
        child: ListView.builder(
            itemCount: controller.bookmarkedFeeds.length, // Jumlah total item
            itemBuilder: (context, index) {
              return FeedCard(feed: controller.bookmarkedFeeds[index]);
            }),
      ),
    );
  }
}
