// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Api extends Api {
  _$Api([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Api;

  @override
  Future<Response<dynamic>> _versionGet() {
    final Uri $url = Uri.parse('/version');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _healthGet() {
    final Uri $url = Uri.parse('/health');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ControlRoomResponse>> _roomsControlPost(
      {required ControlRoomCreate? body}) {
    final Uri $url = Uri.parse('/rooms/control');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ControlRoomResponse, ControlRoomResponse>($request);
  }

  @override
  Future<Response<TokenResponse>> _roomsControlTokenPost(
      {required TokenRequest? body}) {
    final Uri $url = Uri.parse('/rooms/control/token');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TokenResponse, TokenResponse>($request);
  }

  @override
  Future<Response<dynamic>> _roomsControlRoomNameDelete(
      {required String? roomName}) {
    final Uri $url = Uri.parse('/rooms/control/${roomName}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ControlRoomResponse>> _roomsControlRoomNamePatch({
    required String? roomName,
    required ControlRoomUpdate? body,
  }) {
    final Uri $url = Uri.parse('/rooms/control/${roomName}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ControlRoomResponse, ControlRoomResponse>($request);
  }

  @override
  Future<Response<ControlRoomResponse>> _apiV1RoomsControlPost(
      {required ControlRoomCreate? body}) {
    final Uri $url = Uri.parse('/api/v1/rooms/control');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ControlRoomResponse, ControlRoomResponse>($request);
  }

  @override
  Future<Response<TokenResponse>> _apiV1RoomsControlTokenPost(
      {required TokenRequest? body}) {
    final Uri $url = Uri.parse('/api/v1/rooms/control/token');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TokenResponse, TokenResponse>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1RoomsControlRoomNameDelete(
      {required String? roomName}) {
    final Uri $url = Uri.parse('/api/v1/rooms/control/${roomName}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ControlRoomResponse>> _apiV1RoomsControlRoomNamePatch({
    required String? roomName,
    required ControlRoomUpdate? body,
  }) {
    final Uri $url = Uri.parse('/api/v1/rooms/control/${roomName}');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ControlRoomResponse, ControlRoomResponse>($request);
  }
}
