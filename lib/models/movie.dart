// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    this.data,
  });

  List<Datum> data;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.idMovie,
    this.judul,
    this.deskripsi,
    this.kategori,
    this.tglPost,
    this.urlvideo,
  });

  String idMovie;
  String judul;
  String deskripsi;
  String kategori;
  DateTime tglPost;
  String urlvideo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idMovie: json["id_movie"],
    judul: json["judul"],
    deskripsi: json["deskripsi"],
    kategori: json["kategori"],
    tglPost: DateTime.parse(json["tgl_post"]),
    urlvideo: json["urlvideo"],
  );

  Map<String, dynamic> toJson() => {
    "id_movie": idMovie,
    "judul": judul,
    "deskripsi": deskripsi,
    "kategori": kategori,
    "tgl_post": "${tglPost.year.toString().padLeft(4, '0')}-${tglPost.month.toString().padLeft(2, '0')}-${tglPost.day.toString().padLeft(2, '0')}",
    "urlvideo": urlvideo,
  };
}
