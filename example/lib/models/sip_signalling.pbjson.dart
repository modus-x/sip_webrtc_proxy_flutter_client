// This is a generated file - do not edit.
//
// Generated from sip_signalling.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sipControlCommandDescriptor instead')
const SipControlCommand$json = {
  '1': 'SipControlCommand',
  '2': [
    {'1': 'command_id', '3': 1, '4': 1, '5': 9, '10': 'commandId'},
    {
      '1': 'register',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.SipRegister',
      '9': 0,
      '10': 'register'
    },
    {
      '1': 'unregister',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.SipUnregister',
      '9': 0,
      '10': 'unregister'
    },
    {
      '1': 'make_call',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.SipMakeCall',
      '9': 0,
      '10': 'makeCall'
    },
    {
      '1': 'hangup_call',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.SipHangupCall',
      '9': 0,
      '10': 'hangupCall'
    },
    {
      '1': 'publish_dtmf',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.SipPublishDTMF',
      '9': 0,
      '10': 'publishDtmf'
    },
    {
      '1': 'answer_call',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.SipAnswerCall',
      '9': 0,
      '10': 'answerCall'
    },
    {
      '1': 'publish_presence',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.SipPublishPresence',
      '9': 0,
      '10': 'publishPresence'
    },
    {
      '1': 'subscribe',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.SipSubscribe',
      '9': 0,
      '10': 'subscribe'
    },
    {
      '1': 'switch_hold',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.SipSwitchHold',
      '9': 0,
      '10': 'switchHold'
    },
    {
      '1': 'blind_transfer',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.SipBlindTransfer',
      '9': 0,
      '10': 'blindTransfer'
    },
  ],
  '8': [
    {'1': 'command'},
  ],
};

/// Descriptor for `SipControlCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipControlCommandDescriptor = $convert.base64Decode(
    'ChFTaXBDb250cm9sQ29tbWFuZBIdCgpjb21tYW5kX2lkGAEgASgJUgljb21tYW5kSWQSKgoIcm'
    'VnaXN0ZXIYCiABKAsyDC5TaXBSZWdpc3RlckgAUghyZWdpc3RlchIwCgp1bnJlZ2lzdGVyGAsg'
    'ASgLMg4uU2lwVW5yZWdpc3RlckgAUgp1bnJlZ2lzdGVyEisKCW1ha2VfY2FsbBgMIAEoCzIMLl'
    'NpcE1ha2VDYWxsSABSCG1ha2VDYWxsEjEKC2hhbmd1cF9jYWxsGA0gASgLMg4uU2lwSGFuZ3Vw'
    'Q2FsbEgAUgpoYW5ndXBDYWxsEjQKDHB1Ymxpc2hfZHRtZhgOIAEoCzIPLlNpcFB1Ymxpc2hEVE'
    '1GSABSC3B1Ymxpc2hEdG1mEjEKC2Fuc3dlcl9jYWxsGA8gASgLMg4uU2lwQW5zd2VyQ2FsbEgA'
    'UgphbnN3ZXJDYWxsEkAKEHB1Ymxpc2hfcHJlc2VuY2UYECABKAsyEy5TaXBQdWJsaXNoUHJlc2'
    'VuY2VIAFIPcHVibGlzaFByZXNlbmNlEi0KCXN1YnNjcmliZRgRIAEoCzINLlNpcFN1YnNjcmli'
    'ZUgAUglzdWJzY3JpYmUSMQoLc3dpdGNoX2hvbGQYEiABKAsyDi5TaXBTd2l0Y2hIb2xkSABSCn'
    'N3aXRjaEhvbGQSOgoOYmxpbmRfdHJhbnNmZXIYEyABKAsyES5TaXBCbGluZFRyYW5zZmVySABS'
    'DWJsaW5kVHJhbnNmZXJCCQoHY29tbWFuZA==');

@$core.Deprecated('Use sipRegisterDescriptor instead')
const SipRegister$json = {
  '1': 'SipRegister',
  '2': [
    {
      '1': 'password',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'password',
      '17': true
    },
    {'1': 'hash', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'hash', '17': true},
    {
      '1': 'display_name',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'displayName',
      '17': true
    },
    {
      '1': 'expires',
      '3': 4,
      '4': 1,
      '5': 13,
      '9': 3,
      '10': 'expires',
      '17': true
    },
  ],
  '8': [
    {'1': '_password'},
    {'1': '_hash'},
    {'1': '_display_name'},
    {'1': '_expires'},
  ],
};

