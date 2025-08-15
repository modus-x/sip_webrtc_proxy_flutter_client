import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'pages/connect.dart';
import 'utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  final format = DateFormat('HH:mm:ss');
  // configure logs for debugging
  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((record) {
    print('${format.format(record.time)}: ${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();
  /*if (lkPlatformIsDesktop()) {
    await FlutterWindowClose.setWindowShouldCloseHandler(() async {
      await onWindowShouldClose?.call();
      return true;
    });
  }*/

  /// for livestreaming app, you can initialize the bypassVoiceProcessing = true
  /// here to get better audio quality
  ///
  /// await LiveKitClient.initialize(
  ///  bypassVoiceProcessing: lkPlatformIsMobile(),
  /// );
  runApp(const LiveKitExampleApp());
}

class LiveKitExampleApp extends StatefulWidget {
  const LiveKitExampleApp({super.key});

  @override
  State<LiveKitExampleApp> createState() => _LiveKitExampleAppState();
}

class _LiveKitExampleAppState extends State<LiveKitExampleApp> {
  String? _version;

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'WebRTC Демо',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return AppBackground(
            child: child ?? const SizedBox(),
            version: _version,
          );
        },
        theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
        home: const ConnectPage(),
      );
}

class AppBackground extends StatelessWidget {
  final Widget child;
  final String? version;
  const AppBackground({required this.child, this.version, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // ── gradient layer ──
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF2084D8), Color(0xFF004591)],
            ),
          ),
        ),

        // ── waves layer ──
        CustomPaint(painter: _WavesPainter()),

        // ── actual page ──
        SafeArea(child: child),

        // ── persistent overlays ──
        Positioned(
          left: 24,
          top: 32,
          child: SvgPicture.asset(
            'images/master_logo.svg', // Path from your `pubspec.yaml`
            fit: BoxFit.contain,
            color: Colors.white, // Change the color of the SVG
            height: 50,
          ),
        ),
        Positioned(
          right: 24,
          bottom: 12,
          child: Text(
            'WebRTC-телефон v.${version ?? "..."}, ООО “Фирма СВЕТЕЦ”',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white.withOpacity(.7)),
          ),
        ),
      ],
    );
  }
}

/// Concentric circles painter (exactly what you used on the login page)
class _WavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(-size.width * .25, -size.height * .25);
    final radii = [size.width * .75, size.width * 1.10, size.width * 1.45];

    for (final r in radii) {
      canvas.drawCircle(
        center,
        r,
        Paint()
          ..color = Colors.white.withOpacity(.05)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
