
import 'package:flutter/material.dart';

class Credential {



  String _name;
  String _type;
  Icon _icon;
  String _expire;
  List<Claim> _list;

  String get name => _name;

  String get type => _type;

  Icon get icon => _icon;

  String get expire => _expire;

  @override
  String toString() {
    return 'Credential : name=$_name, type=$_type';
  }

  List<Claim> get list => _list;

  Credential(this._name, this._type, this._icon, this._expire);

  static List<Credential> makeTestData() {
    Credential cr1 = Credential('금융실명쯩', '1', Icon(Icons.accessibility_new), '2019.11.11');
    Credential cr2 = Credential('학생증', '2', Icon(Icons.description), '2019.11.11');
    Credential cr3 = Credential('주민등록증', '2', Icon(Icons.favorite), '2019.11.11');
    Credential cr4 = Credential('졸업증명서', '2', Icon(Icons.description), '2019.11.11');

    List<Credential> list = [];
    list ..add(cr1)
    ..add(cr2)
    ..add(cr3)
    ..add(cr4);

    return list;
  }
}

class Claim {
  String _name;
  String _type;

  Claim(this._name, this._type);

  String get type => _type;

  String get name => _name;
}