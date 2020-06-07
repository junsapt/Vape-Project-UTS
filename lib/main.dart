import 'package:flutter/material.dart';
// import './detailproduk.dart';
import './beranda.dart' as beranda;
import './produklist.dart' as listproduk;
import './home.dart' as home;
import 'beranda.dart';
import 'berandaadmin.dart';
import 'login.dart';
import 'home.dart'
;
//Top Level/Root
void main() => runApp(
  new MaterialApp(
    title: 'Vape Store App',
    home: Berandauser(),
    routes: <String, WidgetBuilder>{
        '/Berandauser': (BuildContext context) => new Berandauser(),
        '/Berandaadmin': (BuildContext context) => new Berandaadmin(),
        '/login':(BuildContext context)=>Login(),
        '/Penjualan': (BuildContext context) => new Home(),
      },
  )
);
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  TabController controller;
  @override

  void initState(){
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new beranda.Beranda(),
          new listproduk.ProdukList(),
          new home.Home(),
        ],
      ),

      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.home)),
          ],
        )
      ),
    );
  }
}