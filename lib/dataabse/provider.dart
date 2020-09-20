import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/Shared_preference/Session.dart';
import 'package:movie/dataabse/APIClient.dart';
import 'package:toast/toast.dart';

Future<void> register(BuildContext context, String username, String firts_name,
    String last_name, String email, String telp, String password) async {
  final responseData = await http.post("$base_url/RestFullAPi/register", body: {
    "firts_name": firts_name,
    "email": email,
    "last_name": last_name,
    "password": password,
    "username": username,
    "telp": telp
  });

  final data = jsonDecode(responseData.body);
  int value = data['value'];
  String pesan = data['message'];
//cek value 1 atau 0
  if (value == 1) {
    Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
    Navigator.pop(context);
  } else if (value == 2) {
    Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
  } else {
    Toast.show("Tidak terkoneksi ke server", context,
        duration: 5, gravity: Toast.BOTTOM);
  }
}

void login(BuildContext context, String username, String password) async {
  final responseData = await http.post("$base_url/RestFullAPi/login", body: {
    "username": username,
    "password": password,
  });

  final data = jsonDecode(responseData.body);

  int value = data['value'];
  String pesan = data['message'];

// get data respon


// cek value 1 atau 0
  if (value == 1) {
    Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);
    String dtusername = data['detail']['username'];
    String dtfirst_name = data['detail']['firts_name'];
    String dtlast_name = data['detail']['last_name'];
    String dtemail = data['detail']['email'];
    String dttelp = data['detail']['telp'];
    saveData(value, dtusername, dtfirst_name, dtlast_name, dtemail, dttelp);

  } else if (value == 0) {
    Toast.show("$pesan", context, duration: 5, gravity: Toast.BOTTOM);

  }
}

var color;

Future kirim_favorite(BuildContext context, String username, String id_movie,
    String favorite) async {
  final responseData = await http.post("$base_url/RestFullAPi/kirim_favorite",
      body: {"username": username, "id_movie": id_movie, "favorite": favorite});
  final data = jsonDecode(responseData.body);
  String value = data['favorite'];
  String message = data['message'];
  if (value == "1") {
    print(value);
    color = Colors.yellow;
    Toast.show("$message", context, duration: 5, gravity: Toast.BOTTOM);
  } else if (value == "0") {
    Toast.show("$message", context, duration: 5, gravity: Toast.BOTTOM);
    color = Colors.black45;
    print(value);
  }
}

var favor;
favorite(BuildContext context, String username, String id_movie) async {
  final responseData = await http.post("$base_url/RestFullAPi/cek_favorite",
      body: {"username": username, "id_movie": id_movie});

  final data = jsonDecode(responseData.body);

  String favorite = data['favorite'];

  print(data);
  if (favorite == "1") {
    favor = "1";
    color = Colors.yellow;
    return favor;
  } else if (favorite == "0") {
    favor = "0";
    color = Colors.black45;
    return favor;
  } else if (favorite == "2") {
    favor = "0";
    color = Colors.black45;
    return favor;
  }
}
