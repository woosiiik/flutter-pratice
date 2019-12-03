import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Credential {
  String _name;
  String _issuer;
  String _type;
  Icon _icon;
  String _expire;
  List<Claim> _list;

  String get name => _name;

  String get type => _type;

  Icon get icon => _icon;

  String get expire => _expire;

  String get issuer => _issuer;

  @override
  String toString() {
    return 'Credential : name=$_name, type=$_type';
  }

  List<Claim> get list => _list;

  Credential(this._name, this._issuer, this._type, this._icon, this._expire);

  static List<Credential> makeTestData() {
    Credential cr1 = Credential(
        '금융실명쯩', '신한은행', '1', Icon(Icons.accessibility_new), '2019.11.11');
    Credential cr11 = Credential(
        '금융실명쯩', '카카오뱅크', '1', Icon(Icons.accessibility_new), '2019.11.11');
    Credential cr12 = Credential(
        '금융실명쯩', '우리은행', '1', Icon(Icons.accessibility_new), '2019.11.11');
    Credential cr13 = Credential(
        '금융실명쯩', 'SC제일은행', '1', Icon(Icons.accessibility_new), '2019.11.11');
    Credential cr14 = Credential(
        '금융실명쯩', '코모도저축은행', '1', Icon(Icons.accessibility_new), '2019.11.11');

    Credential cr2 = Credential(
        '학생증', '한국예술대학교', '2', Icon(Icons.description), '2019.11.11');
    Credential cr22 = Credential(
        '학생증', '일리노이시카고', '2', Icon(Icons.description), '2019.11.11');
    Credential cr3 =
        Credential('주민등록증', '익선동주민센터', '2', Icon(Icons.favorite), '2019.11.11');
    Credential cr4 = Credential(
        '졸업증명서', '관인리라유치원', '2', Icon(Icons.description), '2019.11.11');

    List<Credential> list = [];
    list
      ..add(cr1)
      ..add(cr11)
      ..add(cr12)
      ..add(cr13)
      ..add(cr14)
      ..add(cr2)..add(cr22)
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
