import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_classifier/blocks/detection/provider.dart';
import 'package:trash_classifier/blocks/auth/provider.dart' as local_auth;
import 'package:trash_classifier/config.dart';
import 'package:trash_classifier/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:trash_classifier/services/auth_service.dart';
import 'package:trash_classifier/services/firestore_service.dart';
import 'blocks/auth/repository.dart';
import 'generated/l10n.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authService = AuthService();
  final firestoreService = FirestoreService();
  final authRepository = AuthRepository(authService, firestoreService);

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DetectionProvider()),
          ChangeNotifierProvider(create: (_) => local_auth.AuthProvider(authRepository)),
        ],
        child: const TrashClassifier()
      )
  );
}

class TrashClassifier extends StatelessWidget {
  const TrashClassifier({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConfig.appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: AppConfig.isProd ? false : true,
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.home,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('uk'), // Ukrainian
        ],
        locale: const Locale('uk'),
      );
  }
}