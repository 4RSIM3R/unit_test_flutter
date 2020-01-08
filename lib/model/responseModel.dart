import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

class ResponseModel {
    int userId;
    int id;
    String title;
    String body;

    ResponseModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

}
