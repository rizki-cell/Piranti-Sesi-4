import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/feed.dart';
import 'package:flutter_application_1/model/feed_repository.dart';

class FeedController extends ChangeNotifier {
  List<Feed> feeds = FeedRepository().fetch();
  int get Length => feeds.length;

  Feed feed(int index) {
    return feeds[index];
  }

  refresh() {
    feeds = FeedRepository().fetch();
    notifyListeners();
  }
}
