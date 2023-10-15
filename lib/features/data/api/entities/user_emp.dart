import 'package:flutter/material.dart';

class UserEnt {
  var _uid;
  var _name;
  var _email;
  var _password;
  var _genre;
  var _id;
  var _bornDate;
  var _enterprise;

  UserEnt(this._uid, this._name, this._id, this._genre, this._bornDate,
      this._email, this._enterprise, this._password);

  UserEnt.Empty();
  // UserEnt empty();
  get uid => _uid;
  set uid(value) {
    _uid = value;
  }
// Per.fromJson
  UserEnt.fromJson(Map<String, dynamic> json)
      : _uid = json['uid'],
        _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _id = json['typeS'],
        _enterprise = json['enterprise'],
        _bornDate = json['borndate'];

  //  Map<String, dynamic> toJson() =>
  Map<String, dynamic> toJson() => {
        'uid': _uid,
        'name': _name,
        'email': _email,
        'password': _password,
        'genre': _genre,
        'id': _id,
        'enterprise': _enterprise,
        'borndate': _bornDate
      };

  void _showMsg(String msg, var context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Msg: ',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ));
  }
}
