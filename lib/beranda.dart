import 'package:flutter/material.dart';
import 'editData.dart';
import 'berandaadmin.dart';
import 'login.dart';
import 'akun.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class Berandauser extends StatefulWidget {
  @override
_BerandauserState createState() => _BerandauserState();
}
class _BerandauserState extends State<Berandauser> {
  //variabel untuk menampung shared preference
  String id;
  String nama;
  String email;
  String photo;
  List penjualanList;
  int level=0;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
  //fungsi untuk memanggil shared preferences
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
    //mengisi nilai masing-masing variabel
    level = preferences.getInt("level");
    id = preferences.getString("id");
    email = preferences.getString("email");
    nama = preferences.getString("nama");
    photo = preferences.getString("photo");
  });
}
//fungsi signt out
signOut() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  setState(() {
    //set level 0
    preferences.setInt("level", 0);
  });
  //redirect login
  Navigator.pushNamed(context, '/login');
}
@override
  void initState() {
    super.initState();
  //memanggil fungsi preference
    getPref();
  }
@override
Widget build(BuildContext context) {
  //swicth untuk menampilkan halaman berdasarkan level user
  switch (level) {
  case 1:
  //memanggil halaman admin
    return Berandaadmin();
    break;
  case 2:
  //mereturn sebuah scafold halaman user
  return Scaffold(
  appBar: new AppBar(
    title: new Text("Beranda"),
  ),
  drawer: new Drawer(
    child: new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text("$nama"),
          accountEmail: new Text("$email"),
          currentAccountPicture: new GestureDetector(   
            onTap: () {},
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(
                'http://192.168.100.75/apiflutter/media/photo/$photo'),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/appimages/bg_profile.jpg'),
                fit: BoxFit.cover),
          ),
        ),
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
  body: Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image.asset("assets/appimages/onlineshop.jpg"),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
            ),
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "April",
                style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontFamily: "NeoSansBold"),
              ),
              new Container(
                child: new Text(
                  "Rp. 120.000",
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontFamily: "NeoSansBold"),
                ),
              )
            ],
          ),
      ),
      Container(
        child: new Column(
          children: <Widget>[
            Row(children: <Widget>[
             Expanded(
              flex: 1,
              child: RaisedButton(
                color: _buttonColorWhite,
                highlightColor: _buttonHighlightColor,
                padding: EdgeInsets.all(10),
                child: new Column(
                  children: <Widget>[
                    new Image.asset('assets/appimages/icon_taks.png',
                      width: 40),
                    new Text(
                      "Tambah",
                      style: new TextStyle(
                       fontSize: 10, color: Colors.red),
                    )
                  ],
                ),
                onPressed: () {
                  //memanggil input penjualan voucher
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context)=> new EditData (list:null,index:null,)
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: RaisedButton(
                color: _buttonColorWhite,
                highlightColor: _buttonHighlightColor,
                padding: EdgeInsets.all(10),
                child: new Column(
                  children: <Widget>[
                    new Image.asset('assets/appimages/icon_absen.png',
                      width: 40),
                    new Text(
                      "Penjualan",
                      style: new TextStyle(
                        fontSize: 10, color: Colors.red),
                    )
                  ],
                ),
                onPressed: () {
                //memanggil halaman penjualan voucher
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context)=>new Home(),
                    )
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: RaisedButton(
                color: _buttonColorWhite,
                highlightColor: _buttonHighlightColor,
                padding: EdgeInsets.all(10),
                child: new Column(  
                  children: <Widget>[
                    new Image.asset('assets/appimages/icon_matakuliah.png',
                      width: 40),
                    new Text(
                      "Pelanggan",
                      style: new TextStyle(
                        fontSize: 10, color: Colors.red),
                    )
                  ],
                ),
                onPressed: () {
                //hitung('/');
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: RaisedButton(
                color: _buttonColorWhite,
                highlightColor: _buttonHighlightColor,
                padding: EdgeInsets.all(10),
                child: new Column(
                  children: <Widget>[
                      new Image.asset('assets/appimages/icon_schedule.png',
                        width: 40),
                      new Text(
                        "Laporan",
                        style: new TextStyle(
                          fontSize: 10, color: Colors.red),
                      )
                    ],
                  ),
                  onPressed: () {
                  //hitung('/');
                   },
                 ),
                )
             ]),
           ],
         ))
        ],
      ),
    ),
  );
  case 0:
  //jika level 0 kemabli ke login
    return Login();
    break;
}
}
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("BERANDA"),
        ]),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Click search');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_active), 
            onPressed: () {
              print('Click start');
            },
          ),
        ],
      ),

      //DRAWER
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Putu Juniarta Eka Saputra"), 
              accountEmail: new Text("juniarta@undiksha.ac.id"),
              currentAccountPicture: new GestureDetector(
                onTap: () {},
                child: new CircleAvatar(
                  backgroundImage: AssetImage('assets/appimages/jun.jpeg'),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/appimages/bg.jpg'),
                  fit: BoxFit.cover
                ),
              ),
            ),

            new ListTile(
              title: new Text('Notifications'),
              trailing: new Icon(Icons.notifications_none),
            ),

            new ListTile(
              title: new Text('Wishlist'),
              trailing: new Icon(Icons.bookmark_border),
            ),

            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Akun(),
                ));
              },

              child: new ListTile(
                title: new Text('Akun'),
              trailing: new Icon(Icons.verified_user),
              )
            ),
            
            Divider(height: 2,),
            new ListTile(
              title: new Text('Setting'),
              trailing: new Icon(Icons.settings),
            ),
          ],
        )
      ),
      //END DRAWER

      body: new Column(
        children: <Widget>[
          Image.asset("assets/appimages/skullvaping.png"),
        
          Container(
            color: Colors.blueAccent[100],
            padding: const EdgeInsets.all(10),

            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skull Vaping Store',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20
                        ),
                      ),
                      Text(
                        'Pantai Penimbangan, Pemaron, Buleleng, Bali - Indonesia',
                        style: TextStyle(
                          color: Colors.black,
                        )
                      )
                    ],
                  ),
                )
              ]
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "CALL",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.near_me),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "ROUTE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),
                
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.share),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    )
                  ],
                ),
              ]
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Skull Vape Store merupakan sebuah toko yang dimana menjual perlengkapan vape dan berbagai macam liquid'
              'kami mempunyai sasaran untuk masyarakat dengan cara menemukan alternatif untuk menggantikan rokok konvensional'
              'dan sebagai sarana bagi perokok untuk berhenti dari kebiasaan merokoknya atau beralih ke vaping, karena vaping lebih terjamin dibanding rokok konvensional.'
              'serta meminimalisir orang-orang yang sering menjadi perokok pasif.',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}