import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _loginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
        ),
        child: Text('Login'.toUpperCase(),
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _signupButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child: Text('Register'.toUpperCase(),
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _title() {
    return RichText(
      text: TextSpan(
        text: 'Ipsum.'.toUpperCase(),
        style: TextStyle(
            color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: 'Lorem'.toUpperCase(),
              style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.4,
                child: _title(),
              ),
              _loginButton(),
              SizedBox(height: 25.0),
              _signupButton(),
            ],
          ),
        ),
      ),
    );
  }
}
