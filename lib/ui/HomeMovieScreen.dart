import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/dataabse/APIClient.dart';
import 'package:http/http.dart' as http;
import 'package:movie/ui/DetailMovieScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  //get movies
  Map data;
  List dataMovies = [];
  var loading = false;
  Map datadetail;
  dynamic producDataDetail;

  String username;

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

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        username = sharedPreferences.getString("username");
      });

  }

  Future getData() async {
    setState(() {
      loading = true;
    });
    final response = await http.get("$base_url/RestFullAPi/all_movies");

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
