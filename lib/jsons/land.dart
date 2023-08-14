class Lands {
  Lands({
    required this.id,
    required this.postId,
    required this.operationId,
    required this.userId,
    required this.price,
    required this.duration,
    required this.description,
    required this.isAccepted,
    required this.user,
    required this.post,
    required this.operation,
  });

  final int? id;
  final int? postId;
  final int? operationId;
  final int? userId;
  final int? price;
  final dynamic duration;
  final dynamic description;
  final int? isAccepted;
  final User? user;
  final Post? post;
  final Operation? operation;

  factory Lands.fromJson(Map<String, dynamic> json){
    return Lands(
      id: json["id"],
      postId: json["post_id"],
      operationId: json["operation_id"],
      userId: json["user_id"],
      price: json["price"],
      duration: json["duration"],
      description: json["description"],
      isAccepted: json["is_accepted"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      post: json["post"] == null ? null : Post.fromJson(json["post"]),
      operation: json["operation"] == null ? null : Operation.fromJson(json["operation"]),
    );
  }

}

class Operation {
  Operation({
    required this.id,
    required this.name,
    required this.description,
  });

  final int? id;
  final String? name;
  final String? description;

  factory Operation.fromJson(Map<String, dynamic> json){
    return Operation(
      id: json["id"],
      name: json["name"],
      description: json["description"],
    );
  }

}

class Post {
  Post({
    required this.id,
    required this.postDate,
    required this.postsable,
  });

  final int? id;
  final DateTime? postDate;
  final Postsable? postsable;

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json["id"],
      postDate: DateTime.tryParse(json["post_date"] ?? ""),
      postsable: json["postsable"] == null ? null : Postsable.fromJson(json["postsable"]),
    );
  }

}

class Postsable {
  Postsable({
    required this.id,
    required this.space,
    required this.location,
    required this.description,
    required this.images,
  });

  final int? id;
  final String? space;
  final String? location;
  final String? description;
  final List<dynamic> images;

  factory Postsable.fromJson(Map<String, dynamic> json){
    return Postsable(
      id: json["id"],
      space: json["space"],
      location: json["location"],
      description: json["description"],
      images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
    );
  }

}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.img,
    required this.role,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? img;
  final String? role;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      img: json["img"],
      role: json["role"],
    );
  }

}
