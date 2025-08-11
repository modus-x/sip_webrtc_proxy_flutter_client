import 'package:livekit_example/control_room_api/client_index.dart';
import 'package:livekit_example/config.dart';

final sipControlRoomApi = Api.create(baseUrl: Uri.parse(controlRoomApiBaseUrl));
