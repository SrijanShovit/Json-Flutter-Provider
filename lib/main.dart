import 'package:flutter/material.dart';
import 'package:jsonwithprovider/models/newsdata.dart';
import 'package:jsonwithprovider/stories.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        //everything under this will be notified when create (NewsData) changes
        create: (context) => NewsData(),
        builder: (context, child) {
          return StoriesPage();
        },
      ),
    );
  }
}
