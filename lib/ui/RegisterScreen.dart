import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/Validator/validasi.dart';
import 'package:toast/toast.dart';
import 'package:movie/utilities/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

enum statusLogin { signIn, notSignIn }

class _RegisterScreenState extends State<RegisterScreen> {
  var cusername = new TextEditingController();
  var cpassword = new TextEditingController();
  var cfirst_name = new TextEditingController();
  var clast_name = new TextEditingController();
  var cemail = new TextEditingController();
  var ctelp = new TextEditingController();
  var username = '';
  var password = '';
  var firts_name = '';
  var last_name = '';
  var email = '';
  var telp = '';

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: cusername,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Masukan Username anda",
                hintStyle: kHintTextStyle,
                labelText: "Username",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[300]),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildFirtsNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: cfirst_name,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Masukan fisrt name anda",
                hintStyle: kHintTextStyle,
                labelText: "Firts Name",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[300]),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: clast_name,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Masukan last name anda",
                hintStyle: kHintTextStyle,
                labelText: "Last Name",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[300]),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: cemail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: "Masukan alamat E-mail anda ",
                hintStyle: kHintTextStyle,
                labelText: "E=mail",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[300]),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildTelpTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: ctelp,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                hintText: "Masukan No telp anda",
                hintStyle: kHintTextStyle,
                labelText: "No Telp",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[300]),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            controller: cpassword,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: "Masukan Password anda",
                hintStyle: kHintTextStyle,
                labelText: "Password",
                labelStyle: kHintTextStyleLabel,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[300]),
                    borderRadius: new BorderRadius.circular(20.0)),
                focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red[200]),
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
        ),
      ],
    );
  }

  Widget _buildRegsterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          firts_name = cfirst_name.text;
          email = cemail.text;
          telp = ctelp.text;
          password = cpassword.text;
          last_name = clast_name.text;
          username = cusername.text;
          setState(() {
            validasi_register(context, username, firts_name, last_name, email,
                telp, password);
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Text(
          'Register',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithImageTxt() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: Image.asset(
              "assets/back.png",
              width: 30,
              height: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      key: scaffoldState,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      _buildSignInWithImageTxt(),
                      SizedBox(height: 10.0),
                      _buildUsernameTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildFirtsNameTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildLastNameTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildTelpTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildRegsterBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  void showSnakeBar(scaffoldState, String _pesan) {
    scaffoldState.currentState.showSnackBar(
      new SnackBar(
        content: Text(_pesan),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
  }

  void proses_register() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Loading...."),
                SizedBox(
                  height: 30,
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.blue[250],
                ),
              ],
            ),
          ));
        });
  }
}
