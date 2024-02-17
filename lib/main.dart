import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveflutter/data/adapter/car_adapter.dart';
import 'package:hiveflutter/ui/hive_first_example.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
   await  Hive.openBox('vegetable');
    Hive.registerAdapter(CarAdapter());
    await  Hive.openBox('gmShowRoom');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HiveFirstExample(),
    );
  }
}
