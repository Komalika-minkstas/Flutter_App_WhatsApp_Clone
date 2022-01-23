import 'package:flutter/material.dart';
import 'package:whatsap_clone/NewScreen/countryPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Enter your phone number",
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              wordSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "WhatsApp will send you an sms to verify your number",
              style: TextStyle(fontSize: 13.5),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "What's my Number",
              style: (TextStyle(
                fontSize: 12.8,
                color: Colors.cyan[800],
              )),
            ),
            SizedBox(
              height: 15,
            ),
            countryCard()
          ],
        ),
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => CountryPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.teal, width: 1.8),
        )),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  child: Center(
                child: Text(
                  "India",
                  style: TextStyle(fontSize: 16),
                ),
              )),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
