import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/dataabse/provider.dart';
import 'package:movie/ui/RunningMovieScreen.dart';

// ignore: must_be_immutable
class DetailMovieScreen extends StatefulWidget {
  DetailMovieScreen(
      {this.id,
      this.judul,
      this.deskripsi,
      this.link,
      this.tgl_rilis,
      this.genre,
      this.cover,
      this.url,
      this.username});

  final String cover, id;
  String deskripsi, judul, link, tgl_rilis, genre, username, url;

  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 360.0,
              child: new Hero(
                tag: 1,
                child: new Material(
                  child: new InkWell(
                    child: Image.network(
                      "${widget.cover}",
                      height: 360,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )),
          new PartJudul(
            judul: widget.judul,
            genre: widget.genre,
            tgl_rilis: widget.tgl_rilis,
            deskripsi: widget.deskripsi,
            username: widget.username,
            id_movie: widget.id,
          ),
          new PartDeskripsi(
            judul: widget.judul,
            genre: widget.genre,
            tgl_rilis: widget.tgl_rilis,
            deskripsi: widget.deskripsi,
          ),
          _btnStreeming()
        ],
      ),
    );
  }

  Widget _btnStreeming() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
//          setState(() {
//            favorite(context, widget.username, widget.id);
//          });
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new RunningMovieScreen(
              url: widget.url,
              judul: widget.judul,
            ),
          ));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.white,
        child: Text(
          'Tonton Sekarang',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    setState(() {
      favorite(context, widget.username, widget.id);
    });
    if (favor=="1"){
      setState(() {
        color=Colors.yellow;
      });

    }else{
      setState(() {
        color=Colors.black45;
      });

    }
    super.initState();
  }
}

class PartJudul extends StatelessWidget {

  PartJudul(
      {this.judul,
      this.genre,
      this.tgl_rilis,
      this.deskripsi,
      this.username,
      this.id_movie});

  final String judul, genre, tgl_rilis, deskripsi, username, id_movie;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Judul             : $judul",
                  style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                new Text(
                  "Genre             :$genre",
                  style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                new Text(
                  "Tanggal Rilis :$tgl_rilis",
                  style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          new InkWell(
            onTap: () {

              if (favor == "0") {
                kirim_favorite(context, username, id_movie, "1");
                favor="1";
                (context as Element).reassemble();
                color=Colors.yellow;

              } else {
                kirim_favorite(context, username, id_movie, "0");
                favor="0";
                (context as Element).reassemble();
                color=Colors.black45;
              }
            },
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.star,
                  size: 50.0,
                  color: color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartDeskripsi extends StatelessWidget {
  PartDeskripsi({this.judul, this.genre, this.tgl_rilis, this.deskripsi});

  final String judul, genre, tgl_rilis, deskripsi;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(left: 10, right: 10),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Deskripsi       :$deskripsi",
                  textAlign: TextAlign.justify,
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Row(
                children: <Widget>[],
              ),
            ],
          )
        ],
      ),
    );
  }
}
