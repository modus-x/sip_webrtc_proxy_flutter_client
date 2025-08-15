// This is a generated file - do not edit.
//
// Generated from sip_signalling.proto.

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
  switchHold,
  blindTransfer,
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
    SipSwitchHold? switchHold,
    SipBlindTransfer? blindTransfer,
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
    if (switchHold != null) result.switchHold = switchHold;
    if (blindTransfer != null) result.blindTransfer = blindTransfer;
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
    18: SipControlCommand_Command.switchHold,
    19: SipControlCommand_Command.blindTransfer,
    0: SipControlCommand_Command.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipControlCommand',
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19])
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
    ..aOM<SipSwitchHold>(18, _omitFieldNames ? '' : 'switchHold',
        subBuilder: SipSwitchHold.create)
    ..aOM<SipBlindTransfer>(19, _omitFieldNames ? '' : 'blindTransfer',
        subBuilder: SipBlindTransfer.create)
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
  SipSwitchHold get switchHold => $_getN(9);
  @$pb.TagNumber(18)
  set switchHold(SipSwitchHold value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasSwitchHold() => $_has(9);
  @$pb.TagNumber(18)
  void clearSwitchHold() => $_clearField(18);
  @$pb.TagNumber(18)
  SipSwitchHold ensureSwitchHold() => $_ensure(9);

  @$pb.TagNumber(19)
  SipBlindTransfer get blindTransfer => $_getN(10);
  @$pb.TagNumber(19)
  set blindTransfer(SipBlindTransfer value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasBlindTransfer() => $_has(10);
  @$pb.TagNumber(19)
  void clearBlindTransfer() => $_clearField(19);
  @$pb.TagNumber(19)
  SipBlindTransfer ensureBlindTransfer() => $_ensure(10);
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
    $core.String? target,
    $core.bool? isVideo,
  }) {
    final result = create();
    if (target != null) result.target = target;
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
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'target')
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

  @$pb.TagNumber(1)
  $core.String get target => $_getSZ(0);
  @$pb.TagNumber(1)
  set target($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTarget() => $_has(0);
  @$pb.TagNumber(1)
  void clearTarget() => $_clearField(1);

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
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    if (dtmfEvents != null) result.dtmfEvents = dtmfEvents;
    if (duration != null) result.duration = duration;
    if (volume != null) result.volume = volume;
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
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOS(2, _omitFieldNames ? '' : 'dtmfEvents')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.OF)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'volume', $pb.PbFieldType.OU3)
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
}

