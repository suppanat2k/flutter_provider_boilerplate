import 'package:json_annotation/json_annotation.dart';
part 'local_base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, fieldRename: FieldRename.snake, nullable: true)
class BaseResponse<T> {
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'data')
  final T? data;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'totalItems')
  final int? totalItems;
BaseResponse(this.success, this.data, this.message, this.totalItems);
factory BaseResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$BaseResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}