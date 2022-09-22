import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nebat/components/home_screen_components.dart';
import 'package:nebat/models/models.dart';
import 'package:nebat/services/providers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: Colors.greenAccent,
        ),
        inAsyncCall: Provider.of<IdentificationProvider>(context).isLoading,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              PlantNameWidget(),
              CameraWidget(),
              IdentificationButton(),
              SuggestionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class SuggestionsWidget extends StatefulWidget {
  const SuggestionsWidget({super.key});

  @override
  State<SuggestionsWidget> createState() => _SuggestionsWidgetState();
}

class _SuggestionsWidgetState extends State<SuggestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<IdentificationProvider>(context).plants.isNotEmpty
        ? Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                elevation: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 42),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Provider.of<IdentificationProvider>(context,
                                  listen: false)
                              .plants
                              .isEmpty
                          ? 0
                          : Provider.of<IdentificationProvider>(context,
                                  listen: false)
                              .plants
                              .length,
                      itemBuilder: (context, index) {
                        List<Plant> plants =
                            Provider.of<IdentificationProvider>(context).plants;
                        return PlantSuggestionWidget(plant: plants[index]);
                      }),
                ),
              ),
            ),
          )
        : const SizedBox(
            height: 2,
          );
  }
}

class PlantSuggestionWidget extends StatelessWidget {
  const PlantSuggestionWidget({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        height: 24,
        decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.4)),
        padding: const EdgeInsets.all(4),
        child: Text(plant.plantName));
  }
}
