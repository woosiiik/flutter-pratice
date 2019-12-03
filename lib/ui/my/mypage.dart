import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _isLocalAuth;
  String _authorized;

  @override
  initState() {
    super.initState();
    _checkBio();
  }

  _checkBio() async {
    var isLocalAuth;
    isLocalAuth = await LocalAuthentication().canCheckBiometrics;
    setState((){
      _isLocalAuth = isLocalAuth;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Text(_isLocalAuth.toString()),
        Text(_authorized == null ? "" : _authorized),
        OutlineButton(
          child: Text('Authenticate'),
          onPressed: () async {
            bool authenticated = false;
            authenticated = await LocalAuthentication().authenticateWithBiometrics(localizedReason: "지문 인식 진행");
            setState(() {
              _authorized = authenticated? 'Authorized' : 'Not Authorized';
            });
          }
        ),
      ],
    );
  }


}