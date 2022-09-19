// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: GestureDetector(
            onTap: () async {
              //TODO:GET PLANT NAME

              String apikey = '2b10sAT8QNrmynlEHhcEpNu';
              String uri =
                  'my-api.plantnet.org/v2/identify/all?api-key=2b10sAT8QNrmynlEHhcEpNu&images=https%3A%2F%2Fmy.plantnet.org%2Fimages%2Fimage_1.jpeg&images=https%3A%2F%2Fmy.plantnet.org%2Fimages%2Fimage_2.jpeg&organs=flower&organs=leaf';
              Uri url = Uri(
                scheme: 'http',
                host: 'my-api.plantnet.org',
                path: uri,
              );
              http.Response response = await http.get(url);
              print('this is code : ${response.body}');
            },
            child: const SizedBox(height: 40, child: Text('Get plant name'))),
      )),
    );
  }
}
