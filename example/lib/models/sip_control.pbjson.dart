// This is a generated file - do not edit.
//
// Generated from sip_control.proto.

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
      '6': '.sip.SipRegister',
      '9': 0,
      '10': 'register'
    },
    {
      '1': 'unregister',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.sip.SipUnregister',
      '9': 0,
      '10': 'unregister'
    },
    {
      '1': 'make_call',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.sip.SipMakeCall',
      '9': 0,
      '10': 'makeCall'
    },
    {
      '1': 'hangup_call',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.sip.SipHangupCall',
      '9': 0,
      '10': 'hangupCall'
    },
    {
      '1': 'publish_dtmf',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.sip.SipPublishDTMF',
      '9': 0,
      '10': 'publishDtmf'
    },
    {
      '1': 'answer_call',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.sip.SipAnswerCall',
      '9': 0,
      '10': 'answerCall'
    },
    {
      '1': 'publish_presence',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.sip.SipPublishPresence',
      '9': 0,
      '10': 'publishPresence'
    },
    {
      '1': 'subscribe',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.sip.SipSubscribe',
      '9': 0,
      '10': 'subscribe'
    },
    {
      '1': 'transfer_call',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.sip.SipTransferCall',
      '9': 0,
      '10': 'transferCall'
    },
  ],
  '8': [
    {'1': 'command'},
  ],
};

/// Descriptor for `SipControlCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipControlCommandDescriptor = $convert.base64Decode(
    'ChFTaXBDb250cm9sQ29tbWFuZBIdCgpjb21tYW5kX2lkGAEgASgJUgljb21tYW5kSWQSLgoIcm'
    'VnaXN0ZXIYCiABKAsyEC5zaXAuU2lwUmVnaXN0ZXJIAFIIcmVnaXN0ZXISNAoKdW5yZWdpc3Rl'
    'chgLIAEoCzISLnNpcC5TaXBVbnJlZ2lzdGVySABSCnVucmVnaXN0ZXISLwoJbWFrZV9jYWxsGA'
    'wgASgLMhAuc2lwLlNpcE1ha2VDYWxsSABSCG1ha2VDYWxsEjUKC2hhbmd1cF9jYWxsGA0gASgL'
    'MhIuc2lwLlNpcEhhbmd1cENhbGxIAFIKaGFuZ3VwQ2FsbBI4CgxwdWJsaXNoX2R0bWYYDiABKA'
    'syEy5zaXAuU2lwUHVibGlzaERUTUZIAFILcHVibGlzaER0bWYSNQoLYW5zd2VyX2NhbGwYDyAB'
    'KAsyEi5zaXAuU2lwQW5zd2VyQ2FsbEgAUgphbnN3ZXJDYWxsEkQKEHB1Ymxpc2hfcHJlc2VuY2'
    'UYECABKAsyFy5zaXAuU2lwUHVibGlzaFByZXNlbmNlSABSD3B1Ymxpc2hQcmVzZW5jZRIxCglz'
    'dWJzY3JpYmUYESABKAsyES5zaXAuU2lwU3Vic2NyaWJlSABSCXN1YnNjcmliZRI7Cg10cmFuc2'
    'Zlcl9jYWxsGBIgASgLMhQuc2lwLlNpcFRyYW5zZmVyQ2FsbEgAUgx0cmFuc2ZlckNhbGxCCQoH'
    'Y29tbWFuZA==');

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
    {'1': 'uri', '3': 1, '4': 1, '5': 9, '10': 'uri'},
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
    'CgtTaXBNYWtlQ2FsbBIQCgN1cmkYASABKAlSA3VyaRIeCghpc192aWRlbxgCIAEoCEgAUgdpc1'
    'ZpZGVviAEBQgsKCV9pc192aWRlbw==');

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
    {'1': 'method', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'method', '17': true},
  ],
  '8': [
    {'1': '_duration'},
    {'1': '_volume'},
    {'1': '_method'},
  ],
};

/// Descriptor for `SipPublishDTMF`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipPublishDTMFDescriptor = $convert.base64Decode(
    'Cg5TaXBQdWJsaXNoRFRNRhIXCgdjYWxsX2lkGAEgASgJUgZjYWxsSWQSHwoLZHRtZl9ldmVudH'
    'MYAiABKAlSCmR0bWZFdmVudHMSHwoIZHVyYXRpb24YAyABKAJIAFIIZHVyYXRpb26IAQESGwoG'
    'dm9sdW1lGAQgASgNSAFSBnZvbHVtZYgBARIbCgZtZXRob2QYBSABKAlIAlIGbWV0aG9kiAEBQg'
    'sKCV9kdXJhdGlvbkIJCgdfdm9sdW1lQgkKB19tZXRob2Q=');

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
    {
      '1': 'headers',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.sip.SipAnswerCall.HeadersEntry',
      '10': 'headers'
    },
    {
      '1': 'response_code',
      '3': 4,
      '4': 1,
      '5': 13,
      '9': 1,
      '10': 'responseCode',
      '17': true
    },
  ],
  '3': [SipAnswerCall_HeadersEntry$json],
  '8': [
    {'1': '_with_video'},
    {'1': '_response_code'},
  ],
};

