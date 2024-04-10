import 'dart:async';
// import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:obs_status/common/logging/logger.dart';
import 'package:obs_status/presentation/design_system/ui_plattform.dart';

// Helper Function to handle errors easily
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
 


  // Run app in zone to catch application errors
  await runZonedGuarded(
    () async {
      // Test with slow animations
      // timeDilation = 3.0;

      // Setup Logger
      setupLogger(level: UiPlatform.isDebugMode ? Level.INFO : Level.WARNING);
      Logger.root.info('main: visomat app starting');


      // Makes sure plugins are initialized
      // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      // System chrome
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      if (UiPlatform.isAndroid) {
        // Edge to Edge is not default in android so it must be enabled
        // https://github.com/flutter/flutter/issues/86248
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
      }

      // Initialize Riverpod
      final container = ProviderContainer();

      return runApp(
        UncontrolledProviderScope(
          container: container,
          // observers: [RiverpodLogger()],
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) {
     
    },
  );
}
