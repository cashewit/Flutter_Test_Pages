import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        _entryField('Email'),
        _entryField('Password', isPassword: true),
      ],
    );
  }

  Widget _loginButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        'Login',
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

  Widget _divider() {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 20.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(thickness: 1),
            ),
          ),
          Text('OR'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(thickness: 1),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }

  Widget _signInUsingGoogle() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      height: 50.0,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0))),
              child: Image.asset('images/google_logo.jpg'),
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0)),
              ),
              child: Text(
                'Log In With Google',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _register() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: RichText(
          text: TextSpan(
            text: 'Don\'t have an account\?',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                decoration: TextDecoration.underline),
            children: [
              TextSpan(
                  text: ' Register',
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
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 13.0),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      _loginButton(),
                    ],
                  ),
                ),
                _divider(),
                _signInUsingGoogle(),
                _register(),
              ],
            ),
          ),
          Positioned(top: 40, child: _backButton())
        ],
      ),
    );
  }
}
