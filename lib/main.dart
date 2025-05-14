import 'package:codebase_assignment/core/navigation/app_navigator.dart';
import 'package:codebase_assignment/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: RouteNames.landing,
      onGenerateRoute: AppNavigator.generateRoutes,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}
