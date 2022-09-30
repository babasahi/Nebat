import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhoAreWe extends StatefulWidget {
  @override
  State<WhoAreWe> createState() => _WhoAreWeState();
}

class _WhoAreWeState extends State<WhoAreWe> {
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
                    SelectableText(WhoAreWeData().part1,
                        style: kWhoAreWeStyle, textAlign: TextAlign.justify),
                    const SizedBox(height: 68),
                    SelectableText(WhoAreWeData().part2,
                        style: kWhoAreWeStyle, textAlign: TextAlign.justify),
                    const SizedBox(height: 68),
                    SelectableText(WhoAreWeData().part3,
                        style: kWhoAreWeStyle, textAlign: TextAlign.justify),
                    const SizedBox(height: 68),
                    SelectableText(WhoAreWeData().part4,
                        style: kWhoAreWeStyle, textAlign: TextAlign.justify),
                    const SizedBox(height: 38),
                    SelectableText(
                      WhoAreWeData().part5,
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
                color: kMainColor,
                child: Column(
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                          fontFamily: 'Telmidi',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor),
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
                            child: Icon(FontAwesomeIcons.solidEnvelope,
                                color: kSecondaryColor)),
                        GestureDetector(
                            onTap: () {
                              sendEmail("website");
                            },
                            child:
                                Icon(Icons.language, color: kSecondaryColor)),
                        GestureDetector(
                            onTap: () {
                              sendEmail("facebook");
                            },
                            child: Icon(FontAwesomeIcons.facebookSquare,
                                color: kSecondaryColor)),
                        GestureDetector(
                            onTap: () {
                              sendEmail("call");
                            },
                            child: Icon(FontAwesomeIcons.phoneAlt,
                                color: kSecondaryColor)),
                        GestureDetector(
                            onTap: () {
                              sendEmail("linkedin");
                            },
                            child: Icon(FontAwesomeIcons.linkedin,
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
