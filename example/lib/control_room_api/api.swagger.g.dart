// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ControlRoomCreate _$ControlRoomCreateFromJson(Map<String, dynamic> json) =>
    ControlRoomCreate(
      username: json['username'] as String,
      domain: json['domain'] as String,
      metadata: json['metadata'],
    );

Map<String, dynamic> _$ControlRoomCreateToJson(ControlRoomCreate instance) =>
    <String, dynamic>{
      'username': instance.username,
      'domain': instance.domain,
      'metadata': instance.metadata,
    };

ControlRoomResponse _$ControlRoomResponseFromJson(Map<String, dynamic> json) =>
    ControlRoomResponse(
      roomId: json['room_id'] as String,
      name: json['name'] as String,
      metadata: json['metadata'],
      accessToken: json['access_token'] as String,
      livekitUrl: json['livekit_url'] as String,
    );

Map<String, dynamic> _$ControlRoomResponseToJson(
        ControlRoomResponse instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'name': instance.name,
      'metadata': instance.metadata,
      'access_token': instance.accessToken,
      'livekit_url': instance.livekitUrl,
    };

ControlRoomUpdate _$ControlRoomUpdateFromJson(Map<String, dynamic> json) =>
    ControlRoomUpdate(
      metadata: json['metadata'],
    );

Map<String, dynamic> _$ControlRoomUpdateToJson(ControlRoomUpdate instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
    };

HTTPValidationError _$HTTPValidationErrorFromJson(Map<String, dynamic> json) =>
    HTTPValidationError(
      detail: (json['detail'] as List<dynamic>?)
              ?.map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HTTPValidationErrorToJson(
        HTTPValidationError instance) =>
    <String, dynamic>{
      'detail': instance.detail?.map((e) => e.toJson()).toList(),
    };

TokenRequest _$TokenRequestFromJson(Map<String, dynamic> json) => TokenRequest(
      roomName: json['room_name'] as String,
      participantIdentity: json['participantIdentity'],
      participantName: json['participantName'],
      tokenTtl: json['tokenTtl'],
    );

Map<String, dynamic> _$TokenRequestToJson(TokenRequest instance) =>
    <String, dynamic>{
      'room_name': instance.roomName,
      'participantIdentity': instance.participantIdentity,
      'participantName': instance.participantName,
      'tokenTtl': instance.tokenTtl,
    };

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      accessToken: json['access_token'] as String,
      livekitUrl: json['livekit_url'] as String,
      roomName: json['room_name'] as String,
      participantIdentity: json['participant_identity'] as String,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'livekit_url': instance.livekitUrl,
      'room_name': instance.roomName,
      'participant_identity': instance.participantIdentity,
    };

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) =>
    ValidationError(
      loc: (json['loc'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
          [],
      msg: json['msg'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ValidationErrorToJson(ValidationError instance) =>
    <String, dynamic>{
      'loc': instance.loc,
      'msg': instance.msg,
      'type': instance.type,
    };