@$core.Deprecated('Use sipAnswerCallDescriptor instead')
const SipAnswerCall_HeadersEntry$json = {
  '1': 'HeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SipAnswerCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipAnswerCallDescriptor = $convert.base64Decode(
    'Cg1TaXBBbnN3ZXJDYWxsEhcKB2NhbGxfaWQYASABKAlSBmNhbGxJZBIiCgp3aXRoX3ZpZGVvGA'
    'IgASgISABSCXdpdGhWaWRlb4gBARI5CgdoZWFkZXJzGAMgAygLMh8uc2lwLlNpcEFuc3dlckNh'
    'bGwuSGVhZGVyc0VudHJ5UgdoZWFkZXJzEigKDXJlc3BvbnNlX2NvZGUYBCABKA1IAVIMcmVzcG'
    '9uc2VDb2RliAEBGjoKDEhlYWRlcnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgC'
    'IAEoCVIFdmFsdWU6AjgBQg0KC193aXRoX3ZpZGVvQhAKDl9yZXNwb25zZV9jb2Rl');

@$core.Deprecated('Use sipPublishPresenceDescriptor instead')
const SipPublishPresence$json = {
  '1': 'SipPublishPresence',
  '2': [
    {'1': 'note', '3': 1, '4': 1, '5': 9, '10': 'note'},
    {'1': 'state', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'state', '17': true},
    {
      '1': 'contact',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'contact',
      '17': true
    },
    {
      '1': 'expires',
      '3': 4,
      '4': 1,
      '5': 13,
      '9': 2,
      '10': 'expires',
      '17': true
    },
    {
      '1': 'attributes',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.sip.SipPublishPresence.AttributesEntry',
      '10': 'attributes'
    },
  ],
  '3': [SipPublishPresence_AttributesEntry$json],
  '8': [
    {'1': '_state'},
    {'1': '_contact'},
    {'1': '_expires'},
  ],
};

@$core.Deprecated('Use sipPublishPresenceDescriptor instead')
const SipPublishPresence_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SipPublishPresence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipPublishPresenceDescriptor = $convert.base64Decode(
    'ChJTaXBQdWJsaXNoUHJlc2VuY2USEgoEbm90ZRgBIAEoCVIEbm90ZRIZCgVzdGF0ZRgCIAEoCU'
    'gAUgVzdGF0ZYgBARIdCgdjb250YWN0GAMgASgJSAFSB2NvbnRhY3SIAQESHQoHZXhwaXJlcxgE'
    'IAEoDUgCUgdleHBpcmVziAEBEkcKCmF0dHJpYnV0ZXMYBSADKAsyJy5zaXAuU2lwUHVibGlzaF'
    'ByZXNlbmNlLkF0dHJpYnV0ZXNFbnRyeVIKYXR0cmlidXRlcxo9Cg9BdHRyaWJ1dGVzRW50cnkS'
    'EAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUIICgZfc3RhdGVCCg'
    'oIX2NvbnRhY3RCCgoIX2V4cGlyZXM=');

@$core.Deprecated('Use sipSubscribeDescriptor instead')
const SipSubscribe$json = {
  '1': 'SipSubscribe',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 9, '10': 'event'},
    {'1': 'target_uri', '3': 2, '4': 1, '5': 9, '10': 'targetUri'},
    {
      '1': 'expires',
      '3': 3,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'expires',
      '17': true
    },
    {'1': 'accept', '3': 4, '4': 3, '5': 9, '10': 'accept'},
    {
      '1': 'headers',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.sip.SipSubscribe.HeadersEntry',
      '10': 'headers'
    },
  ],
  '3': [SipSubscribe_HeadersEntry$json],
  '8': [
    {'1': '_expires'},
  ],
};

@$core.Deprecated('Use sipSubscribeDescriptor instead')
const SipSubscribe_HeadersEntry$json = {
  '1': 'HeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SipSubscribe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipSubscribeDescriptor = $convert.base64Decode(
    'CgxTaXBTdWJzY3JpYmUSFAoFZXZlbnQYASABKAlSBWV2ZW50Eh0KCnRhcmdldF91cmkYAiABKA'
    'lSCXRhcmdldFVyaRIdCgdleHBpcmVzGAMgASgNSABSB2V4cGlyZXOIAQESFgoGYWNjZXB0GAQg'
    'AygJUgZhY2NlcHQSOAoHaGVhZGVycxgFIAMoCzIeLnNpcC5TaXBTdWJzY3JpYmUuSGVhZGVyc0'
    'VudHJ5UgdoZWFkZXJzGjoKDEhlYWRlcnNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1'
    'ZRgCIAEoCVIFdmFsdWU6AjgBQgoKCF9leHBpcmVz');

