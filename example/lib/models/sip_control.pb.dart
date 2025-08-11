// This is a generated file - do not edit.
//
// Generated from sip_control.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum SipControlCommand_Command {
  register,
  unregister,
  makeCall,
  hangupCall,
  publishDtmf,
  answerCall,
  publishPresence,
  subscribe,
  transferCall,
  notSet
}

/// SipControlCommand is the top-level message that wraps all SIP control commands
class SipControlCommand extends $pb.GeneratedMessage {
  factory SipControlCommand({
    $core.String? commandId,
    SipRegister? register,
    SipUnregister? unregister,
    SipMakeCall? makeCall,
    SipHangupCall? hangupCall,
    SipPublishDTMF? publishDtmf,
    SipAnswerCall? answerCall,
    SipPublishPresence? publishPresence,
    SipSubscribe? subscribe,
    SipTransferCall? transferCall,
  }) {
    final result = create();
    if (commandId != null) result.commandId = commandId;
    if (register != null) result.register = register;
    if (unregister != null) result.unregister = unregister;
    if (makeCall != null) result.makeCall = makeCall;
    if (hangupCall != null) result.hangupCall = hangupCall;
    if (publishDtmf != null) result.publishDtmf = publishDtmf;
    if (answerCall != null) result.answerCall = answerCall;
    if (publishPresence != null) result.publishPresence = publishPresence;
    if (subscribe != null) result.subscribe = subscribe;
    if (transferCall != null) result.transferCall = transferCall;
    return result;
  }

  SipControlCommand._();

