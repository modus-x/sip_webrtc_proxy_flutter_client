import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:livekit_example/pages/prejoin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config.dart';
import '../exts.dart';

class ConnectPage extends StatefulWidget {
  //
  const ConnectPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  final formKey = GlobalKey<FormState>();

  final _username = TextEditingController();
  final _password = TextEditingController();
  final _domain = TextEditingController(text: '10.49.122.17');

  bool _busy = false;

  bool pressedEnter = false;

  @override
  void initState() {
    super.initState();
    if (lkPlatformIs(PlatformType.android)) {
      _checkPermissions();
    }

    if (lkPlatformIsMobile()) {
      LiveKitClient.initialize(bypassVoiceProcessing: true);
    }

    _password.addListener(() {
      pressedEnter = false;
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _domain.dispose();
    super.dispose();
  }

  Future<void> _checkPermissions() async {
    var status = await Permission.microphone.request();
    if (status.isPermanentlyDenied) {
      print('Microphone Permission disabled');
    }
  }

  Future<void> _connect(BuildContext ctx) async {
    //
    try {
      setState(() {
        _busy = true;
      });

      final token = await _generateToken();

      await Navigator.push<void>(
        ctx,
        MaterialPageRoute(
            builder: (_) => PreJoinPage(
                  args: JoinArgs(
                    url: livekitServer,
                    token: token['token'],
                  ),
                )),
      );
    } catch (error) {
      print('Could not connect $error');
      await ctx.showErrorDialog(error);
    } finally {
      setState(() {
        _busy = false;
      });
    }
  }

  // generate token for joining to room "username"
  Future<Map<String, dynamic>> _generateToken() async {
    try {
      var request =
          livekitServerSdk.replace(path: '/server_sdk/generate_token',
          queryParameters: {
            'username': _username.text,
            'password': _password.text,
            'domain': _domain.text,
          });

      final response = await http.get(request);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to generate token: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to generate token: $e');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _username,
                    decoration: const InputDecoration(
                      labelText: 'Имя пользователя',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _password,
                    decoration: const InputDecoration(
                      labelText: 'Пароль',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _domain,
                    decoration: const InputDecoration(
                      labelText: 'Домен',
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _busy ? null : () => _connect(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_busy)
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        const Text('Войти'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
