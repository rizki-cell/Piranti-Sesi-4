class Welcome {
  String id;
  String slug;
  AlternativeSlugs alternativeSlugs;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  List<dynamic> breadcrumbs;
  Urls urls;
  WelcomeLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  TopicSubmissions topicSubmissions;
  AssetType assetType;
  User user;

  Welcome({
    required this.id,
    required this.slug,
    required this.alternativeSlugs,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    this.sponsorship,
    required this.topicSubmissions,
    required this.assetType,
    required this.user,
  });

  // fromMap method
  factory Welcome.fromMap(Map<String, dynamic> map) {
    return Welcome(
      id: map['id'],
      slug: map['slug'],
      alternativeSlugs: AlternativeSlugs.fromMap(map['alternative_slugs']),
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
      promotedAt: map['promoted_at'] != null
          ? DateTime.parse(map['promoted_at'])
          : null,
      width: map['width'],
      height: map['height'],
      color: map['color'],
      blurHash: map['blur_hash'],
      description: map['description'],
      altDescription: map['alt_description'],
      breadcrumbs: List<dynamic>.from(map['breadcrumbs']),
      urls: Urls.fromMap(map['urls']),
      links: WelcomeLinks.fromMap(map['links']),
      likes: map['likes'],
      likedByUser: map['liked_by_user'],
      currentUserCollections: List<dynamic>.from(map['current_user_collections']),
      sponsorship: map['sponsorship'],
      topicSubmissions: TopicSubmissions.fromMap(map['topic_submissions']),
      assetType: AssetType.values.firstWhere(
        (e) => e.toString() == 'AssetType.${map['asset_type']}',
        orElse: () => AssetType.PHOTO, // default to PHOTO
      ),
      user: User.fromMap(map['user']),
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'slug': slug,
      'alternative_slugs': alternativeSlugs.toMap(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'promoted_at': promotedAt?.toIso8601String(),
      'width': width,
      'height': height,
      'color': color,
      'blur_hash': blurHash,
      'description': description,
      'alt_description': altDescription,
      'breadcrumbs': breadcrumbs,
      'urls': urls.toMap(),
      'links': links.toMap(),
      'likes': likes,
      'liked_by_user': likedByUser,
      'current_user_collections': currentUserCollections,
      'sponsorship': sponsorship,
      'topic_submissions': topicSubmissions.toMap(),
      'asset_type': assetType.toString().split('.').last,
      'user': user.toMap(),
    };
  }
}

class TopicSubmissions {
  The3DRenders? health;
  The3DRenders? the3DRenders;
  The3DRenders? nature;
  The3DRenders? wallpapers;
  The3DRenders? experimental;
  The3DRenders? sports;

  TopicSubmissions({
    this.health,
    this.the3DRenders,
    this.nature,
    this.wallpapers,
    this.experimental,
    this.sports,
  });

  factory TopicSubmissions.fromMap(Map<String, dynamic> map) {
    return TopicSubmissions(
      health: map['health'] != null
          ? The3DRenders.fromMap(map['health'])
          : null,
      the3DRenders: map['the_3d_renders'] != null
          ? The3DRenders.fromMap(map['the_3d_renders'])
          : null,
      nature: map['nature'] != null ? The3DRenders.fromMap(map['nature']) : null,
      wallpapers: map['wallpapers'] != null
          ? The3DRenders.fromMap(map['wallpapers'])
          : null,
      experimental: map['experimental'] != null
          ? The3DRenders.fromMap(map['experimental'])
          : null,
      sports: map['sports'] != null ? The3DRenders.fromMap(map['sports']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'health': health?.toMap(),
      'the_3d_renders': the3DRenders?.toMap(),
      'nature': nature?.toMap(),
      'wallpapers': wallpapers?.toMap(),
      'experimental': experimental?.toMap(),
      'sports': sports?.toMap(),
    };
  }
}


class AlternativeSlugs {
  String en;
  String es;
  String ja;
  String fr;
  String it;
  String ko;
  String de;
  String pt;

  AlternativeSlugs({
    required this.en,
    required this.es,
    required this.ja,
    required this.fr,
    required this.it,
    required this.ko,
    required this.de,
    required this.pt,
  });

  factory AlternativeSlugs.fromMap(Map<String, dynamic> map) {
    return AlternativeSlugs(
      en: map['en'],
      es: map['es'],
      ja: map['ja'],
      fr: map['fr'],
      it: map['it'],
      ko: map['ko'],
      de: map['de'],
      pt: map['pt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
      'es': es,
      'ja': ja,
      'fr': fr,
      'it': it,
      'ko': ko,
      'de': de,
      'pt': pt,
    };
  }
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromMap(Map<String, dynamic> map) {
    return Urls(
      raw: map['raw'],
      full: map['full'],
      regular: map['regular'],
      small: map['small'],
      thumb: map['thumb'],
      smallS3: map['small_s3'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'raw': raw,
      'full': full,
      'regular': regular,
      'small': small,
      'thumb': thumb,
      'small_s3': smallS3,
    };
  }
}

class WelcomeLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  WelcomeLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory WelcomeLinks.fromMap(Map<String, dynamic> map) {
    return WelcomeLinks(
      self: map['self'],
      html: map['html'],
      download: map['download'],
      downloadLocation: map['download_location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'self': self,
      'html': html,
      'download': download,
      'download_location': downloadLocation,
    };
  }
}

class The3DRenders {
  String status;
  DateTime? approvedOn;

  The3DRenders({
    required this.status,
    this.approvedOn,
  });

  factory The3DRenders.fromMap(Map<String, dynamic> map) {
    return The3DRenders(
      status: map['status'],
      approvedOn: map['approved_on'] != null
          ? DateTime.parse(map['approved_on'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'approved_on': approvedOn?.toIso8601String(),
    };
  }
}

class User {
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks links;
  ProfileImage profileImage;
  String? instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  int totalPromotedPhotos;
  int totalIllustrations;
  int totalPromotedIllustrations;
  bool acceptedTos;
  bool forHire;
  Social social;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    required this.links,
    required this.profileImage,
    this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalPromotedPhotos,
    required this.totalIllustrations,
    required this.totalPromotedIllustrations,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  // fromMap method
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      updatedAt: DateTime.parse(map['updated_at']),
      username: map['username'],
      name: map['name'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      twitterUsername: map['twitter_username'],
      portfolioUrl: map['portfolio_url'],
      bio: map['bio'],
      location: map['location'],
      links: UserLinks.fromMap(map['links']),
      profileImage: ProfileImage.fromMap(map['profile_image']),
      instagramUsername: map['instagram_username'],
      totalCollections: map['total_collections'],
      totalLikes: map['total_likes'],
      totalPhotos: map['total_photos'],
      totalPromotedPhotos: map['total_promoted_photos'],
      totalIllustrations: map['total_illustrations'],
      totalPromotedIllustrations: map['total_promoted_illustrations'],
      acceptedTos: map['accepted_tos'],
      forHire: map['for_hire'],
      social: Social.fromMap(map['social']),
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'updated_at': updatedAt.toIso8601String(),
      'username': username,
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'twitter_username': twitterUsername,
      'portfolio_url': portfolioUrl,
      'bio': bio,
      'location': location,
      'links': links.toMap(),
      'profile_image': profileImage.toMap(),
      'instagram_username': instagramUsername,
      'total_collections': totalCollections,
      'total_likes': totalLikes,
      'total_photos': totalPhotos,
      'total_promoted_photos': totalPromotedPhotos,
      'total_illustrations': totalIllustrations,
      'total_promoted_illustrations': totalPromotedIllustrations,
      'accepted_tos': acceptedTos,
      'for_hire': forHire,
      'social': social.toMap(),
    };
  }
}

class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  // fromMap method
  factory UserLinks.fromMap(Map<String, dynamic> map) {
    return UserLinks(
      self: map['self'],
      html: map['html'],
      photos: map['photos'],
      likes: map['likes'],
      portfolio: map['portfolio'],
      following: map['following'],
      followers: map['followers'],
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'self': self,
      'html': html,
      'photos': photos,
      'likes': likes,
      'portfolio': portfolio,
      'following': following,
      'followers': followers,
    };
  }
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  // fromMap method
  factory ProfileImage.fromMap(Map<String, dynamic> map) {
    return ProfileImage(
      small: map['small'],
      medium: map['medium'],
      large: map['large'],
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'small': small,
      'medium': medium,
      'large': large,
    };
  }
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  // fromMap method
  factory Social.fromMap(Map<String, dynamic> map) {
    return Social(
      instagramUsername: map['instagram_username'],
      portfolioUrl: map['portfolio_url'],
      twitterUsername: map['twitter_username'],
      paypalEmail: map['paypal_email'],
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'instagram_username': instagramUsername,
      'portfolio_url': portfolioUrl,
      'twitter_username': twitterUsername,
      'paypal_email': paypalEmail,
    };
  }
}

enum AssetType {
    PHOTO
}
