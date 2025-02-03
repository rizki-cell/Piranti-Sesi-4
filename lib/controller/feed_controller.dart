import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/feed.dart';
import 'package:flutter_application_1/model/feed_repository.dart';

class FeedController extends ChangeNotifier {
  List<Feed> feeds = FeedRepository().fetch();
  List<Feed> bookmarkFeeds = [];
  int get length => feeds.length;

  Feed feed(int index) {
    return feeds[index];
  }

  List<Feed> get bookmarkedFeeds =>
      feeds.where((feed) => feed.content.bookmark).toList();

  like(Feed feed) {
    feeds
        .firstWhere(
          (element) => element.id == feed.id,
        )
        .content
        .isLike = !feed.content.isLike;
    notifyListeners();
  }

  // bookmark(Feed feed){
  //   feeds.firstWhere(
  //     (element) => element.id == feed.id,
  //     ).content.bookmark = !feed.content.bookmark;
  //     notifyListeners();
  // }
  bookmark(Feed feed) {
    if (isBookmark(feed)) {
      bookmarkFeeds.remove(feed);
    } else {
      bookmarkFeeds.add(feed);
    }
    notifyListeners();
  }

  bool isBookmark(Feed feed) {
    return bookmarkFeeds.map((e) => e.id).contains(feed.id);
  }

  bool isBookmarkEmpty() {
    return bookmarkFeeds.isEmpty;
  }

  refresh() {
    feeds = FeedRepository().fetch();
    notifyListeners();
  }
}
