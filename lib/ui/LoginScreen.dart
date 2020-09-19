import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/Validator/validasi.dart';
import 'package:movie/ui/RegisterScreen.dart';
import 'package:movie/ui/TapBarMenu.dart';
import 'package:movie/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum statusLogin { signIn, notSignIn }

class _LoginScreenState extends State<LoginScreen> {
  var cusername = new TextEditingController();
  var cpassword = new TextEditingController();
  var username = '';
  var password = '';

  statusLogin _loginStatus = statusLogin.notSignIn;

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
            controller: cusername,
            keyboardType: TextInputType.emailAddress,
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
              border: InputBorder.none,
            ),
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
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          username = cusername.text;
          password = cpassword.text;
          setState(() {
            validasi_login(context, username, password);
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
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

  Widget _buildSignInWithText() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Belum Mempunyai Akun? Register',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => RegisterScreen()));
            },
            child: new Text(
              ' di sini',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case statusLogin.notSignIn:
        return Scaffold(
          backgroundColor: Colors.redAccent[100],
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
                          Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 80.0),
                          _buildEmailTF(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildPasswordTF(),
                          _buildLoginBtn(),
                          _buildSignInWithText(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        break;
      case statusLogin.signIn:
        return TapBarMenu();
        break;
    }
  }

  void proses_login() {
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

  getDataPref() async {
    setState(() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        int nvalue = sharedPreferences.getInt("value");
        _loginStatus = nvalue == 1 ? statusLogin.signIn : statusLogin.notSignIn;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataPref();
  }
}
