import 'package:flutter_pratice1/data/Credential.dart';

class CredentialManager {
  static final CredentialManager _singleton = new CredentialManager._internal();

  List<Credential> _credentialList;


  factory CredentialManager() {
    return _singleton;
  }

  CredentialManager._internal() {
    _credentialList = Credential.makeTestData();
    var stream = Stream.fromIterable(_credentialList);
    stream.forEach(print);
  }

  List<Credential> get credentialList => _credentialList;


}