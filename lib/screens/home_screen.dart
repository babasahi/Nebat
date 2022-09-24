import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nebat/components/home_screen_components.dart';
import 'package:nebat/screens/plants_database_screen.dart';
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
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const PlantsDatabasePage())));
            }),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.list),
            ),
          )
        ],
      ),
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: Colors.greenAccent,
        ),
        inAsyncCall: Provider.of<IdentificationProvider>(context).isLoading,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PlantNameWidget(),
              const CameraWidget(),
              Provider.of<IdentificationProvider>(context).state ==
                      IdentificationState.identified
                  ? const SizedBox()
                  : const IdentificationButton(),
              const SuggestionsWidget(),
              Provider.of<IdentificationProvider>(context).state ==
                      IdentificationState.identified
                  ? const IdentificationButton()
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
