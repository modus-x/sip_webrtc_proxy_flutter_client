// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;

part 'api.swagger.chopper.dart';
part 'api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Api extends ChopperService {
  static Api create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Api(client);
    }

    final newClient = ChopperClient(
        services: [_$Api()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: <Interceptor>[],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Api(newClient);
  }

  ///Get Version
  Future<chopper.Response> versionGet() {
    return _versionGet();
  }

  ///Get Version
  @Get(path: '/version')
  Future<chopper.Response> _versionGet();

  ///Health Check
  Future<chopper.Response> healthGet() {
    return _healthGet();
  }

  ///Health Check
  @Get(path: '/health')
  Future<chopper.Response> _healthGet();

  ///Create Control Room
  Future<chopper.Response<ControlRoomResponse>> roomsControlPost(
      {required ControlRoomCreate? body}) {
    generatedMapping.putIfAbsent(
        ControlRoomResponse, () => ControlRoomResponse.fromJsonFactory);

    return _roomsControlPost(body: body);
  }

  ///Create Control Room
  @Post(
    path: '/rooms/control',
    optionalBody: true,
  )
  Future<chopper.Response<ControlRoomResponse>> _roomsControlPost(
      {@Body() required ControlRoomCreate? body});

  ///Generate Token
  Future<chopper.Response<TokenResponse>> roomsControlTokenPost(
      {required TokenRequest? body}) {
    generatedMapping.putIfAbsent(
        TokenResponse, () => TokenResponse.fromJsonFactory);

    return _roomsControlTokenPost(body: body);
  }

  ///Generate Token
  @Post(
    path: '/rooms/control/token',
    optionalBody: true,
  )
  Future<chopper.Response<TokenResponse>> _roomsControlTokenPost(
      {@Body() required TokenRequest? body});

  ///Delete Control Room
  ///@param room_name
  Future<chopper.Response> roomsControlRoomNameDelete(
      {required String? roomName}) {
    return _roomsControlRoomNameDelete(roomName: roomName);
  }

  ///Delete Control Room
  ///@param room_name
  @Delete(path: '/rooms/control/{room_name}')
  Future<chopper.Response> _roomsControlRoomNameDelete(
      {@Path('room_name') required String? roomName});

  ///Update Control Room
  ///@param room_name
  Future<chopper.Response<ControlRoomResponse>> roomsControlRoomNamePatch({
    required String? roomName,
    required ControlRoomUpdate? body,
  }) {
    generatedMapping.putIfAbsent(
        ControlRoomResponse, () => ControlRoomResponse.fromJsonFactory);

    return _roomsControlRoomNamePatch(roomName: roomName, body: body);
  }

  ///Update Control Room
  ///@param room_name
  @Patch(
    path: '/rooms/control/{room_name}',
    optionalBody: true,
  )
  Future<chopper.Response<ControlRoomResponse>> _roomsControlRoomNamePatch({
    @Path('room_name') required String? roomName,
    @Body() required ControlRoomUpdate? body,
  });

  ///Create Control Room V1
  Future<chopper.Response<ControlRoomResponse>> apiV1RoomsControlPost(
      {required ControlRoomCreate? body}) {
    generatedMapping.putIfAbsent(
        ControlRoomResponse, () => ControlRoomResponse.fromJsonFactory);

    return _apiV1RoomsControlPost(body: body);
  }

  ///Create Control Room V1
  @Post(
    path: '/api/v1/rooms/control',
    optionalBody: true,
  )
  Future<chopper.Response<ControlRoomResponse>> _apiV1RoomsControlPost(
      {@Body() required ControlRoomCreate? body});

  ///Generate Token V1
  Future<chopper.Response<TokenResponse>> apiV1RoomsControlTokenPost(
      {required TokenRequest? body}) {
    generatedMapping.putIfAbsent(
        TokenResponse, () => TokenResponse.fromJsonFactory);

    return _apiV1RoomsControlTokenPost(body: body);
  }

  ///Generate Token V1
  @Post(
    path: '/api/v1/rooms/control/token',
    optionalBody: true,
  )
  Future<chopper.Response<TokenResponse>> _apiV1RoomsControlTokenPost(
      {@Body() required TokenRequest? body});

  ///Delete Control Room V1
  ///@param room_name
  Future<chopper.Response> apiV1RoomsControlRoomNameDelete(
      {required String? roomName}) {
    return _apiV1RoomsControlRoomNameDelete(roomName: roomName);
  }

  ///Delete Control Room V1
  ///@param room_name
  @Delete(path: '/api/v1/rooms/control/{room_name}')
  Future<chopper.Response> _apiV1RoomsControlRoomNameDelete(
      {@Path('room_name') required String? roomName});

  ///Update Control Room V1
  ///@param room_name
  Future<chopper.Response<ControlRoomResponse>> apiV1RoomsControlRoomNamePatch({
    required String? roomName,
    required ControlRoomUpdate? body,
  }) {
    generatedMapping.putIfAbsent(
        ControlRoomResponse, () => ControlRoomResponse.fromJsonFactory);

    return _apiV1RoomsControlRoomNamePatch(roomName: roomName, body: body);
  }

  ///Update Control Room V1
  ///@param room_name
  @Patch(
    path: '/api/v1/rooms/control/{room_name}',
    optionalBody: true,
  )
  Future<chopper.Response<ControlRoomResponse>>
      _apiV1RoomsControlRoomNamePatch({
    @Path('room_name') required String? roomName,
    @Body() required ControlRoomUpdate? body,
  });
}

