import 'package:flutter_application_1/model/feed.dart';

class FeedRepository {
  List<Feed> fetch() {
    return [
      Feed(
          id: 1,
          user: User(
            name: 'EN',
            avatar:
                'https://images.pexels.com/photos/30359820/pexels-photo-30359820/free-photo-of-intricate-moorish-archways-in-alhambra-palace-spain.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
            place: 'Arab,Jazirah',
          ),
          content: Content(
              image:
                  'https://images.pexels.com/photos/8565618/pexels-photo-8565618.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
              isLike: false,
              bookmark: false,
              likes: '21.310 likes',
              descriptions: 'cute girl')),
      Feed(
          id: 2,
          user: User(
            name: 'Ultrathin',
            avatar: '',
            place: 'Bandung, Indonesia',
          ),
          content: Content(
              image: '',
              isLike: false,
              bookmark: false,
              likes: '30.100 likes',
              descriptions: 'love love couple')),
      Feed(
          id: 3,
          user: User(
            name: 'dogddag',
            avatar: '',
            place: 'Garut, Indonesia',
          ),
          content: Content(
              image:
                  'https://images.pexels.com/photos/18297044/pexels-photo-18297044/free-photo-of-labrador-retriever-puppy.jpeg?auto=compress&cs=tinysrgb&w=600',
              isLike: false,
              bookmark: false,
              likes: '19.837 likes',
              descriptions: 'day 123243523')),
    ];
  }
}
