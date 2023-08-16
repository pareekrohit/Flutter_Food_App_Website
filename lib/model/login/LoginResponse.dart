import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool? status;
  Data? data;

  LoginResponse({
    this.status,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  User? user;

  Data({
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  String? name;
  String? email;
  String? role;
  String? mobileNumber;
  String? address;
  String? token;
  dynamic dob;

  User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.mobileNumber,
    this.address,
    this.token,
    this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        mobileNumber: json["mobileNumber"],
        address: json["address"],
        token: json["token"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "role": role,
        "mobileNumber": mobileNumber,
        "address": address,
        "token": token,
        "dob": dob,
      };
}
