import 'package:flutter/material.dart';
import 'package:movie/dataabse/provider.dart';
import 'package:toast/toast.dart';

// ignore: non_constant_identifier_names
void validasi_register(BuildContext context, String username, String firtsName,
    String last_name, String email, String telp, String password) {
  if (username.isEmpty) {
    Toast.show("Username belum diisi", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else if (username.contains(" ")) {
    Toast.show("Username tidak boleh mengandung spasi", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else if (firtsName.isEmpty) {
    Toast.show("first name tidak boleh kosong", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else if (last_name.isEmpty) {
    Toast.show("last name tidak boleh kosong", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else if (!email.contains("@")) {
    Toast.show("Email tidak valid", context, duration: 5, gravity: Toast.BOTTOM);
  } else if (telp.isEmpty) {
    Toast.show("No telp harus diisi", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else if (telp.length > 13) {
    Toast.show("No telp tidak boleh lebih dari 13 karakter", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else if (password.length < 4 || password.length > 15) {
    Toast.show(
        "Minimal password 4 karakter dan Maximal password 15 karakter", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else {
    register(context, username, firtsName, last_name, email, telp, password);
  }
}

void validasi_login(BuildContext context, String username, String password) {
  if (username.isEmpty) {
    Toast.show("Username belum diisi", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else if (password.isEmpty) {
    Toast.show("Username belum diisi", context,
        duration: 5, gravity: Toast.BOTTOM);
  } else {
    login(context, username, password);
  }
}
