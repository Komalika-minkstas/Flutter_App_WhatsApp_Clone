import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:whatsap_clone/NewScreen/loginPage.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to WhatsApp",
                style: TextStyle(
                    fontSize: 29,
                    color: Colors.teal,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Image.asset(
                "assets/bg.png",
                color: Colors.tealAccent[700],
                height: 280,
                width: 280,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        children: [
                          TextSpan(
                              text: "Agree and Continue to accept the",
                              style: TextStyle(color: Colors.grey[600])),
                          TextSpan(
                              text:
                                  " WhatsApp Terms of Service and Privacy Policy",
                              style: TextStyle(color: Colors.cyan))
                        ]),
                  )),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => LoginPage()),
                      (route) => false);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 110,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 8,
                    color: Colors.greenAccent[700],
                    child: Center(
                      child: Text(
                        "Agree and Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