@JsonSerializable(explicitToJson: true)
class ControlRoomCreate {
  const ControlRoomCreate({
    required this.username,
    required this.domain,
    this.metadata,
  });

  factory ControlRoomCreate.fromJson(Map<String, dynamic> json) =>
      _$ControlRoomCreateFromJson(json);

  static const toJsonFactory = _$ControlRoomCreateToJson;
  Map<String, dynamic> toJson() => _$ControlRoomCreateToJson(this);

  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'domain')
  final String domain;
  @JsonKey(name: 'metadata')
  final dynamic metadata;
  static const fromJsonFactory = _$ControlRoomCreateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ControlRoomCreate &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.domain, domain) ||
                const DeepCollectionEquality().equals(other.domain, domain)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(domain) ^
      const DeepCollectionEquality().hash(metadata) ^
      runtimeType.hashCode;
}

extension $ControlRoomCreateExtension on ControlRoomCreate {
  ControlRoomCreate copyWith(
      {String? username, String? domain, dynamic metadata}) {
    return ControlRoomCreate(
        username: username ?? this.username,
        domain: domain ?? this.domain,
        metadata: metadata ?? this.metadata);
  }

  ControlRoomCreate copyWithWrapped(
      {Wrapped<String>? username,
      Wrapped<String>? domain,
      Wrapped<dynamic>? metadata}) {
    return ControlRoomCreate(
        username: (username != null ? username.value : this.username),
        domain: (domain != null ? domain.value : this.domain),
        metadata: (metadata != null ? metadata.value : this.metadata));
  }
}

@JsonSerializable(explicitToJson: true)
class ControlRoomResponse {
  const ControlRoomResponse({
    required this.roomId,
    required this.name,
    this.metadata,
    required this.accessToken,
    required this.livekitUrl,
  });

  factory ControlRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$ControlRoomResponseFromJson(json);

  static const toJsonFactory = _$ControlRoomResponseToJson;
  Map<String, dynamic> toJson() => _$ControlRoomResponseToJson(this);

