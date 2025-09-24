import 'package:flutter/material.dart';
import 'package:trash_classifier/config.dart';
import 'package:trash_classifier/routes.dart';

void main() {
  runApp(const TrashClassifier());
}

class TrashClassifier extends StatelessWidget {
  const TrashClassifier({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash Classifier',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: AppConfig.isProd ? false : true,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}