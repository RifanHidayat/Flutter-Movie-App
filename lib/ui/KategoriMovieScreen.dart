import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/dataabse/APIClient.dart';

import 'package:http/http.dart' as http;
import 'package:movie/dataabse/provider.dart';
import 'package:movie/ui/DetailMovieScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KategoriScreen extends StatefulWidget {
  KategoriScreen({
    this.kategori,
    this.action
  });

  final String kategori,action;

  @override
  _KategoriScreenState createState() => _KategoriScreenState();
}

class _KategoriScreenState extends State<KategoriScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  String username;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisSpacing: 0),
                itemCount: dataMovies == null ? 0 : dataMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  //getDataDetail(userDataDetail);
                  return Container(
                    child: Stack(
                      children: <Widget>[
                        new Hero(
                          tag: dataMovies[index]['judul'],
                          child: new Material(
                            child: new InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new DetailMovieScreen(
                                    id: dataMovies[index]['id_movie']
                                        .toString(),
                                    judul: dataMovies[index]['judul'],
                                    deskripsi: dataMovies[index]['deskripsi'],
                                    link: dataMovies[index]['urlvideo'],
                                    tgl_rilis: dataMovies[index]["tgl_post"],
                                    genre: dataMovies[index]["kategori"],
                                    cover:
                                        "${base_url}/assets/${dataMovies[index]["judul"]}.jpg",
                                    url: dataMovies[index]['urlvideo'],
                                    username: username,
                                  ),
                                ));
                              },
                              child: Image.network(
                                ("${base_url}/assets/${dataMovies[index]["judul"]}.jpg"),
                                //fit: BoxFit.fitWidth,
                                fit: BoxFit.fill,
                                height: 360.0,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  getDataPref() async {
    setState(() async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        username = sharedPreferences.getString("username");
      });
    });
  }

//get movies
  Map data;
  List dataMovies = [];
  var loading = false;
  Map datadetail;
  dynamic producDataDetail;

  Future getData() async {
    setState(() {
      loading = true;
    });

    final response = await http.post("$base_url/RestFullAPi/${widget.action}",
        body: {"kategori": widget.kategori});

    data = jsonDecode(response.body);
    print(data);

    dataMovies = data["data"];
    //untuk menampilkan di concole
    print(dataMovies);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getData();
    getDataPref();

    // TODO: implement initState
    super.initState();
  }
}
