import 'package:flutter/material.dart';
import 'package:nebat/models/models.dart';
import 'package:nebat/services/providers.dart';
import 'package:provider/provider.dart';

class PlantsDatabasePage extends StatefulWidget {
  const PlantsDatabasePage({super.key});

  @override
  State<PlantsDatabasePage> createState() => _PlantsDatabasePageState();
}

class _PlantsDatabasePageState extends State<PlantsDatabasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: FutureBuilder<List<Plant>>(
        initialData: const [],
        future: Provider.of<PlantsDatabaseProvider>(context, listen: false)
            .plants(),
        builder: ((context, AsyncSnapshot<List<Plant>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return const Text('data');
                }));
          } else {
            return const Text('data');
          }
        }),
      )),
    );
  }
}