/// Descriptor for `SipRegister`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipRegisterDescriptor = $convert.base64Decode(
    'CgtTaXBSZWdpc3RlchIfCghwYXNzd29yZBgBIAEoCUgAUghwYXNzd29yZIgBARIXCgRoYXNoGA'
    'IgASgJSAFSBGhhc2iIAQESJgoMZGlzcGxheV9uYW1lGAMgASgJSAJSC2Rpc3BsYXlOYW1liAEB'
    'Eh0KB2V4cGlyZXMYBCABKA1IA1IHZXhwaXJlc4gBAUILCglfcGFzc3dvcmRCBwoFX2hhc2hCDw'
    'oNX2Rpc3BsYXlfbmFtZUIKCghfZXhwaXJlcw==');

@$core.Deprecated('Use sipUnregisterDescriptor instead')
const SipUnregister$json = {
  '1': 'SipUnregister',
};

/// Descriptor for `SipUnregister`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipUnregisterDescriptor =
    $convert.base64Decode('Cg1TaXBVbnJlZ2lzdGVy');

@$core.Deprecated('Use sipMakeCallDescriptor instead')
const SipMakeCall$json = {
  '1': 'SipMakeCall',
  '2': [
    {'1': 'target', '3': 1, '4': 1, '5': 9, '10': 'target'},
    {
      '1': 'is_video',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'isVideo',
      '17': true
    },
  ],
  '8': [
    {'1': '_is_video'},
  ],
};

/// Descriptor for `SipMakeCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipMakeCallDescriptor = $convert.base64Decode(
    'CgtTaXBNYWtlQ2FsbBIWCgZ0YXJnZXQYASABKAlSBnRhcmdldBIeCghpc192aWRlbxgCIAEoCE'
    'gAUgdpc1ZpZGVviAEBQgsKCV9pc192aWRlbw==');

@$core.Deprecated('Use sipHangupCallDescriptor instead')
const SipHangupCall$json = {
  '1': 'SipHangupCall',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'code', '17': true},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'reason', '17': true},
  ],
  '8': [
    {'1': '_code'},
    {'1': '_reason'},
  ],
};

/// Descriptor for `SipHangupCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipHangupCallDescriptor = $convert.base64Decode(
    'Cg1TaXBIYW5ndXBDYWxsEhcKB2NhbGxfaWQYASABKAlSBmNhbGxJZBIXCgRjb2RlGAIgASgJSA'
    'BSBGNvZGWIAQESGwoGcmVhc29uGAMgASgJSAFSBnJlYXNvbogBAUIHCgVfY29kZUIJCgdfcmVh'
    'c29u');

@$core.Deprecated('Use sipPublishDTMFDescriptor instead')
const SipPublishDTMF$json = {
  '1': 'SipPublishDTMF',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
    {'1': 'dtmf_events', '3': 2, '4': 1, '5': 9, '10': 'dtmfEvents'},
    {
      '1': 'duration',
      '3': 3,
      '4': 1,
      '5': 2,
      '9': 0,
      '10': 'duration',
      '17': true
    },
    {
      '1': 'volume',
      '3': 4,
      '4': 1,
      '5': 13,
      '9': 1,
      '10': 'volume',
      '17': true
    },
  ],
  '8': [
    {'1': '_duration'},
    {'1': '_volume'},
  ],
};

/// Descriptor for `SipPublishDTMF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipPublishDTMFDescriptor = $convert.base64Decode(
    'Cg5TaXBQdWJsaXNoRFRNRhIXCgdjYWxsX2lkGAEgASgJUgZjYWxsSWQSHwoLZHRtZl9ldmVudH'
    'MYAiABKAlSCmR0bWZFdmVudHMSHwoIZHVyYXRpb24YAyABKAJIAFIIZHVyYXRpb26IAQESGwoG'
    'dm9sdW1lGAQgASgNSAFSBnZvbHVtZYgBAUILCglfZHVyYXRpb25CCQoHX3ZvbHVtZQ==');

@$core.Deprecated('Use sipAnswerCallDescriptor instead')
const SipAnswerCall$json = {
  '1': 'SipAnswerCall',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
    {
      '1': 'with_video',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'withVideo',
      '17': true
    },
  ],
  '8': [
    {'1': '_with_video'},
  ],
};

