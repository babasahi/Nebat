import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nebat/components/home_screen_components.dart';
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
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                PlantNameWidget(),
                CameraWidget(),
                IdentificationButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
