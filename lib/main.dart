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

              String apikey =
                  'nGFgz6bm5mpkvgOVdhCdU31WjIJHEbGAOEEahX3klSkxcnsmpj';
              String uri = 'https://plant.id/api/v2';
              Uri url = Uri(
                scheme: 'http',
                host: 'my-api.plantnet.org',
                path: uri,
              );
              try {
                http.Response response = await http.get(
                  url,
                );
                print('this is code : ${response.body}');
              } catch (e) {
                print(e);
              }
            },
            child: const SizedBox(height: 40, child: Text('Get plant name'))),
      )),
    );
  }
}