/// Descriptor for `SipAnswerCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipAnswerCallDescriptor = $convert.base64Decode(
    'Cg1TaXBBbnN3ZXJDYWxsEhcKB2NhbGxfaWQYASABKAlSBmNhbGxJZBIiCgp3aXRoX3ZpZGVvGA'
    'IgASgISABSCXdpdGhWaWRlb4gBAUINCgtfd2l0aF92aWRlbw==');

@$core.Deprecated('Use sipPublishPresenceDescriptor instead')
const SipPublishPresence$json = {
  '1': 'SipPublishPresence',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 9, '10': 'note'},
  ],
};

/// Descriptor for `SipPublishPresence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipPublishPresenceDescriptor = $convert
    .base64Decode('ChJTaXBQdWJsaXNoUHJlc2VuY2USEgoEbm90ZRgBIAEoCVIEbm90ZQ==');

@$core.Deprecated('Use sipSubscribeDescriptor instead')
const SipSubscribe$json = {
  '1': 'SipSubscribe',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 9, '10': 'event'},
    {'1': 'target', '3': 2, '4': 1, '5': 9, '10': 'target'},
    {
      '1': 'expires',
      '3': 3,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'expires',
      '17': true
    },
  ],
  '8': [
    {'1': '_expires'},
  ],
};

/// Descriptor for `SipSubscribe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipSubscribeDescriptor = $convert.base64Decode(
    'CgxTaXBTdWJzY3JpYmUSFAoFZXZlbnQYASABKAlSBWV2ZW50EhYKBnRhcmdldBgCIAEoCVIGdG'
    'FyZ2V0Eh0KB2V4cGlyZXMYAyABKA1IAFIHZXhwaXJlc4gBAUIKCghfZXhwaXJlcw==');

@$core.Deprecated('Use sipSwitchHoldDescriptor instead')
const SipSwitchHold$json = {
  '1': 'SipSwitchHold',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
  ],
};

/// Descriptor for `SipSwitchHold`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipSwitchHoldDescriptor = $convert
    .base64Decode('Cg1TaXBTd2l0Y2hIb2xkEhcKB2NhbGxfaWQYASABKAlSBmNhbGxJZA==');

@$core.Deprecated('Use sipBlindTransferDescriptor instead')
const SipBlindTransfer$json = {
  '1': 'SipBlindTransfer',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
    {'1': 'target', '3': 2, '4': 1, '5': 9, '10': 'target'},
  ],
};

/// Descriptor for `SipBlindTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipBlindTransferDescriptor = $convert.base64Decode(
    'ChBTaXBCbGluZFRyYW5zZmVyEhcKB2NhbGxfaWQYASABKAlSBmNhbGxJZBIWCgZ0YXJnZXQYAi'
    'ABKAlSBnRhcmdldA==');

@$core.Deprecated('Use sipControlResponseDescriptor instead')
const SipControlResponse$json = {
  '1': 'SipControlResponse',
  '2': [
    {'1': 'command_id', '3': 1, '4': 1, '5': 9, '10': 'commandId'},
    {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'error', '17': true},
    {
      '1': 'register_result',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.SipRegisterResult',
      '9': 0,
      '10': 'registerResult'
    },
    {
      '1': 'make_call_result',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.SipMakeCallResult',
      '9': 0,
      '10': 'makeCallResult'
    },
    {
      '1': 'hangup_call_result',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.SipHangupCallResult',
      '9': 0,
      '10': 'hangupCallResult'
    },
    {
      '1': 'presence_publish_result',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.SipPresencePublishResult',
      '9': 0,
      '10': 'presencePublishResult'
    },
    {
      '1': 'answer_call_result',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.SipAnswerCallResult',
      '9': 0,
      '10': 'answerCallResult'
    },
    {
      '1': 'subscribe_result',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.SipSubscribeResult',
      '9': 0,
      '10': 'subscribeResult'
    },
    {
      '1': 'notify_received',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.SipNotifyReceived',
      '9': 0,
      '10': 'notifyReceived'
    },
    {
      '1': 'switch_hold_result',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.SipSwitchHoldResult',
      '9': 0,
      '10': 'switchHoldResult'
    },
    {
      '1': 'blind_transfer_result',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.SipBlindTransferResult',
      '9': 0,
      '10': 'blindTransferResult'
    },
  ],
  '8': [
    {'1': 'result'},
    {'1': '_error'},
  ],
};

