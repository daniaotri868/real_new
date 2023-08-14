// class GetUser {
//   GetUser({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.img,
//   });
//
//   final int? id;
//   final String? name;
//   final String? email;
//   final String? phone;
//   final String? img;
//
//   factory GetUser.fromJson(Map<String, dynamic> json){
//     return GetUser(
//       id: json["id"],
//       name: json["name"],
//       email: json["email"],
//       phone: json["phone"],
//       img: json["img"],
//     );
//   }
//
// }
class GetUser {
  GetUser({
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


  factory GetUser.fromJson(Map<String, dynamic> json){
    return GetUser(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      img: json["img"],
      role: json["role"],
    );
  }

}
