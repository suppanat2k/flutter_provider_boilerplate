//any data model in home here
//UserData example
 
import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    final String? username;
    final String? citizenId;
    final int? age;
    final String? email;
    final String? address;

    UserData({
        this.username,
        this.citizenId,
        this.age,
        this.email,
        this.address,
    });

    UserData copyWith({
        String? username,
        String? citizenId,
        int? age,
        String? email,
        String? address,
    }) => 
        UserData(
            username: username ?? this.username,
            citizenId: citizenId ?? this.citizenId,
            age: age ?? this.age,
            email: email ?? this.email,
            address: address ?? this.address,
        );

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        username: json["username"],
        citizenId: json["citizenId"],
        age: json["age"],
        email: json["email"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "citizenId": citizenId,
        "age": age,
        "email": email,
        "address": address,
    };
}