/// Descriptor for `SipControlResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipControlResponseDescriptor = $convert.base64Decode(
    'ChJTaXBDb250cm9sUmVzcG9uc2USHQoKY29tbWFuZF9pZBgBIAEoCVIJY29tbWFuZElkEhgKB3'
    'N1Y2Nlc3MYAiABKAhSB3N1Y2Nlc3MSGQoFZXJyb3IYAyABKAlIAVIFZXJyb3KIAQESPQoPcmVn'
    'aXN0ZXJfcmVzdWx0GAogASgLMhIuU2lwUmVnaXN0ZXJSZXN1bHRIAFIOcmVnaXN0ZXJSZXN1bH'
    'QSPgoQbWFrZV9jYWxsX3Jlc3VsdBgLIAEoCzISLlNpcE1ha2VDYWxsUmVzdWx0SABSDm1ha2VD'
    'YWxsUmVzdWx0EkQKEmhhbmd1cF9jYWxsX3Jlc3VsdBgMIAEoCzIULlNpcEhhbmd1cENhbGxSZX'
    'N1bHRIAFIQaGFuZ3VwQ2FsbFJlc3VsdBJTChdwcmVzZW5jZV9wdWJsaXNoX3Jlc3VsdBgNIAEo'
    'CzIZLlNpcFByZXNlbmNlUHVibGlzaFJlc3VsdEgAUhVwcmVzZW5jZVB1Ymxpc2hSZXN1bHQSRA'
    'oSYW5zd2VyX2NhbGxfcmVzdWx0GA4gASgLMhQuU2lwQW5zd2VyQ2FsbFJlc3VsdEgAUhBhbnN3'
    'ZXJDYWxsUmVzdWx0EkAKEHN1YnNjcmliZV9yZXN1bHQYDyABKAsyEy5TaXBTdWJzY3JpYmVSZX'
    'N1bHRIAFIPc3Vic2NyaWJlUmVzdWx0Ej0KD25vdGlmeV9yZWNlaXZlZBgRIAEoCzISLlNpcE5v'
    'dGlmeVJlY2VpdmVkSABSDm5vdGlmeVJlY2VpdmVkEkQKEnN3aXRjaF9ob2xkX3Jlc3VsdBgSIA'
    'EoCzIULlNpcFN3aXRjaEhvbGRSZXN1bHRIAFIQc3dpdGNoSG9sZFJlc3VsdBJNChVibGluZF90'
    'cmFuc2Zlcl9yZXN1bHQYEyABKAsyFy5TaXBCbGluZFRyYW5zZmVyUmVzdWx0SABSE2JsaW5kVH'
    'JhbnNmZXJSZXN1bHRCCAoGcmVzdWx0QggKBl9lcnJvcg==');

