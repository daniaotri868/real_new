// // To parse this JSON data, do
// //
// //     final houses = housesFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Houses> housesFromJson(String str) => List<Houses>.from(json.decode(str).map((x) => Houses.fromJson(x)));
//
// String housesToJson(List<Houses> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Houses {
//   int id;
//   int postId;
//   int operationId;
//   int userId;
//   int price;
//   dynamic duration;
//   int isAccepted;
//   User user;
//   Post post;
//   Operation operation;
//
//   Houses({
//     required this.id,
//     required this.postId,
//     required this.operationId,
//     required this.userId,
//     required this.price,
//     this.duration,
//     required this.isAccepted,
//     required this.user,
//     required this.post,
//     required this.operation,
//   });
//
//   factory Houses.fromJson(Map<String, dynamic> json) => Houses(
//     id: json["id"],
//     postId: json["post_id"],
//     operationId: json["operation_id"],
//     userId: json["user_id"],
//     price: json["price"],
//     duration: json["duration"],
//     isAccepted: json["is_accepted"],
//     user: User.fromJson(json["user"]),
//     post: Post.fromJson(json["post"]),
//     operation: Operation.fromJson(json["operation"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "post_id": postId,
//     "operation_id": operationId,
//     "user_id": userId,
//     "price": price,
//     "duration": duration,
//     "is_accepted": isAccepted,
//     "user": user.toJson(),
//     "post": post.toJson(),
//     "operation": operation.toJson(),
//   };
// }
//
// class Operation {
//   int id;
//   OperationName name;
//   Description description;
//
//   Operation({
//     required this.id,
//     required this.name,
//     required this.description,
//   });
//
//   factory Operation.fromJson(Map<String, dynamic> json) => Operation(
//     id: json["id"],
//     name: operationNameValues.map[json["name"]]!,
//     description: descriptionValues.map[json["description"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": operationNameValues.reverse[name],
//     "description": descriptionValues.reverse[description],
//   };
// }
//
// enum Description { NOTHING }
//
// final descriptionValues = EnumValues({
//   "nothing": Description.NOTHING
// });
//
// enum OperationName { SELL, BUY }
//
// final operationNameValues = EnumValues({
//   "Buy": OperationName.BUY,
//   "Sell": OperationName.SELL
// });
//
// class Post {
//   int id;
//   DateTime postDate;
//   Postsable postsable;
//
//   Post({
//     required this.id,
//     required this.postDate,
//     required this.postsable,
//   });
//
//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//     id: json["id"],
//     postDate: DateTime.parse(json["post_date"]),
//     postsable: Postsable.fromJson(json["postsable"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "post_date": postDate.toIso8601String(),
//     "postsable": postsable.toJson(),
//   };
// }
//
// class Postsable {
//   int id;
//   String? location;
//   String? floor;
//   String? space;
//   String? direction;
//   String? description;
//   int? roomNumber;
//   List<Image> images;
//   String? name;
//   String? model;
//   String? color;
//   int? isNew;
//   String? year;
//
//   Postsable({
//     required this.id,
//     this.location,
//     this.floor,
//     this.space,
//     this.direction,
//     this.description,
//     this.roomNumber,
//     required this.images,
//     this.name,
//     this.model,
//     this.color,
//     this.isNew,
//     this.year,
//   });
//
//   factory Postsable.fromJson(Map<String, dynamic> json) => Postsable(
//     id: json["id"],
//     location: json["location"],
//     floor: json["floor"],
//     space: json["space"],
//     direction: json["direction"],
//     description: json["description"],
//     roomNumber: json["room_number"],
//     images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//     name: json["name"],
//     model: json["model"],
//     color: json["color"],
//     isNew: json["is_new"],
//     year: json["year"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "location": location,
//     "floor": floor,
//     "space": space,
//     "direction": direction,
//     "description": description,
//     "room_number": roomNumber,
//     "images": List<dynamic>.from(images.map((x) => x.toJson())),
//     "name": name,
//     "model": model,
//     "color": color,
//     "is_new": isNew,
//     "year": year,
//   };
// }
//
// class Image {
//   int id;
//   String img;
//   dynamic description;
//
//   Image({
//     required this.id,
//     required this.img,
//     this.description,
//   });
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     id: json["id"],
//     img: json["img"],
//     description: json["description"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "img": img,
//     "description": description,
//   };
// }
//
// class User {
//   int id;
//   UserName name;
//   Email email;
//   String phone;
//   String img;
//
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.img,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     name: userNameValues.map[json["name"]]!,
//     email: emailValues.map[json["email"]]!,
//     phone: json["phone"],
//     img: json["img"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": userNameValues.reverse[name],
//     "email": emailValues.reverse[email],
//     "phone": phone,
//     "img": img,
//   };
// }
//
// enum Email { ADMIN_TEST_COM, HH213123_WQ_TEST_COM, DAVID_TEST_COM }
//
// final emailValues = EnumValues({
//   "admin@test.com": Email.ADMIN_TEST_COM,
//   "David@test.com": Email.DAVID_TEST_COM,
//   "hh213123wq@test.com": Email.HH213123_WQ_TEST_COM
// });
//
// enum UserName { ADMIN, H, DAVID }
//
// final userNameValues = EnumValues({
//   "Admin": UserName.ADMIN,
//   "David": UserName.DAVID,
//   "H": UserName.H
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