  @JsonKey(name: 'room_id')
  final String roomId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'metadata')
  final dynamic metadata;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'livekit_url')
  final String livekitUrl;
  static const fromJsonFactory = _$ControlRoomResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ControlRoomResponse &&
            (identical(other.roomId, roomId) ||
                const DeepCollectionEquality().equals(other.roomId, roomId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.livekitUrl, livekitUrl) ||
                const DeepCollectionEquality()
                    .equals(other.livekitUrl, livekitUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(roomId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(metadata) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(livekitUrl) ^
      runtimeType.hashCode;
}

extension $ControlRoomResponseExtension on ControlRoomResponse {
  ControlRoomResponse copyWith(
      {String? roomId,
      String? name,
      dynamic metadata,
      String? accessToken,
      String? livekitUrl}) {
    return ControlRoomResponse(
        roomId: roomId ?? this.roomId,
        name: name ?? this.name,
        metadata: metadata ?? this.metadata,
        accessToken: accessToken ?? this.accessToken,
        livekitUrl: livekitUrl ?? this.livekitUrl);
  }

  ControlRoomResponse copyWithWrapped(
      {Wrapped<String>? roomId,
      Wrapped<String>? name,
      Wrapped<dynamic>? metadata,
      Wrapped<String>? accessToken,
      Wrapped<String>? livekitUrl}) {
    return ControlRoomResponse(
        roomId: (roomId != null ? roomId.value : this.roomId),
        name: (name != null ? name.value : this.name),
        metadata: (metadata != null ? metadata.value : this.metadata),
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken),
        livekitUrl: (livekitUrl != null ? livekitUrl.value : this.livekitUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class ControlRoomUpdate {
  const ControlRoomUpdate({
    this.metadata,
  });

  factory ControlRoomUpdate.fromJson(Map<String, dynamic> json) =>
      _$ControlRoomUpdateFromJson(json);

  static const toJsonFactory = _$ControlRoomUpdateToJson;
  Map<String, dynamic> toJson() => _$ControlRoomUpdateToJson(this);

  @JsonKey(name: 'metadata')
  final dynamic metadata;
  static const fromJsonFactory = _$ControlRoomUpdateFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ControlRoomUpdate &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(metadata) ^ runtimeType.hashCode;
}

extension $ControlRoomUpdateExtension on ControlRoomUpdate {
  ControlRoomUpdate copyWith({dynamic metadata}) {
    return ControlRoomUpdate(metadata: metadata ?? this.metadata);
  }

  ControlRoomUpdate copyWithWrapped({Wrapped<dynamic>? metadata}) {
    return ControlRoomUpdate(
        metadata: (metadata != null ? metadata.value : this.metadata));
  }
}

@JsonSerializable(explicitToJson: true)
class HTTPValidationError {
  const HTTPValidationError({
    this.detail,
  });

  factory HTTPValidationError.fromJson(Map<String, dynamic> json) =>
      _$HTTPValidationErrorFromJson(json);

  static const toJsonFactory = _$HTTPValidationErrorToJson;
  Map<String, dynamic> toJson() => _$HTTPValidationErrorToJson(this);

  @JsonKey(name: 'detail', defaultValue: <ValidationError>[])
  final List<ValidationError>? detail;
  static const fromJsonFactory = _$HTTPValidationErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HTTPValidationError &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(detail) ^ runtimeType.hashCode;
}

extension $HTTPValidationErrorExtension on HTTPValidationError {
  HTTPValidationError copyWith({List<ValidationError>? detail}) {
    return HTTPValidationError(detail: detail ?? this.detail);
  }

  HTTPValidationError copyWithWrapped(
      {Wrapped<List<ValidationError>?>? detail}) {
    return HTTPValidationError(
        detail: (detail != null ? detail.value : this.detail));
  }
}

@JsonSerializable(explicitToJson: true)
class TokenRequest {
  const TokenRequest({
    required this.roomName,
    this.participantIdentity,
    this.participantName,
    this.tokenTtl,
  });

  factory TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRequestFromJson(json);

  static const toJsonFactory = _$TokenRequestToJson;
  Map<String, dynamic> toJson() => _$TokenRequestToJson(this);

  @JsonKey(name: 'room_name')
  final String roomName;
  @JsonKey(name: 'participantIdentity')
  final dynamic participantIdentity;
  @JsonKey(name: 'participantName')
  final dynamic participantName;
  @JsonKey(name: 'tokenTtl')
  final dynamic tokenTtl;
  static const fromJsonFactory = _$TokenRequestFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TokenRequest &&
            (identical(other.roomName, roomName) ||
                const DeepCollectionEquality()
                    .equals(other.roomName, roomName)) &&
            (identical(other.participantIdentity, participantIdentity) ||
                const DeepCollectionEquality()
                    .equals(other.participantIdentity, participantIdentity)) &&
            (identical(other.participantName, participantName) ||
                const DeepCollectionEquality()
                    .equals(other.participantName, participantName)) &&
            (identical(other.tokenTtl, tokenTtl) ||
                const DeepCollectionEquality()
                    .equals(other.tokenTtl, tokenTtl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(roomName) ^
      const DeepCollectionEquality().hash(participantIdentity) ^
      const DeepCollectionEquality().hash(participantName) ^
      const DeepCollectionEquality().hash(tokenTtl) ^
      runtimeType.hashCode;
}

extension $TokenRequestExtension on TokenRequest {
  TokenRequest copyWith(
      {String? roomName,
      dynamic participantIdentity,
      dynamic participantName,
      dynamic tokenTtl}) {
    return TokenRequest(
        roomName: roomName ?? this.roomName,
        participantIdentity: participantIdentity ?? this.participantIdentity,
        participantName: participantName ?? this.participantName,
        tokenTtl: tokenTtl ?? this.tokenTtl);
  }

  TokenRequest copyWithWrapped(
      {Wrapped<String>? roomName,
      Wrapped<dynamic>? participantIdentity,
      Wrapped<dynamic>? participantName,
      Wrapped<dynamic>? tokenTtl}) {
    return TokenRequest(
        roomName: (roomName != null ? roomName.value : this.roomName),
        participantIdentity: (participantIdentity != null
            ? participantIdentity.value
            : this.participantIdentity),
        participantName: (participantName != null
            ? participantName.value
            : this.participantName),
        tokenTtl: (tokenTtl != null ? tokenTtl.value : this.tokenTtl));
  }
}

@JsonSerializable(explicitToJson: true)
class TokenResponse {
  const TokenResponse({
    required this.accessToken,
    required this.livekitUrl,
    required this.roomName,
    required this.participantIdentity,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  static const toJsonFactory = _$TokenResponseToJson;
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'livekit_url')
  final String livekitUrl;
  @JsonKey(name: 'room_name')
  final String roomName;
  @JsonKey(name: 'participant_identity')
  final String participantIdentity;
  static const fromJsonFactory = _$TokenResponseFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TokenResponse &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.livekitUrl, livekitUrl) ||
                const DeepCollectionEquality()
                    .equals(other.livekitUrl, livekitUrl)) &&
            (identical(other.roomName, roomName) ||
                const DeepCollectionEquality()
                    .equals(other.roomName, roomName)) &&
            (identical(other.participantIdentity, participantIdentity) ||
                const DeepCollectionEquality()
                    .equals(other.participantIdentity, participantIdentity)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(livekitUrl) ^
      const DeepCollectionEquality().hash(roomName) ^
      const DeepCollectionEquality().hash(participantIdentity) ^
      runtimeType.hashCode;
}

extension $TokenResponseExtension on TokenResponse {
  TokenResponse copyWith(
      {String? accessToken,
      String? livekitUrl,
      String? roomName,
      String? participantIdentity}) {
    return TokenResponse(
        accessToken: accessToken ?? this.accessToken,
        livekitUrl: livekitUrl ?? this.livekitUrl,
        roomName: roomName ?? this.roomName,
        participantIdentity: participantIdentity ?? this.participantIdentity);
  }

  TokenResponse copyWithWrapped(
      {Wrapped<String>? accessToken,
      Wrapped<String>? livekitUrl,
      Wrapped<String>? roomName,
      Wrapped<String>? participantIdentity}) {
    return TokenResponse(
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken),
        livekitUrl: (livekitUrl != null ? livekitUrl.value : this.livekitUrl),
        roomName: (roomName != null ? roomName.value : this.roomName),
        participantIdentity: (participantIdentity != null
            ? participantIdentity.value
            : this.participantIdentity));
  }
}

@JsonSerializable(explicitToJson: true)
class ValidationError {
  const ValidationError({
    required this.loc,
    required this.msg,
    required this.type,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);

  static const toJsonFactory = _$ValidationErrorToJson;
  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);

  @JsonKey(name: 'loc', defaultValue: <Object>[])
  final List<Object> loc;
  @JsonKey(name: 'msg')
  final String msg;
  @JsonKey(name: 'type')
  final String type;
  static const fromJsonFactory = _$ValidationErrorFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ValidationError &&
            (identical(other.loc, loc) ||
                const DeepCollectionEquality().equals(other.loc, loc)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(loc) ^
      const DeepCollectionEquality().hash(msg) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ValidationErrorExtension on ValidationError {
  ValidationError copyWith({List<Object>? loc, String? msg, String? type}) {
    return ValidationError(
        loc: loc ?? this.loc, msg: msg ?? this.msg, type: type ?? this.type);
  }

  ValidationError copyWithWrapped(
      {Wrapped<List<Object>>? loc,
      Wrapped<String>? msg,
      Wrapped<String>? type}) {
    return ValidationError(
        loc: (loc != null ? loc.value : this.loc),
        msg: (msg != null ? msg.value : this.msg),
        type: (type != null ? type.value : this.type));
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