@$core.Deprecated('Use sipRegisterResultDescriptor instead')
const SipRegisterResult$json = {
  '1': 'SipRegisterResult',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 13, '10': 'code'},
    {'1': 'expires', '3': 2, '4': 1, '5': 13, '10': 'expires'},
    {
      '1': 'message',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `SipRegisterResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipRegisterResultDescriptor = $convert.base64Decode(
    'ChFTaXBSZWdpc3RlclJlc3VsdBISCgRjb2RlGAEgASgNUgRjb2RlEhgKB2V4cGlyZXMYAiABKA'
    '1SB2V4cGlyZXMSHQoHbWVzc2FnZRgDIAEoCUgAUgdtZXNzYWdliAEBQgoKCF9tZXNzYWdl');

@$core.Deprecated('Use sipMakeCallResultDescriptor instead')
const SipMakeCallResult$json = {
  '1': 'SipMakeCallResult',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
  ],
};

/// Descriptor for `SipMakeCallResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipMakeCallResultDescriptor = $convert.base64Decode(
    'ChFTaXBNYWtlQ2FsbFJlc3VsdBIXCgdjYWxsX2lkGAEgASgJUgZjYWxsSWQ=');

@$core.Deprecated('Use sipPresencePublishResultDescriptor instead')
const SipPresencePublishResult$json = {
  '1': 'SipPresencePublishResult',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 13, '10': 'code'},
    {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `SipPresencePublishResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipPresencePublishResultDescriptor =
    $convert.base64Decode(
        'ChhTaXBQcmVzZW5jZVB1Ymxpc2hSZXN1bHQSEgoEY29kZRgBIAEoDVIEY29kZRIdCgdtZXNzYW'
        'dlGAIgASgJSABSB21lc3NhZ2WIAQFCCgoIX21lc3NhZ2U=');

@$core.Deprecated('Use sipHangupCallResultDescriptor instead')
const SipHangupCallResult$json = {
  '1': 'SipHangupCallResult',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 13, '10': 'code'},
    {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `SipHangupCallResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipHangupCallResultDescriptor = $convert.base64Decode(
    'ChNTaXBIYW5ndXBDYWxsUmVzdWx0EhIKBGNvZGUYASABKA1SBGNvZGUSHQoHbWVzc2FnZRgCIA'
    'EoCUgAUgdtZXNzYWdliAEBQgoKCF9tZXNzYWdl');

@$core.Deprecated('Use sipAnswerCallResultDescriptor instead')
const SipAnswerCallResult$json = {
  '1': 'SipAnswerCallResult',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 13, '10': 'code'},
    {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `SipAnswerCallResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipAnswerCallResultDescriptor = $convert.base64Decode(
    'ChNTaXBBbnN3ZXJDYWxsUmVzdWx0EhIKBGNvZGUYASABKA1SBGNvZGUSHQoHbWVzc2FnZRgCIA'
    'EoCUgAUgdtZXNzYWdliAEBQgoKCF9tZXNzYWdl');

@$core.Deprecated('Use sipSwitchHoldResultDescriptor instead')
const SipSwitchHoldResult$json = {
  '1': 'SipSwitchHoldResult',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 13, '10': 'code'},
    {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `SipSwitchHoldResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipSwitchHoldResultDescriptor = $convert.base64Decode(
    'ChNTaXBTd2l0Y2hIb2xkUmVzdWx0EhIKBGNvZGUYASABKA1SBGNvZGUSHQoHbWVzc2FnZRgCIA'
    'EoCUgAUgdtZXNzYWdliAEBQgoKCF9tZXNzYWdl');

@$core.Deprecated('Use sipNotifyReceivedDescriptor instead')
const SipNotifyReceived$json = {
  '1': 'SipNotifyReceived',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 9, '10': 'event'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'content_type', '3': 3, '4': 1, '5': 9, '10': 'contentType'},
  ],
};

/// Descriptor for `SipNotifyReceived`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipNotifyReceivedDescriptor = $convert.base64Decode(
    'ChFTaXBOb3RpZnlSZWNlaXZlZBIUCgVldmVudBgBIAEoCVIFZXZlbnQSEgoEdGV4dBgCIAEoCV'
    'IEdGV4dBIhCgxjb250ZW50X3R5cGUYAyABKAlSC2NvbnRlbnRUeXBl');

@$core.Deprecated('Use sipSubscribeResultDescriptor instead')
const SipSubscribeResult$json = {
  '1': 'SipSubscribeResult',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 9, '10': 'state'},
    {'1': 'code', '3': 2, '4': 1, '5': 13, '10': 'code'},
    {
      '1': 'message',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `SipSubscribeResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipSubscribeResultDescriptor = $convert.base64Decode(
    'ChJTaXBTdWJzY3JpYmVSZXN1bHQSFAoFc3RhdGUYASABKAlSBXN0YXRlEhIKBGNvZGUYAiABKA'
    '1SBGNvZGUSHQoHbWVzc2FnZRgDIAEoCUgAUgdtZXNzYWdliAEBQgoKCF9tZXNzYWdl');

@$core.Deprecated('Use sipBlindTransferResultDescriptor instead')
const SipBlindTransferResult$json = {
  '1': 'SipBlindTransferResult',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 9, '10': 'state'},
    {'1': 'code', '3': 2, '4': 1, '5': 13, '10': 'code'},
    {
      '1': 'message',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `SipBlindTransferResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipBlindTransferResultDescriptor = $convert.base64Decode(
    'ChZTaXBCbGluZFRyYW5zZmVyUmVzdWx0EhQKBXN0YXRlGAEgASgJUgVzdGF0ZRISCgRjb2RlGA'
    'IgASgNUgRjb2RlEh0KB21lc3NhZ2UYAyABKAlIAFIHbWVzc2FnZYgBAUIKCghfbWVzc2FnZQ==');
