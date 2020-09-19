import 'package:flutter/material.dart';
import 'package:movie/ui/HomeMovieScreen.dart';
import 'package:movie/ui/KategoriMovieScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TapBarMenu extends StatefulWidget {
  @override
  _TapBarMenuState createState() => _TapBarMenuState();
}

class _TapBarMenuState extends State<TapBarMenu>
    with SingleTickerProviderStateMixin {

  //create controller untuk tabBar
  TabController controller;
  String username;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    getDataPref();
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //create appBar
      appBar: new AppBar(
        //warna background
        backgroundColor: Colors.black26,
        //judul
        title: new Text("Movie App ", style: TextStyle(color: Colors.white),),
        //bottom
        bottom: new TabBar(
          controller: controller,
          //source code lanjutan
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.videocam, color: Colors.white,),
              text: "All",),
            new Tab(icon: new Icon(Icons.videocam, color: Colors.white,),
              text: "Comedy",),

            new Tab(icon: new Icon(Icons.videocam, color: Colors.white,),
              text: "Action",),
            new Tab(icon: new Icon(Icons.star, color: Colors.white,),
              text: "Favorites",),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
//          new rifan.ScreenRifan(),
//          new udacoding.ScreenUdacoding()
          HomeScreen1(),
          KategoriScreen(kategori: "Comedy",action: "kategori_movie",),
          KategoriScreen(kategori: "Action",action: "kategori_movie",),
          KategoriScreen(kategori: "RifanHidayat",action: "kategori_favorites",),

        ],
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

}