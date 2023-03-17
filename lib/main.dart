import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_sqflite_provider/ui/first_page/f_page.dart';
import 'di.dart' as dependency_injection;
import 'controller/provider_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injection.init();

  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) => dependency_injection.getIt<MyProvider>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
