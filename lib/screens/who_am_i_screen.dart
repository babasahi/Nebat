import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nebat/constants.dart';
import 'package:url_launcher/url_launcher.dart';

const String part1 =
    'Babe Saleh is a computer programmer who decided to start a software startup. graduated from Laayoune High School., with a baccalaureate in Natural Sciences and currently majoring in Computer Engineering at the Higher School of Technology (EST) in Casablanca.';
const String part2 =
    'He has an aspiring vision in software development business particularly app development. And in 04/10/2021  he launched his first app, Telmidi.';
const String part3 =
    'Telmidi is a platform that helps high school students to master their curriculum in an easy and interactive way, it\'s free and always will be free.';
const String part4 =
    'If you are a graphic designer, consider joining us by emailing: telmidi.contact@gmail.com.';
String part5 =
    'All images and vector materials used in this software, are attributed to vecteezy.com and  flaticons.com ';

class WhoAreWePage extends StatefulWidget {
  const WhoAreWePage({super.key});

  @override
  State<WhoAreWePage> createState() => _WhoAreWePageState();
}

class _WhoAreWePageState extends State<WhoAreWePage> {
  final String _landingPage = "https://mohamed-abdelahi-haibelty.github.io";
  final String _email =
      "mailto:<babesalehmahfoud@gmail.com>?subject=Hello Telmidi&body=Hello";
  final String _linkedin = 'linkedin.com/in/babe-saleh-mahfoud-519b52200/';
  final String _facebook = "";
  final String _call = "tel:+222 31 04 81 16";
  Future<void> sendEmail(String type) async {
    switch (type) {
      case "website":
        await canLaunchUrl(Uri.parse(_landingPage))
            ? launchUrl(Uri.parse(_landingPage))
            : print('error');

        break;
      case "email":
        await launchUrl(Uri.parse(_email));
        break;

      case "facebook":
        await launchUrl(Uri.parse(_facebook));
        break;

      case "call":
        await launchUrl(Uri.parse(_call));
        break;

      case "linkedin":
        await launchUrl(Uri.parse(_linkedin));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/whoarewe/saleh.jpg'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Babe Saleh Mahfoud',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const SelectableText(part1,
                        style: kWhoAreWeStyle, textAlign: TextAlign.justify),
                    const SizedBox(height: 68),
                    const SelectableText(part2,
                        style: kWhoAreWeStyle, textAlign: TextAlign.justify),
                    const SizedBox(height: 68),
                    const SelectableText(part3,
                        style: kWhoAreWeStyle, textAlign: TextAlign.justify),
                    const SizedBox(height: 68),
                    const SelectableText(part4,
                        style: kWhoAreWeStyle, textAlign: TextAlign.justify),
                    const SizedBox(height: 38),
                    SelectableText(
                      part5,
                      style: kWhoAreWeStyle.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Source Sans Pro'),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const Text(
                      'Contact Us',
                      style: TextStyle(
                          fontFamily: 'Telmidi',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              sendEmail("email");
                            },
                            child: const Icon(FontAwesomeIcons.solidEnvelope,
                                color: Colors.deepPurple)),
                        GestureDetector(
                            onTap: () {
                              sendEmail("website");
                            },
                            child: const Icon(Icons.language,
                                color: kSecondaryColor)),
                        GestureDetector(
                            onTap: () {
                              sendEmail("facebook");
                            },
                            child: const Icon(FontAwesomeIcons.facebookSquare,
                                color: kSecondaryColor)),
                        GestureDetector(
                            onTap: () {
                              sendEmail("call");
                            },
                            child: const Icon(FontAwesomeIcons.phoneAlt,
                                color: kSecondaryColor)),
                        GestureDetector(
                            onTap: () {
                              sendEmail("linkedin");
                            },
                            child: const Icon(FontAwesomeIcons.linkedin,
                                color: kSecondaryColor)),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          'All Rights Reserved, Telmidi 2021.',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
