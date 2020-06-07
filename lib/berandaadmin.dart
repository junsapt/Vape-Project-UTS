import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Berandaadmin extends StatefulWidget {
  @override
_BerandaadminState createState() => _BerandaadminState();
}

class _BerandaadminState extends State<Berandaadmin> {
  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
  setState(() {
    preferences.setInt("value", null);
  });
  Navigator.pushNamed(context, '/login');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Admin"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text('logout'),
              trailing: new Icon(Icons.settings),
              onTap: (){
                  signOut();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Halaman Admin"),
      ),
    );
  }
}