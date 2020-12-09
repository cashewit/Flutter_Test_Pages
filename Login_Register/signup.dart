import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  Widget _entryField(String title, {isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xfff3f3f4),
            ),
            textInputAction:
                isPassword ? TextInputAction.done : TextInputAction.next,
          ),
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: [
        _entryField('Username'),
        _entryField('Email'),
        _entryField('Password', isPassword: true),
      ],
    );
  }

  Widget _registerButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        'Register',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        child: Row(
          children: [
            Icon(Icons.keyboard_arrow_left, color: Colors.white),
            Text(
              'Back',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _login() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: RichText(
          text: TextSpan(
            text: 'Already have an account\?',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                decoration: TextDecoration.underline),
            children: [
              TextSpan(
                  text: ' Login',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: _title(),
                  decoration: BoxDecoration(color: Colors.blue),
                  width: MediaQuery.of(context).size.width,
                  height: 2 * MediaQuery.of(context).size.height / 5,
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _emailPasswordWidget(),
                      _registerButton(),
                    ],
                  ),
                ),
                _login(),
              ],
            ),
          ),
          Positioned(top: 40, child: _backButton())
        ],
      ),
    );
  }
}
