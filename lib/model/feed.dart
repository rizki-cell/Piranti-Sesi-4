class Feed {
  final int id;
  //User
  final User user;
  //Content
  final Content content;

  Feed({required this.id, required this.user, required this.content});
}

class Content {
  final String image;
  bool isLike;
  bool bookmark;
  final String likes;
  final String descriptions;

  Content(
      {required this.image,
      required this.isLike,
      required this.bookmark,
      required this.likes,
      required this.descriptions});
}

class User {
  final String name;
  final String avatar;
  final String place;

  User({required this.name, required this.avatar, required this.place});
}



//catatan

// class Feed {
//    int  ?id;
//   //User
//    User ? user;
//   //Content
//   // final Content content;

//   Feed({required this.id, required this.user, 
//   // required this.content
//   });

//   Feed.fromJson(Map<String,dynamic> json) {
//     id = json['id'];
//     user = json['user']  !=null? User.fromJson(json['user']):
//     null;
  
//   }

//   //factory pattern
//   Map<String,dynamic> toJson(){
//     final Map<String,dynamic> data = <String, dynamic>{};
//     data ['id'] = id;
//    if(user! //belum selesai)
//     return data;
//   }
// }

// class Content {
//   final String image;
//   bool isLike;
//   bool bookmark;
//   final String likes;
//   final String descriptions;

//   Content(
//       {required this.image,
//       required this.isLike,
//       required this.bookmark,
//       required this.likes,
//       required this.descriptions});
// }

// class User {
//   String ? name;
//   String ? avatar;
//   String ? place;

//   User({required this.name, required this.avatar, required this.place});

//   User.fromJson(Map<String,dynamic> json) {
//     name = json['name'];
//     avatar = json['avatar'];
//     place = json['place'];
//   }

//   //factory pattern
//   Map<String,dynamic> toJson(){
//     final Map<String,dynamic> data = <String, dynamic>{};
//     data ['name'] = name;
//     data ['avatar'] = avatar;
//     data ['place'] = place;
//     return data;
//   }
// }

