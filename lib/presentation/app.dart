import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:obs_status/common/device/app_lifecycle.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(
      AppLifecycleObserver(
        resumeCallBack: () async {
          Logger.root.info('AppLifecycleObserver: App has resumed');

        },
        suspendingCallBack: () async {
          Logger.root.info('AppLifecycleObserver: App has paused');
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'obs_status',
        themeMode: ThemeMode.system,
        builder: (context, child) {
          // limit text scale factor
          final MediaQueryData mediaQuery = MediaQuery.of(context);
          final textScaleFactor = mediaQuery.textScaler.clamp(minScaleFactor: 0.9, maxScaleFactor: 1.1);
          return MediaQuery(
            data: mediaQuery.copyWith(textScaler: textScaleFactor),
            child: child ?? const SizedBox.shrink(),
          );
        },
      
    );
  }
}