  factory SipControlCommand.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipControlCommand.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SipControlCommand_Command>
      _SipControlCommand_CommandByTag = {
    10: SipControlCommand_Command.register,
    11: SipControlCommand_Command.unregister,
    12: SipControlCommand_Command.makeCall,
    13: SipControlCommand_Command.hangupCall,
    14: SipControlCommand_Command.publishDtmf,
    15: SipControlCommand_Command.answerCall,
    16: SipControlCommand_Command.publishPresence,
    17: SipControlCommand_Command.subscribe,
    18: SipControlCommand_Command.transferCall,
    0: SipControlCommand_Command.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipControlCommand',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15, 16, 17, 18])
    ..aOS(1, _omitFieldNames ? '' : 'commandId')
    ..aOM<SipRegister>(10, _omitFieldNames ? '' : 'register',
        subBuilder: SipRegister.create)
    ..aOM<SipUnregister>(11, _omitFieldNames ? '' : 'unregister',
        subBuilder: SipUnregister.create)
    ..aOM<SipMakeCall>(12, _omitFieldNames ? '' : 'makeCall',
        subBuilder: SipMakeCall.create)
    ..aOM<SipHangupCall>(13, _omitFieldNames ? '' : 'hangupCall',
        subBuilder: SipHangupCall.create)
    ..aOM<SipPublishDTMF>(14, _omitFieldNames ? '' : 'publishDtmf',
        subBuilder: SipPublishDTMF.create)
    ..aOM<SipAnswerCall>(15, _omitFieldNames ? '' : 'answerCall',
        subBuilder: SipAnswerCall.create)
    ..aOM<SipPublishPresence>(16, _omitFieldNames ? '' : 'publishPresence',
        subBuilder: SipPublishPresence.create)
    ..aOM<SipSubscribe>(17, _omitFieldNames ? '' : 'subscribe',
        subBuilder: SipSubscribe.create)
    ..aOM<SipTransferCall>(18, _omitFieldNames ? '' : 'transferCall',
        subBuilder: SipTransferCall.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipControlCommand clone() => SipControlCommand()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipControlCommand copyWith(void Function(SipControlCommand) updates) =>
      super.copyWith((message) => updates(message as SipControlCommand))
          as SipControlCommand;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipControlCommand create() => SipControlCommand._();
  @$core.override
  SipControlCommand createEmptyInstance() => create();
  static $pb.PbList<SipControlCommand> createRepeated() =>
      $pb.PbList<SipControlCommand>();
  @$core.pragma('dart2js:noInline')
  static SipControlCommand getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipControlCommand>(create);
  static SipControlCommand? _defaultInstance;

  SipControlCommand_Command whichCommand() =>
      _SipControlCommand_CommandByTag[$_whichOneof(0)]!;
  void clearCommand() => $_clearField($_whichOneof(0));

  /// Unique ID for this command (for tracking responses/acknowledgments)
  @$pb.TagNumber(1)
  $core.String get commandId => $_getSZ(0);
  @$pb.TagNumber(1)
  set commandId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCommandId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommandId() => $_clearField(1);

  @$pb.TagNumber(10)
  SipRegister get register => $_getN(1);
  @$pb.TagNumber(10)
  set register(SipRegister value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRegister() => $_has(1);
  @$pb.TagNumber(10)
  void clearRegister() => $_clearField(10);
  @$pb.TagNumber(10)
  SipRegister ensureRegister() => $_ensure(1);

  @$pb.TagNumber(11)
  SipUnregister get unregister => $_getN(2);
  @$pb.TagNumber(11)
  set unregister(SipUnregister value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasUnregister() => $_has(2);
  @$pb.TagNumber(11)
  void clearUnregister() => $_clearField(11);
  @$pb.TagNumber(11)
  SipUnregister ensureUnregister() => $_ensure(2);

  @$pb.TagNumber(12)
  SipMakeCall get makeCall => $_getN(3);
  @$pb.TagNumber(12)
  set makeCall(SipMakeCall value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasMakeCall() => $_has(3);
  @$pb.TagNumber(12)
  void clearMakeCall() => $_clearField(12);
  @$pb.TagNumber(12)
  SipMakeCall ensureMakeCall() => $_ensure(3);

  @$pb.TagNumber(13)
  SipHangupCall get hangupCall => $_getN(4);
  @$pb.TagNumber(13)
  set hangupCall(SipHangupCall value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasHangupCall() => $_has(4);
  @$pb.TagNumber(13)
  void clearHangupCall() => $_clearField(13);
  @$pb.TagNumber(13)
  SipHangupCall ensureHangupCall() => $_ensure(4);

  @$pb.TagNumber(14)
  SipPublishDTMF get publishDtmf => $_getN(5);
  @$pb.TagNumber(14)
  set publishDtmf(SipPublishDTMF value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasPublishDtmf() => $_has(5);
  @$pb.TagNumber(14)
  void clearPublishDtmf() => $_clearField(14);
  @$pb.TagNumber(14)
  SipPublishDTMF ensurePublishDtmf() => $_ensure(5);

  @$pb.TagNumber(15)
  SipAnswerCall get answerCall => $_getN(6);
  @$pb.TagNumber(15)
  set answerCall(SipAnswerCall value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasAnswerCall() => $_has(6);
  @$pb.TagNumber(15)
  void clearAnswerCall() => $_clearField(15);
  @$pb.TagNumber(15)
  SipAnswerCall ensureAnswerCall() => $_ensure(6);

  @$pb.TagNumber(16)
  SipPublishPresence get publishPresence => $_getN(7);
  @$pb.TagNumber(16)
  set publishPresence(SipPublishPresence value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasPublishPresence() => $_has(7);
  @$pb.TagNumber(16)
  void clearPublishPresence() => $_clearField(16);
  @$pb.TagNumber(16)
  SipPublishPresence ensurePublishPresence() => $_ensure(7);

  @$pb.TagNumber(17)
  SipSubscribe get subscribe => $_getN(8);
  @$pb.TagNumber(17)
  set subscribe(SipSubscribe value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasSubscribe() => $_has(8);
  @$pb.TagNumber(17)
  void clearSubscribe() => $_clearField(17);
  @$pb.TagNumber(17)
  SipSubscribe ensureSubscribe() => $_ensure(8);

  @$pb.TagNumber(18)
  SipTransferCall get transferCall => $_getN(9);
  @$pb.TagNumber(18)
  set transferCall(SipTransferCall value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasTransferCall() => $_has(9);
  @$pb.TagNumber(18)
  void clearTransferCall() => $_clearField(18);
  @$pb.TagNumber(18)
  SipTransferCall ensureTransferCall() => $_ensure(9);
}

/// Register with SIP server using credentials
class SipRegister extends $pb.GeneratedMessage {
  factory SipRegister({
    $core.String? password,
    $core.String? hash,
    $core.String? displayName,
    $core.int? expires,
  }) {
    final result = create();
    if (password != null) result.password = password;
    if (hash != null) result.hash = hash;
    if (displayName != null) result.displayName = displayName;
    if (expires != null) result.expires = expires;
    return result;
  }

  SipRegister._();

  factory SipRegister.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipRegister.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipRegister',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'password')
    ..aOS(2, _omitFieldNames ? '' : 'hash')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'expires', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipRegister clone() => SipRegister()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipRegister copyWith(void Function(SipRegister) updates) =>
      super.copyWith((message) => updates(message as SipRegister))
          as SipRegister;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipRegister create() => SipRegister._();
  @$core.override
  SipRegister createEmptyInstance() => create();
  static $pb.PbList<SipRegister> createRepeated() => $pb.PbList<SipRegister>();
  @$core.pragma('dart2js:noInline')
  static SipRegister getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipRegister>(create);
  static SipRegister? _defaultInstance;

  /// Password for authentication (plain text)
  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => $_clearField(1);

  /// Pre-computed hash for authentication (alternative to password)
  @$pb.TagNumber(2)
  $core.String get hash => $_getSZ(1);
  @$pb.TagNumber(2)
  set hash($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => $_clearField(2);

  /// Optional display name
  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => $_clearField(3);

  /// Registration expiry in seconds (default: 3600)
  @$pb.TagNumber(4)
  $core.int get expires => $_getIZ(3);
  @$pb.TagNumber(4)
  set expires($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpires() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpires() => $_clearField(4);
}

/// Unregister from SIP server
class SipUnregister extends $pb.GeneratedMessage {
  factory SipUnregister() => create();

  SipUnregister._();

  factory SipUnregister.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipUnregister.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipUnregister',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipUnregister clone() => SipUnregister()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipUnregister copyWith(void Function(SipUnregister) updates) =>
      super.copyWith((message) => updates(message as SipUnregister))
          as SipUnregister;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipUnregister create() => SipUnregister._();
  @$core.override
  SipUnregister createEmptyInstance() => create();
  static $pb.PbList<SipUnregister> createRepeated() =>
      $pb.PbList<SipUnregister>();
  @$core.pragma('dart2js:noInline')
  static SipUnregister getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipUnregister>(create);
  static SipUnregister? _defaultInstance;
}

/// Make an outbound SIP call
class SipMakeCall extends $pb.GeneratedMessage {
  factory SipMakeCall({
    $core.String? uri,
    $core.bool? isVideo,
  }) {
    final result = create();
    if (uri != null) result.uri = uri;
    if (isVideo != null) result.isVideo = isVideo;
    return result;
  }

  SipMakeCall._();

  factory SipMakeCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipMakeCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipMakeCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uri')
    ..aOB(2, _omitFieldNames ? '' : 'isVideo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipMakeCall clone() => SipMakeCall()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipMakeCall copyWith(void Function(SipMakeCall) updates) =>
      super.copyWith((message) => updates(message as SipMakeCall))
          as SipMakeCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipMakeCall create() => SipMakeCall._();
  @$core.override
  SipMakeCall createEmptyInstance() => create();
  static $pb.PbList<SipMakeCall> createRepeated() => $pb.PbList<SipMakeCall>();
  @$core.pragma('dart2js:noInline')
  static SipMakeCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipMakeCall>(create);
  static SipMakeCall? _defaultInstance;

  /// Full SIP URI
  @$pb.TagNumber(1)
  $core.String get uri => $_getSZ(0);
  @$pb.TagNumber(1)
  set uri($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearUri() => $_clearField(1);

  /// Whether to request video in the call
  @$pb.TagNumber(2)
  $core.bool get isVideo => $_getBF(1);
  @$pb.TagNumber(2)
  set isVideo($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsVideo() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsVideo() => $_clearField(2);
}

/// Hangup/terminate a SIP call
class SipHangupCall extends $pb.GeneratedMessage {
  factory SipHangupCall({
    $core.String? callId,
    $core.String? code,
    $core.String? reason,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    if (code != null) result.code = code;
    if (reason != null) result.reason = reason;
    return result;
  }

  SipHangupCall._();

  factory SipHangupCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipHangupCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipHangupCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipHangupCall clone() => SipHangupCall()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipHangupCall copyWith(void Function(SipHangupCall) updates) =>
      super.copyWith((message) => updates(message as SipHangupCall))
          as SipHangupCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipHangupCall create() => SipHangupCall._();
  @$core.override
  SipHangupCall createEmptyInstance() => create();
  static $pb.PbList<SipHangupCall> createRepeated() =>
      $pb.PbList<SipHangupCall>();
  @$core.pragma('dart2js:noInline')
  static SipHangupCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipHangupCall>(create);
  static SipHangupCall? _defaultInstance;

  /// Call ID to hangup
  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => $_clearField(1);

  /// Optional SIP response code (default: 200 for BYE, 486 for CANCEL)
  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  /// Optional reason phrase
  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);
}

/// Send DTMF tones during a call
class SipPublishDTMF extends $pb.GeneratedMessage {
  factory SipPublishDTMF({
    $core.String? callId,
    $core.String? dtmfEvents,
    $core.double? duration,
    $core.int? volume,
    $core.String? method,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    if (dtmfEvents != null) result.dtmfEvents = dtmfEvents;
    if (duration != null) result.duration = duration;
    if (volume != null) result.volume = volume;
    if (method != null) result.method = method;
    return result;
  }

  SipPublishDTMF._();

  factory SipPublishDTMF.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipPublishDTMF.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipPublishDTMF',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOS(2, _omitFieldNames ? '' : 'dtmfEvents')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OF)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'volume', $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'method')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipPublishDTMF clone() => SipPublishDTMF()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipPublishDTMF copyWith(void Function(SipPublishDTMF) updates) =>
      super.copyWith((message) => updates(message as SipPublishDTMF))
          as SipPublishDTMF;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipPublishDTMF create() => SipPublishDTMF._();
  @$core.override
  SipPublishDTMF createEmptyInstance() => create();
  static $pb.PbList<SipPublishDTMF> createRepeated() =>
      $pb.PbList<SipPublishDTMF>();
  @$core.pragma('dart2js:noInline')
  static SipPublishDTMF getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipPublishDTMF>(create);
  static SipPublishDTMF? _defaultInstance;

  /// Call ID to send DTMF to
  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => $_clearField(1);

  /// DTMF events to send (e.g., "123", "*", "#", "A-D")
  @$pb.TagNumber(2)
  $core.String get dtmfEvents => $_getSZ(1);
  @$pb.TagNumber(2)
  set dtmfEvents($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDtmfEvents() => $_has(1);
  @$pb.TagNumber(2)
  void clearDtmfEvents() => $_clearField(2);

  /// Duration of each DTMF tone in milliseconds (default: 100ms)
  @$pb.TagNumber(3)
  $core.double get duration => $_getN(2);
  @$pb.TagNumber(3)
  set duration($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => $_clearField(3);

  /// Volume of DTMF tone 0-63 (default: 10)
  @$pb.TagNumber(4)
  $core.int get volume => $_getIZ(3);
  @$pb.TagNumber(4)
  set volume($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVolume() => $_has(3);
  @$pb.TagNumber(4)
  void clearVolume() => $_clearField(4);

  /// Method to send DTMF: "rfc2833" (default), "sip_info", "inband"
  @$pb.TagNumber(5)
  $core.String get method => $_getSZ(4);
  @$pb.TagNumber(5)
  set method($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMethod() => $_has(4);
  @$pb.TagNumber(5)
  void clearMethod() => $_clearField(5);
}

/// Answer an incoming SIP call
class SipAnswerCall extends $pb.GeneratedMessage {
  factory SipAnswerCall({
    $core.String? callId,
    $core.bool? withVideo,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? headers,
    $core.int? responseCode,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    if (withVideo != null) result.withVideo = withVideo;
    if (headers != null) result.headers.addEntries(headers);
    if (responseCode != null) result.responseCode = responseCode;
    return result;
  }

  SipAnswerCall._();

  factory SipAnswerCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipAnswerCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipAnswerCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOB(2, _omitFieldNames ? '' : 'withVideo')
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'headers',
        entryClassName: 'SipAnswerCall.HeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('sip'))
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'responseCode', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipAnswerCall clone() => SipAnswerCall()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipAnswerCall copyWith(void Function(SipAnswerCall) updates) =>
      super.copyWith((message) => updates(message as SipAnswerCall))
          as SipAnswerCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipAnswerCall create() => SipAnswerCall._();
  @$core.override
  SipAnswerCall createEmptyInstance() => create();
  static $pb.PbList<SipAnswerCall> createRepeated() =>
      $pb.PbList<SipAnswerCall>();
  @$core.pragma('dart2js:noInline')
  static SipAnswerCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipAnswerCall>(create);
  static SipAnswerCall? _defaultInstance;

  /// Call ID to answer
  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => $_clearField(1);

  /// Whether to answer with video enabled
  @$pb.TagNumber(2)
  $core.bool get withVideo => $_getBF(1);
  @$pb.TagNumber(2)
  set withVideo($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWithVideo() => $_has(1);
  @$pb.TagNumber(2)
  void clearWithVideo() => $_clearField(2);

  /// Custom SIP headers to include in 200 OK response
  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.String> get headers => $_getMap(2);

  /// Custom response code (default: 200)
  @$pb.TagNumber(4)
  $core.int get responseCode => $_getIZ(3);
  @$pb.TagNumber(4)
  set responseCode($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasResponseCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearResponseCode() => $_clearField(4);
}

/// Publish presence information
class SipPublishPresence extends $pb.GeneratedMessage {
  factory SipPublishPresence({
    $core.String? note,
    $core.String? state,
    $core.String? contact,
    $core.int? expires,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? attributes,
  }) {
    final result = create();
    if (note != null) result.note = note;
    if (state != null) result.state = state;
    if (contact != null) result.contact = contact;
    if (expires != null) result.expires = expires;
    if (attributes != null) result.attributes.addEntries(attributes);
    return result;
  }

  SipPublishPresence._();

  factory SipPublishPresence.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipPublishPresence.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipPublishPresence',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'note')
    ..aOS(2, _omitFieldNames ? '' : 'state')
    ..aOS(3, _omitFieldNames ? '' : 'contact')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'expires', $pb.PbFieldType.OU3)
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'SipPublishPresence.AttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('sip'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipPublishPresence clone() => SipPublishPresence()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipPublishPresence copyWith(void Function(SipPublishPresence) updates) =>
      super.copyWith((message) => updates(message as SipPublishPresence))
          as SipPublishPresence;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipPublishPresence create() => SipPublishPresence._();
  @$core.override
  SipPublishPresence createEmptyInstance() => create();
  static $pb.PbList<SipPublishPresence> createRepeated() =>
      $pb.PbList<SipPublishPresence>();
  @$core.pragma('dart2js:noInline')
  static SipPublishPresence getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipPublishPresence>(create);
  static SipPublishPresence? _defaultInstance;

  /// Presence note/status message
  @$pb.TagNumber(1)
  $core.String get note => $_getSZ(0);
  @$pb.TagNumber(1)
  set note($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearNote() => $_clearField(1);

  /// Presence state: "open", "closed", "busy", "away", etc.
  @$pb.TagNumber(2)
  $core.String get state => $_getSZ(1);
  @$pb.TagNumber(2)
  set state($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => $_clearField(2);

  /// Contact URI for presence
  @$pb.TagNumber(3)
  $core.String get contact => $_getSZ(2);
  @$pb.TagNumber(3)
  set contact($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContact() => $_has(2);
  @$pb.TagNumber(3)
  void clearContact() => $_clearField(3);

  /// Expiry time for presence in seconds (default: 3600)
  @$pb.TagNumber(4)
  $core.int get expires => $_getIZ(3);
  @$pb.TagNumber(4)
  set expires($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpires() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpires() => $_clearField(4);

  /// Additional presence attributes
  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get attributes => $_getMap(4);
}

/// Subscribe to SIP events
class SipSubscribe extends $pb.GeneratedMessage {
  factory SipSubscribe({
    $core.String? event,
    $core.String? targetUri,
    $core.int? expires,
    $core.Iterable<$core.String>? accept,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? headers,
  }) {
    final result = create();
    if (event != null) result.event = event;
    if (targetUri != null) result.targetUri = targetUri;
    if (expires != null) result.expires = expires;
    if (accept != null) result.accept.addAll(accept);
    if (headers != null) result.headers.addEntries(headers);
    return result;
  }

  SipSubscribe._();

  factory SipSubscribe.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipSubscribe.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipSubscribe',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'event')
    ..aOS(2, _omitFieldNames ? '' : 'targetUri')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'expires', $pb.PbFieldType.OU3)
    ..pPS(4, _omitFieldNames ? '' : 'accept')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'headers',
        entryClassName: 'SipSubscribe.HeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('sip'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipSubscribe clone() => SipSubscribe()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipSubscribe copyWith(void Function(SipSubscribe) updates) =>
      super.copyWith((message) => updates(message as SipSubscribe))
          as SipSubscribe;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipSubscribe create() => SipSubscribe._();
  @$core.override
  SipSubscribe createEmptyInstance() => create();
  static $pb.PbList<SipSubscribe> createRepeated() =>
      $pb.PbList<SipSubscribe>();
  @$core.pragma('dart2js:noInline')
  static SipSubscribe getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipSubscribe>(create);
  static SipSubscribe? _defaultInstance;

  /// Event type to subscribe to (e.g., "presence", "message-summary", "dialog")
  @$pb.TagNumber(1)
  $core.String get event => $_getSZ(0);
  @$pb.TagNumber(1)
  set event($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => $_clearField(1);

  /// Target URI to subscribe to
  @$pb.TagNumber(2)
  $core.String get targetUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetUri($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetUri() => $_clearField(2);

  /// Subscription expiry in seconds (default: 3600)
  @$pb.TagNumber(3)
  $core.int get expires => $_getIZ(2);
  @$pb.TagNumber(3)
  set expires($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpires() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpires() => $_clearField(3);

  /// Accept header content types
  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get accept => $_getList(3);

  /// Custom headers for SUBSCRIBE request
  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get headers => $_getMap(4);
}

/// Transfer a call to another party
class SipTransferCall extends $pb.GeneratedMessage {
  factory SipTransferCall({
    $core.String? callId,
    $core.String? targetUri,
    $core.String? transferType,
    $core.String? consultationCallId,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    if (targetUri != null) result.targetUri = targetUri;
    if (transferType != null) result.transferType = transferType;
    if (consultationCallId != null)
      result.consultationCallId = consultationCallId;
    return result;
  }

  SipTransferCall._();

  factory SipTransferCall.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipTransferCall.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipTransferCall',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOS(2, _omitFieldNames ? '' : 'targetUri')
    ..aOS(3, _omitFieldNames ? '' : 'transferType')
    ..aOS(4, _omitFieldNames ? '' : 'consultationCallId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipTransferCall clone() => SipTransferCall()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipTransferCall copyWith(void Function(SipTransferCall) updates) =>
      super.copyWith((message) => updates(message as SipTransferCall))
          as SipTransferCall;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipTransferCall create() => SipTransferCall._();
  @$core.override
  SipTransferCall createEmptyInstance() => create();
  static $pb.PbList<SipTransferCall> createRepeated() =>
      $pb.PbList<SipTransferCall>();
  @$core.pragma('dart2js:noInline')
  static SipTransferCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipTransferCall>(create);
  static SipTransferCall? _defaultInstance;

  /// Call ID to transfer
  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => $_clearField(1);

  /// Target URI to transfer to
  @$pb.TagNumber(2)
  $core.String get targetUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetUri($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetUri() => $_clearField(2);

  /// Transfer type: "blind" (default) or "attended"
  @$pb.TagNumber(3)
  $core.String get transferType => $_getSZ(2);
  @$pb.TagNumber(3)
  set transferType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransferType() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferType() => $_clearField(3);

  /// For attended transfer: consultation call ID
  @$pb.TagNumber(4)
  $core.String get consultationCallId => $_getSZ(3);
  @$pb.TagNumber(4)
  set consultationCallId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasConsultationCallId() => $_has(3);
  @$pb.TagNumber(4)
  void clearConsultationCallId() => $_clearField(4);
}

enum SipControlResponse_Result {
  registerResult,
  callResult,
  presenceResult,
  subscribeResult,
  notSet
}

/// Response message for command acknowledgment and results
class SipControlResponse extends $pb.GeneratedMessage {
  factory SipControlResponse({
    $core.String? commandId,
    $core.bool? success,
    $core.String? error,
    SipRegisterResult? registerResult,
    SipCallResult? callResult,
    SipPresenceResult? presenceResult,
    SipSubscribeResult? subscribeResult,
  }) {
    final result = create();
    if (commandId != null) result.commandId = commandId;
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    if (registerResult != null) result.registerResult = registerResult;
    if (callResult != null) result.callResult = callResult;
    if (presenceResult != null) result.presenceResult = presenceResult;
    if (subscribeResult != null) result.subscribeResult = subscribeResult;
    return result;
  }

  SipControlResponse._();

  factory SipControlResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipControlResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SipControlResponse_Result>
      _SipControlResponse_ResultByTag = {
    10: SipControlResponse_Result.registerResult,
    11: SipControlResponse_Result.callResult,
    12: SipControlResponse_Result.presenceResult,
    13: SipControlResponse_Result.subscribeResult,
    0: SipControlResponse_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipControlResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13])
    ..aOS(1, _omitFieldNames ? '' : 'commandId')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..aOM<SipRegisterResult>(10, _omitFieldNames ? '' : 'registerResult',
        subBuilder: SipRegisterResult.create)
    ..aOM<SipCallResult>(11, _omitFieldNames ? '' : 'callResult',
        subBuilder: SipCallResult.create)
    ..aOM<SipPresenceResult>(12, _omitFieldNames ? '' : 'presenceResult',
        subBuilder: SipPresenceResult.create)
    ..aOM<SipSubscribeResult>(13, _omitFieldNames ? '' : 'subscribeResult',
        subBuilder: SipSubscribeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipControlResponse clone() => SipControlResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipControlResponse copyWith(void Function(SipControlResponse) updates) =>
      super.copyWith((message) => updates(message as SipControlResponse))
          as SipControlResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipControlResponse create() => SipControlResponse._();
  @$core.override
  SipControlResponse createEmptyInstance() => create();
  static $pb.PbList<SipControlResponse> createRepeated() =>
      $pb.PbList<SipControlResponse>();
  @$core.pragma('dart2js:noInline')
  static SipControlResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipControlResponse>(create);
  static SipControlResponse? _defaultInstance;

  SipControlResponse_Result whichResult() =>
      _SipControlResponse_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => $_clearField($_whichOneof(0));

  /// ID of the command this response is for
  @$pb.TagNumber(1)
  $core.String get commandId => $_getSZ(0);
  @$pb.TagNumber(1)
  set commandId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCommandId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommandId() => $_clearField(1);

  /// Whether the command was successful
  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => $_clearField(2);

  /// Error message if not successful
  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);

  @$pb.TagNumber(10)
  SipRegisterResult get registerResult => $_getN(3);
  @$pb.TagNumber(10)
  set registerResult(SipRegisterResult value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRegisterResult() => $_has(3);
  @$pb.TagNumber(10)
  void clearRegisterResult() => $_clearField(10);
  @$pb.TagNumber(10)
  SipRegisterResult ensureRegisterResult() => $_ensure(3);

  @$pb.TagNumber(11)
  SipCallResult get callResult => $_getN(4);
  @$pb.TagNumber(11)
  set callResult(SipCallResult value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasCallResult() => $_has(4);
  @$pb.TagNumber(11)
  void clearCallResult() => $_clearField(11);
  @$pb.TagNumber(11)
  SipCallResult ensureCallResult() => $_ensure(4);

  @$pb.TagNumber(12)
  SipPresenceResult get presenceResult => $_getN(5);
  @$pb.TagNumber(12)
  set presenceResult(SipPresenceResult value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasPresenceResult() => $_has(5);
  @$pb.TagNumber(12)
  void clearPresenceResult() => $_clearField(12);
  @$pb.TagNumber(12)
  SipPresenceResult ensurePresenceResult() => $_ensure(5);

  @$pb.TagNumber(13)
  SipSubscribeResult get subscribeResult => $_getN(6);
  @$pb.TagNumber(13)
  set subscribeResult(SipSubscribeResult value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasSubscribeResult() => $_has(6);
  @$pb.TagNumber(13)
  void clearSubscribeResult() => $_clearField(13);
  @$pb.TagNumber(13)
  SipSubscribeResult ensureSubscribeResult() => $_ensure(6);
}

/// Result for SIP registration
class SipRegisterResult extends $pb.GeneratedMessage {
  factory SipRegisterResult({
    $core.int? code,
    $core.int? expires,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (expires != null) result.expires = expires;
    if (message != null) result.message = message;
    return result;
  }

  SipRegisterResult._();

  factory SipRegisterResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipRegisterResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipRegisterResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'expires', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipRegisterResult clone() => SipRegisterResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipRegisterResult copyWith(void Function(SipRegisterResult) updates) =>
      super.copyWith((message) => updates(message as SipRegisterResult))
          as SipRegisterResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipRegisterResult create() => SipRegisterResult._();
  @$core.override
  SipRegisterResult createEmptyInstance() => create();
  static $pb.PbList<SipRegisterResult> createRepeated() =>
      $pb.PbList<SipRegisterResult>();
  @$core.pragma('dart2js:noInline')
  static SipRegisterResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipRegisterResult>(create);
  static SipRegisterResult? _defaultInstance;

  /// Registration code
  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  /// Registration expiry time
  @$pb.TagNumber(2)
  $core.int get expires => $_getIZ(1);
  @$pb.TagNumber(2)
  set expires($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpires() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpires() => $_clearField(2);

  /// Server response message
  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

/// Result for call operations
class SipCallResult extends $pb.GeneratedMessage {
  factory SipCallResult({
    $core.String? callId,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    return result;
  }

  SipCallResult._();

  factory SipCallResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipCallResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipCallResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipCallResult clone() => SipCallResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipCallResult copyWith(void Function(SipCallResult) updates) =>
      super.copyWith((message) => updates(message as SipCallResult))
          as SipCallResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipCallResult create() => SipCallResult._();
  @$core.override
  SipCallResult createEmptyInstance() => create();
  static $pb.PbList<SipCallResult> createRepeated() =>
      $pb.PbList<SipCallResult>();
  @$core.pragma('dart2js:noInline')
  static SipCallResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipCallResult>(create);
  static SipCallResult? _defaultInstance;

  /// Call ID assigned by the system
  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => $_clearField(1);
}

/// Result for presence operations
class SipPresenceResult extends $pb.GeneratedMessage {
  factory SipPresenceResult({
    $core.String? state,
    $core.int? expires,
  }) {
    final result = create();
    if (state != null) result.state = state;
    if (expires != null) result.expires = expires;
    return result;
  }

  SipPresenceResult._();

  factory SipPresenceResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipPresenceResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipPresenceResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'state')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'expires', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipPresenceResult clone() => SipPresenceResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipPresenceResult copyWith(void Function(SipPresenceResult) updates) =>
      super.copyWith((message) => updates(message as SipPresenceResult))
          as SipPresenceResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipPresenceResult create() => SipPresenceResult._();
  @$core.override
  SipPresenceResult createEmptyInstance() => create();
  static $pb.PbList<SipPresenceResult> createRepeated() =>
      $pb.PbList<SipPresenceResult>();
  @$core.pragma('dart2js:noInline')
  static SipPresenceResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipPresenceResult>(create);
  static SipPresenceResult? _defaultInstance;

  /// Published presence state
  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => $_clearField(1);

  /// Expiry time
  @$pb.TagNumber(2)
  $core.int get expires => $_getIZ(1);
  @$pb.TagNumber(2)
  set expires($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpires() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpires() => $_clearField(2);
}

/// Result for subscription operations
class SipSubscribeResult extends $pb.GeneratedMessage {
  factory SipSubscribeResult({
    $core.String? subscriptionId,
    $core.String? state,
    $core.int? expires,
  }) {
    final result = create();
    if (subscriptionId != null) result.subscriptionId = subscriptionId;
    if (state != null) result.state = state;
    if (expires != null) result.expires = expires;
    return result;
  }

  SipSubscribeResult._();

  factory SipSubscribeResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipSubscribeResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipSubscribeResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sip'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subscriptionId')
    ..aOS(2, _omitFieldNames ? '' : 'state')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'expires', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipSubscribeResult clone() => SipSubscribeResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipSubscribeResult copyWith(void Function(SipSubscribeResult) updates) =>
      super.copyWith((message) => updates(message as SipSubscribeResult))
          as SipSubscribeResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipSubscribeResult create() => SipSubscribeResult._();
  @$core.override
  SipSubscribeResult createEmptyInstance() => create();
  static $pb.PbList<SipSubscribeResult> createRepeated() =>
      $pb.PbList<SipSubscribeResult>();
  @$core.pragma('dart2js:noInline')
  static SipSubscribeResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipSubscribeResult>(create);
  static SipSubscribeResult? _defaultInstance;

  /// Subscription ID
  @$pb.TagNumber(1)
  $core.String get subscriptionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subscriptionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubscriptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionId() => $_clearField(1);

  /// Subscription state
  @$pb.TagNumber(2)
  $core.String get state => $_getSZ(1);
  @$pb.TagNumber(2)
  set state($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => $_clearField(2);

  /// Expiry time
  @$pb.TagNumber(3)
  $core.int get expires => $_getIZ(2);
  @$pb.TagNumber(3)
  set expires($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpires() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpires() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
