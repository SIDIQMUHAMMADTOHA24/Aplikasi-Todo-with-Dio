import 'package:todo_list/state_util.dart';
import 'package:flutter/material.dart';
import 'module/dasboard/view/dasboard_view.dart';
import 'module/edit_data/view/edit_data_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {'/edit': (p0) => EditDataView()},
        navigatorKey: Get.navigatorKey,
        theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        home: DasboardView());
  }
}
