import 'package:flutter/material.dart';

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