/// Answer an incoming SIP call
class SipAnswerCall extends $pb.GeneratedMessage {
  factory SipAnswerCall({
    $core.String? callId,
    $core.bool? withVideo,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    if (withVideo != null) result.withVideo = withVideo;
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
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOB(2, _omitFieldNames ? '' : 'withVideo')
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
}

/// Publish presence information
class SipPublishPresence extends $pb.GeneratedMessage {
  factory SipPublishPresence({
    $core.String? note,
  }) {
    final result = create();
    if (note != null) result.note = note;
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
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'note')
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
}

/// Subscribe to SIP events
class SipSubscribe extends $pb.GeneratedMessage {
  factory SipSubscribe({
    $core.String? event,
    $core.String? target,
    $core.int? expires,
  }) {
    final result = create();
    if (event != null) result.event = event;
    if (target != null) result.target = target;
    if (expires != null) result.expires = expires;
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
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'event')
    ..aOS(2, _omitFieldNames ? '' : 'target')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'expires', $pb.PbFieldType.OU3)
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
  $core.String get target => $_getSZ(1);
  @$pb.TagNumber(2)
  set target($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTarget() => $_has(1);
  @$pb.TagNumber(2)
  void clearTarget() => $_clearField(2);

  /// Subscription expiry in seconds (default: 3600)
  @$pb.TagNumber(3)
  $core.int get expires => $_getIZ(2);
  @$pb.TagNumber(3)
  set expires($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpires() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpires() => $_clearField(3);
}

class SipSwitchHold extends $pb.GeneratedMessage {
  factory SipSwitchHold({
    $core.String? callId,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    return result;
  }

  SipSwitchHold._();

  factory SipSwitchHold.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipSwitchHold.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipSwitchHold',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipSwitchHold clone() => SipSwitchHold()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipSwitchHold copyWith(void Function(SipSwitchHold) updates) =>
      super.copyWith((message) => updates(message as SipSwitchHold))
          as SipSwitchHold;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipSwitchHold create() => SipSwitchHold._();
  @$core.override
  SipSwitchHold createEmptyInstance() => create();
  static $pb.PbList<SipSwitchHold> createRepeated() =>
      $pb.PbList<SipSwitchHold>();
  @$core.pragma('dart2js:noInline')
  static SipSwitchHold getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipSwitchHold>(create);
  static SipSwitchHold? _defaultInstance;

  /// Call ID to switch hold
  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => $_clearField(1);
}

class SipBlindTransfer extends $pb.GeneratedMessage {
  factory SipBlindTransfer({
    $core.String? callId,
    $core.String? target,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    if (target != null) result.target = target;
    return result;
  }

  SipBlindTransfer._();

  factory SipBlindTransfer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipBlindTransfer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipBlindTransfer',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..aOS(2, _omitFieldNames ? '' : 'target')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipBlindTransfer clone() => SipBlindTransfer()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipBlindTransfer copyWith(void Function(SipBlindTransfer) updates) =>
      super.copyWith((message) => updates(message as SipBlindTransfer))
          as SipBlindTransfer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipBlindTransfer create() => SipBlindTransfer._();
  @$core.override
  SipBlindTransfer createEmptyInstance() => create();
  static $pb.PbList<SipBlindTransfer> createRepeated() =>
      $pb.PbList<SipBlindTransfer>();
  @$core.pragma('dart2js:noInline')
  static SipBlindTransfer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipBlindTransfer>(create);
  static SipBlindTransfer? _defaultInstance;

  /// Call ID to blind transfer
  @$pb.TagNumber(1)
  $core.String get callId => $_getSZ(0);
  @$pb.TagNumber(1)
  set callId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => $_clearField(1);

  /// Target to transfer to
  @$pb.TagNumber(2)
  $core.String get target => $_getSZ(1);
  @$pb.TagNumber(2)
  set target($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTarget() => $_has(1);
  @$pb.TagNumber(2)
  void clearTarget() => $_clearField(2);
}

enum SipControlResponse_Result {
  registerResult,
  makeCallResult,
  hangupCallResult,
  presencePublishResult,
  answerCallResult,
  subscribeResult,
  notifyReceived,
  switchHoldResult,
  blindTransferResult,
  notSet
}

/// Response message for command acknowledgment and results
class SipControlResponse extends $pb.GeneratedMessage {
  factory SipControlResponse({
    $core.String? commandId,
    $core.bool? success,
    $core.String? error,
    SipRegisterResult? registerResult,
    SipMakeCallResult? makeCallResult,
    SipHangupCallResult? hangupCallResult,
    SipPresencePublishResult? presencePublishResult,
    SipAnswerCallResult? answerCallResult,
    SipSubscribeResult? subscribeResult,
    SipNotifyReceived? notifyReceived,
    SipSwitchHoldResult? switchHoldResult,
    SipBlindTransferResult? blindTransferResult,
  }) {
    final result = create();
    if (commandId != null) result.commandId = commandId;
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    if (registerResult != null) result.registerResult = registerResult;
    if (makeCallResult != null) result.makeCallResult = makeCallResult;
    if (hangupCallResult != null) result.hangupCallResult = hangupCallResult;
    if (presencePublishResult != null)
      result.presencePublishResult = presencePublishResult;
    if (answerCallResult != null) result.answerCallResult = answerCallResult;
    if (subscribeResult != null) result.subscribeResult = subscribeResult;
    if (notifyReceived != null) result.notifyReceived = notifyReceived;
    if (switchHoldResult != null) result.switchHoldResult = switchHoldResult;
    if (blindTransferResult != null)
      result.blindTransferResult = blindTransferResult;
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
    11: SipControlResponse_Result.makeCallResult,
    12: SipControlResponse_Result.hangupCallResult,
    13: SipControlResponse_Result.presencePublishResult,
    14: SipControlResponse_Result.answerCallResult,
    15: SipControlResponse_Result.subscribeResult,
    17: SipControlResponse_Result.notifyReceived,
    18: SipControlResponse_Result.switchHoldResult,
    19: SipControlResponse_Result.blindTransferResult,
    0: SipControlResponse_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipControlResponse',
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15, 17, 18, 19])
    ..aOS(1, _omitFieldNames ? '' : 'commandId')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..aOM<SipRegisterResult>(10, _omitFieldNames ? '' : 'registerResult',
        subBuilder: SipRegisterResult.create)
    ..aOM<SipMakeCallResult>(11, _omitFieldNames ? '' : 'makeCallResult',
        subBuilder: SipMakeCallResult.create)
    ..aOM<SipHangupCallResult>(12, _omitFieldNames ? '' : 'hangupCallResult',
        subBuilder: SipHangupCallResult.create)
    ..aOM<SipPresencePublishResult>(
        13, _omitFieldNames ? '' : 'presencePublishResult',
        subBuilder: SipPresencePublishResult.create)
    ..aOM<SipAnswerCallResult>(14, _omitFieldNames ? '' : 'answerCallResult',
        subBuilder: SipAnswerCallResult.create)
    ..aOM<SipSubscribeResult>(15, _omitFieldNames ? '' : 'subscribeResult',
        subBuilder: SipSubscribeResult.create)
    ..aOM<SipNotifyReceived>(17, _omitFieldNames ? '' : 'notifyReceived',
        subBuilder: SipNotifyReceived.create)
    ..aOM<SipSwitchHoldResult>(18, _omitFieldNames ? '' : 'switchHoldResult',
        subBuilder: SipSwitchHoldResult.create)
    ..aOM<SipBlindTransferResult>(
        19, _omitFieldNames ? '' : 'blindTransferResult',
        subBuilder: SipBlindTransferResult.create)
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
  SipMakeCallResult get makeCallResult => $_getN(4);
  @$pb.TagNumber(11)
  set makeCallResult(SipMakeCallResult value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasMakeCallResult() => $_has(4);
  @$pb.TagNumber(11)
  void clearMakeCallResult() => $_clearField(11);
  @$pb.TagNumber(11)
  SipMakeCallResult ensureMakeCallResult() => $_ensure(4);

  @$pb.TagNumber(12)
  SipHangupCallResult get hangupCallResult => $_getN(5);
  @$pb.TagNumber(12)
  set hangupCallResult(SipHangupCallResult value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasHangupCallResult() => $_has(5);
  @$pb.TagNumber(12)
  void clearHangupCallResult() => $_clearField(12);
  @$pb.TagNumber(12)
  SipHangupCallResult ensureHangupCallResult() => $_ensure(5);

  @$pb.TagNumber(13)
  SipPresencePublishResult get presencePublishResult => $_getN(6);
  @$pb.TagNumber(13)
  set presencePublishResult(SipPresencePublishResult value) =>
      $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasPresencePublishResult() => $_has(6);
  @$pb.TagNumber(13)
  void clearPresencePublishResult() => $_clearField(13);
  @$pb.TagNumber(13)
  SipPresencePublishResult ensurePresencePublishResult() => $_ensure(6);

  @$pb.TagNumber(14)
  SipAnswerCallResult get answerCallResult => $_getN(7);
  @$pb.TagNumber(14)
  set answerCallResult(SipAnswerCallResult value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasAnswerCallResult() => $_has(7);
  @$pb.TagNumber(14)
  void clearAnswerCallResult() => $_clearField(14);
  @$pb.TagNumber(14)
  SipAnswerCallResult ensureAnswerCallResult() => $_ensure(7);

  @$pb.TagNumber(15)
  SipSubscribeResult get subscribeResult => $_getN(8);
  @$pb.TagNumber(15)
  set subscribeResult(SipSubscribeResult value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasSubscribeResult() => $_has(8);
  @$pb.TagNumber(15)
  void clearSubscribeResult() => $_clearField(15);
  @$pb.TagNumber(15)
  SipSubscribeResult ensureSubscribeResult() => $_ensure(8);

  @$pb.TagNumber(17)
  SipNotifyReceived get notifyReceived => $_getN(9);
  @$pb.TagNumber(17)
  set notifyReceived(SipNotifyReceived value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasNotifyReceived() => $_has(9);
  @$pb.TagNumber(17)
  void clearNotifyReceived() => $_clearField(17);
  @$pb.TagNumber(17)
  SipNotifyReceived ensureNotifyReceived() => $_ensure(9);

  @$pb.TagNumber(18)
  SipSwitchHoldResult get switchHoldResult => $_getN(10);
  @$pb.TagNumber(18)
  set switchHoldResult(SipSwitchHoldResult value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasSwitchHoldResult() => $_has(10);
  @$pb.TagNumber(18)
  void clearSwitchHoldResult() => $_clearField(18);
  @$pb.TagNumber(18)
  SipSwitchHoldResult ensureSwitchHoldResult() => $_ensure(10);

  @$pb.TagNumber(19)
  SipBlindTransferResult get blindTransferResult => $_getN(11);
  @$pb.TagNumber(19)
  set blindTransferResult(SipBlindTransferResult value) =>
      $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasBlindTransferResult() => $_has(11);
  @$pb.TagNumber(19)
  void clearBlindTransferResult() => $_clearField(19);
  @$pb.TagNumber(19)
  SipBlindTransferResult ensureBlindTransferResult() => $_ensure(11);
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
class SipMakeCallResult extends $pb.GeneratedMessage {
  factory SipMakeCallResult({
    $core.String? callId,
  }) {
    final result = create();
    if (callId != null) result.callId = callId;
    return result;
  }

  SipMakeCallResult._();

  factory SipMakeCallResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipMakeCallResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipMakeCallResult',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipMakeCallResult clone() => SipMakeCallResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipMakeCallResult copyWith(void Function(SipMakeCallResult) updates) =>
      super.copyWith((message) => updates(message as SipMakeCallResult))
          as SipMakeCallResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipMakeCallResult create() => SipMakeCallResult._();
  @$core.override
  SipMakeCallResult createEmptyInstance() => create();
  static $pb.PbList<SipMakeCallResult> createRepeated() =>
      $pb.PbList<SipMakeCallResult>();
  @$core.pragma('dart2js:noInline')
  static SipMakeCallResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipMakeCallResult>(create);
  static SipMakeCallResult? _defaultInstance;

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
class SipPresencePublishResult extends $pb.GeneratedMessage {
  factory SipPresencePublishResult({
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  SipPresencePublishResult._();

  factory SipPresencePublishResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipPresencePublishResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipPresencePublishResult',
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipPresencePublishResult clone() =>
      SipPresencePublishResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipPresencePublishResult copyWith(
          void Function(SipPresencePublishResult) updates) =>
      super.copyWith((message) => updates(message as SipPresencePublishResult))
          as SipPresencePublishResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipPresencePublishResult create() => SipPresencePublishResult._();
  @$core.override
  SipPresencePublishResult createEmptyInstance() => create();
  static $pb.PbList<SipPresencePublishResult> createRepeated() =>
      $pb.PbList<SipPresencePublishResult>();
  @$core.pragma('dart2js:noInline')
  static SipPresencePublishResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipPresencePublishResult>(create);
  static SipPresencePublishResult? _defaultInstance;

  /// Presence result code
  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  /// Server response message
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// Result for hangup call operations
class SipHangupCallResult extends $pb.GeneratedMessage {
  factory SipHangupCallResult({
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  SipHangupCallResult._();

  factory SipHangupCallResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipHangupCallResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipHangupCallResult',
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipHangupCallResult clone() => SipHangupCallResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipHangupCallResult copyWith(void Function(SipHangupCallResult) updates) =>
      super.copyWith((message) => updates(message as SipHangupCallResult))
          as SipHangupCallResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipHangupCallResult create() => SipHangupCallResult._();
  @$core.override
  SipHangupCallResult createEmptyInstance() => create();
  static $pb.PbList<SipHangupCallResult> createRepeated() =>
      $pb.PbList<SipHangupCallResult>();
  @$core.pragma('dart2js:noInline')
  static SipHangupCallResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipHangupCallResult>(create);
  static SipHangupCallResult? _defaultInstance;

  /// Hangup result code
  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  /// Server response message
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// Result for answer call operations
class SipAnswerCallResult extends $pb.GeneratedMessage {
  factory SipAnswerCallResult({
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  SipAnswerCallResult._();

  factory SipAnswerCallResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipAnswerCallResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipAnswerCallResult',
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipAnswerCallResult clone() => SipAnswerCallResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipAnswerCallResult copyWith(void Function(SipAnswerCallResult) updates) =>
      super.copyWith((message) => updates(message as SipAnswerCallResult))
          as SipAnswerCallResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipAnswerCallResult create() => SipAnswerCallResult._();
  @$core.override
  SipAnswerCallResult createEmptyInstance() => create();
  static $pb.PbList<SipAnswerCallResult> createRepeated() =>
      $pb.PbList<SipAnswerCallResult>();
  @$core.pragma('dart2js:noInline')
  static SipAnswerCallResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipAnswerCallResult>(create);
  static SipAnswerCallResult? _defaultInstance;

  /// Answer result code
  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  /// Server response message
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// Result for switch hold operations
class SipSwitchHoldResult extends $pb.GeneratedMessage {
  factory SipSwitchHoldResult({
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  SipSwitchHoldResult._();

  factory SipSwitchHoldResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipSwitchHoldResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipSwitchHoldResult',
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipSwitchHoldResult clone() => SipSwitchHoldResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipSwitchHoldResult copyWith(void Function(SipSwitchHoldResult) updates) =>
      super.copyWith((message) => updates(message as SipSwitchHoldResult))
          as SipSwitchHoldResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipSwitchHoldResult create() => SipSwitchHoldResult._();
  @$core.override
  SipSwitchHoldResult createEmptyInstance() => create();
  static $pb.PbList<SipSwitchHoldResult> createRepeated() =>
      $pb.PbList<SipSwitchHoldResult>();
  @$core.pragma('dart2js:noInline')
  static SipSwitchHoldResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipSwitchHoldResult>(create);
  static SipSwitchHoldResult? _defaultInstance;

  /// Switch hold result code
  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  /// Server response message
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

/// Result for subscription operations
class SipNotifyReceived extends $pb.GeneratedMessage {
  factory SipNotifyReceived({
    $core.String? event,
    $core.String? text,
    $core.String? contentType,
  }) {
    final result = create();
    if (event != null) result.event = event;
    if (text != null) result.text = text;
    if (contentType != null) result.contentType = contentType;
    return result;
  }

  SipNotifyReceived._();

  factory SipNotifyReceived.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipNotifyReceived.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipNotifyReceived',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'event')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOS(3, _omitFieldNames ? '' : 'contentType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipNotifyReceived clone() => SipNotifyReceived()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipNotifyReceived copyWith(void Function(SipNotifyReceived) updates) =>
      super.copyWith((message) => updates(message as SipNotifyReceived))
          as SipNotifyReceived;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipNotifyReceived create() => SipNotifyReceived._();
  @$core.override
  SipNotifyReceived createEmptyInstance() => create();
  static $pb.PbList<SipNotifyReceived> createRepeated() =>
      $pb.PbList<SipNotifyReceived>();
  @$core.pragma('dart2js:noInline')
  static SipNotifyReceived getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipNotifyReceived>(create);
  static SipNotifyReceived? _defaultInstance;

  /// Event type
  @$pb.TagNumber(1)
  $core.String get event => $_getSZ(0);
  @$pb.TagNumber(1)
  set event($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => $_clearField(1);

  /// Event text, unparsed
  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  /// Type of content
  @$pb.TagNumber(3)
  $core.String get contentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set contentType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearContentType() => $_clearField(3);
}

/// Result for subscription operations
class SipSubscribeResult extends $pb.GeneratedMessage {
  factory SipSubscribeResult({
    $core.String? state,
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (state != null) result.state = state;
    if (code != null) result.code = code;
    if (message != null) result.message = message;
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
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'state')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'message')
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

  /// Subscription state
  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => $_clearField(1);

  /// Subscribe result code
  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

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

/// Result for subscription operations
class SipBlindTransferResult extends $pb.GeneratedMessage {
  factory SipBlindTransferResult({
    $core.String? state,
    $core.int? code,
    $core.String? message,
  }) {
    final result = create();
    if (state != null) result.state = state;
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    return result;
  }

  SipBlindTransferResult._();

  factory SipBlindTransferResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SipBlindTransferResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SipBlindTransferResult',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'state')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipBlindTransferResult clone() =>
      SipBlindTransferResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SipBlindTransferResult copyWith(
          void Function(SipBlindTransferResult) updates) =>
      super.copyWith((message) => updates(message as SipBlindTransferResult))
          as SipBlindTransferResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SipBlindTransferResult create() => SipBlindTransferResult._();
  @$core.override
  SipBlindTransferResult createEmptyInstance() => create();
  static $pb.PbList<SipBlindTransferResult> createRepeated() =>
      $pb.PbList<SipBlindTransferResult>();
  @$core.pragma('dart2js:noInline')
  static SipBlindTransferResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SipBlindTransferResult>(create);
  static SipBlindTransferResult? _defaultInstance;

  /// REFER subscription state
  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => $_clearField(1);

  /// Blind transfer result code
  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
