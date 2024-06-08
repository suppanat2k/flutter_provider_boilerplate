import 'dart:convert';

PublicSignatureModel publicSignatureModelFromJson(String str) =>
    PublicSignatureModel.fromJson(json.decode(str));

String publicSignatureModelToJson(PublicSignatureModel data) =>
    json.encode(data.toJson());

class PublicSignatureModel {
  String? publicKey;
  String? signature;
  String? nonce;

  PublicSignatureModel({
    this.publicKey,
    this.signature,
    this.nonce,
  });

  PublicSignatureModel copyWith({
    String? publicKey,
    String? signature,
    String? nonce,
  }) =>
      PublicSignatureModel(
        publicKey: publicKey ?? this.publicKey,
        signature: signature ?? this.signature,
        nonce: nonce ?? this.nonce,
      );

  factory PublicSignatureModel.fromJson(Map<String, dynamic> json) =>
      PublicSignatureModel(
        publicKey: json["public_key"],
        signature: json["signature"],
        nonce: json["nonce"],
      );

  Map<String, dynamic> toJson() => {
        "public_key": publicKey,
        "signature": signature,
        "nonce": nonce,
      };
}