@$core.Deprecated('Use sipTransferCallDescriptor instead')
const SipTransferCall$json = {
  '1': 'SipTransferCall',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
    {'1': 'target_uri', '3': 2, '4': 1, '5': 9, '10': 'targetUri'},
    {
      '1': 'transfer_type',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'transferType',
      '17': true
    },
    {
      '1': 'consultation_call_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'consultationCallId',
      '17': true
    },
  ],
  '8': [
    {'1': '_transfer_type'},
    {'1': '_consultation_call_id'},
  ],
};

/// Descriptor for `SipTransferCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipTransferCallDescriptor = $convert.base64Decode(
    'Cg9TaXBUcmFuc2ZlckNhbGwSFwoHY2FsbF9pZBgBIAEoCVIGY2FsbElkEh0KCnRhcmdldF91cm'
    'kYAiABKAlSCXRhcmdldFVyaRIoCg10cmFuc2Zlcl90eXBlGAMgASgJSABSDHRyYW5zZmVyVHlw'
    'ZYgBARI1ChRjb25zdWx0YXRpb25fY2FsbF9pZBgEIAEoCUgBUhJjb25zdWx0YXRpb25DYWxsSW'
    'SIAQFCEAoOX3RyYW5zZmVyX3R5cGVCFwoVX2NvbnN1bHRhdGlvbl9jYWxsX2lk');

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
      '6': '.sip.SipRegisterResult',
      '9': 0,
      '10': 'registerResult'
    },
    {
      '1': 'call_result',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.sip.SipCallResult',
      '9': 0,
      '10': 'callResult'
    },
    {
      '1': 'presence_result',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.sip.SipPresenceResult',
      '9': 0,
      '10': 'presenceResult'
    },
    {
      '1': 'subscribe_result',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.sip.SipSubscribeResult',
      '9': 0,
      '10': 'subscribeResult'
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
    'N1Y2Nlc3MYAiABKAhSB3N1Y2Nlc3MSGQoFZXJyb3IYAyABKAlIAVIFZXJyb3KIAQESQQoPcmVn'
    'aXN0ZXJfcmVzdWx0GAogASgLMhYuc2lwLlNpcFJlZ2lzdGVyUmVzdWx0SABSDnJlZ2lzdGVyUm'
    'VzdWx0EjUKC2NhbGxfcmVzdWx0GAsgASgLMhIuc2lwLlNpcENhbGxSZXN1bHRIAFIKY2FsbFJl'
    'c3VsdBJBCg9wcmVzZW5jZV9yZXN1bHQYDCABKAsyFi5zaXAuU2lwUHJlc2VuY2VSZXN1bHRIAF'
    'IOcHJlc2VuY2VSZXN1bHQSRAoQc3Vic2NyaWJlX3Jlc3VsdBgNIAEoCzIXLnNpcC5TaXBTdWJz'
    'Y3JpYmVSZXN1bHRIAFIPc3Vic2NyaWJlUmVzdWx0QggKBnJlc3VsdEIICgZfZXJyb3I=');

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

@$core.Deprecated('Use sipCallResultDescriptor instead')
const SipCallResult$json = {
  '1': 'SipCallResult',
  '2': [
    {'1': 'call_id', '3': 1, '4': 1, '5': 9, '10': 'callId'},
  ],
};

/// Descriptor for `SipCallResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipCallResultDescriptor = $convert
    .base64Decode('Cg1TaXBDYWxsUmVzdWx0EhcKB2NhbGxfaWQYASABKAlSBmNhbGxJZA==');

@$core.Deprecated('Use sipPresenceResultDescriptor instead')
const SipPresenceResult$json = {
  '1': 'SipPresenceResult',
  '2': [
    {'1': 'state', '3': 1, '4': 1, '5': 9, '10': 'state'},
    {'1': 'expires', '3': 2, '4': 1, '5': 13, '10': 'expires'},
  ],
};

/// Descriptor for `SipPresenceResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipPresenceResultDescriptor = $convert.base64Decode(
    'ChFTaXBQcmVzZW5jZVJlc3VsdBIUCgVzdGF0ZRgBIAEoCVIFc3RhdGUSGAoHZXhwaXJlcxgCIA'
    'EoDVIHZXhwaXJlcw==');

@$core.Deprecated('Use sipSubscribeResultDescriptor instead')
const SipSubscribeResult$json = {
  '1': 'SipSubscribeResult',
  '2': [
    {'1': 'subscription_id', '3': 1, '4': 1, '5': 9, '10': 'subscriptionId'},
    {'1': 'state', '3': 2, '4': 1, '5': 9, '10': 'state'},
    {'1': 'expires', '3': 3, '4': 1, '5': 13, '10': 'expires'},
  ],
};

/// Descriptor for `SipSubscribeResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sipSubscribeResultDescriptor = $convert.base64Decode(
    'ChJTaXBTdWJzY3JpYmVSZXN1bHQSJwoPc3Vic2NyaXB0aW9uX2lkGAEgASgJUg5zdWJzY3JpcH'
    'Rpb25JZBIUCgVzdGF0ZRgCIAEoCVIFc3RhdGUSGAoHZXhwaXJlcxgDIAEoDVIHZXhwaXJlcw==');
