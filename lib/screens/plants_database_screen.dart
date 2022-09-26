import 'package:flutter/material.dart';
import 'package:nebat/constants.dart';
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
                  return PlantWidget(
                      plant: Plant.fromJson(
                          snapshot.data![index] as Map<String, dynamic>));
                }));
          } else {
            return const Center(child: Text('No Data !'));
          }
        }),
      )),
    );
  }
}

class PlantWidget extends StatelessWidget {
  const PlantWidget({Key? key, required this.plant}) : super(key: key);
  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: const BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              Text(
                plant.plantName,
                style: kPlantNameStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
