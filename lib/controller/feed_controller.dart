import 'package:flutter_application_1/model/feed.dart';

class FeedController {
  List<Feed> feeds = [
    Feed(
        user: User(
            name: 'En',
            avatar:
                'https://images.pexels.com/photos/29083766/pexels-photo-29083766/free-photo-of-colorful-dia-de-muertos-celebration-in-mexico.jpeg?auto=compress&cs=tinysrgb&w=600',
            place: 'Garut'),
        content: Content(
            image:
                'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
            likes: '2112 likes',
            description: 'The pwetty')),
    Feed(
        user: User(
            name: 'mikael',
            avatar:
                'https://images.pexels.com/photos/16867014/pexels-photo-16867014/free-photo-of-women-dancing-with-baskets-of-flowers.jpeg?auto=compress&cs=tinysrgb&w=600',
            place: 'Bandung'),
        content: Content(
            image:
                'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=600',
            likes: '666 likes',
            description: 'Timnas U19')),
    Feed(
        user: User(
            name: 'Carry',
            avatar:
                'https://images.pexels.com/photos/3311574/pexels-photo-3311574.jpeg?auto=compress&cs=tinysrgb&w=600',
            place: 'Garut'),
        content: Content(
            image:
                'https://images.pexels.com/photos/248747/pexels-photo-248747.jpeg?auto=compress&cs=tinysrgb&w=600',
            likes: '666 likes',
            description: 'no limitzs')),
  ];
}
