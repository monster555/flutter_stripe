import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'card_field_input.g.dart';
part 'card_field_input.freezed.dart';

@freezed
class CardDecoration with _$CardDecoration {
  @JsonSerializable(explicitToJson: true)
  factory CardDecoration({
    @JsonKey(toJson: ColorKey.toJson, fromJson: ColorKey.fromJson)
        Color? backgroundColor,
    @JsonKey(toJson: ColorKey.toJson, fromJson: ColorKey.fromJson)
        Color? textColor,
    @JsonKey(toJson: ColorKey.toJson, fromJson: ColorKey.fromJson)
        Color? borderColor,
    double? borderWidth,
    double? borderRadius,
    @JsonKey(toJson: ColorKey.toJson, fromJson: ColorKey.fromJson)
        Color? textErrorColor,
  }) = _CardDecoration;

  factory CardDecoration.fromJson(Map<String, dynamic> json) =>
      _$CardDecorationFromJson(json);
}

class ColorKey {
  const ColorKey();

  static int? toJson(Color? value) {
    return value?.value;
  }

  static Color? fromJson(value) {
    if (value is int) {
      return Color(value);
    }
    return null;
  }
}

@freezed
class CardFieldInputDetails with _$CardFieldInputDetails {
  const factory CardFieldInputDetails() = _CardFieldInputDetailsDefault;

  @JsonSerializable(explicitToJson: true)
  const factory CardFieldInputDetails.card({
    required String last4,
    required int expiryMonth,
    required int expiryYear,
    required CardBrand brand,
    required bool complete,
    required String? postalCode,
  }) = _CardFieldInputDetailsCard;

  const factory CardFieldInputDetails.cardFromToken({
    required String token,
  }) = _CardFieldInputDetailsWithToken;

  factory CardFieldInputDetails.fromJson(Map<String, dynamic> json) =>
      _$CardFieldInputDetailsFromJson(json);
}

@freezed
class CardFieldFocusName with _$CardFieldFocusName {
  @JsonSerializable(explicitToJson: true)
  factory CardFieldFocusName({CardFieldName? focusedField}) =
      _CardFieldFocusName;

  factory CardFieldFocusName.fromJson(Map<String, dynamic> json) =>
      _$CardFieldFocusNameFromJson(json);
}

enum CardFieldName {
  cardNumber,
  cvc,
  expiryDate,
  postalCode,
}

enum CardBrand {
  american,
  dinersClub,
  discover,
  jCB,
  masterCard,
  unionPay,
  visa,
  unknown
}
