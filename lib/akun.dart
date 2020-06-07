import 'package:flutter/material.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail Akun"),
      ),

      body: new Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(80.0),
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage("assets/appimages/jun.jpeg"),
              ),
            ),

            Container(
              color: Colors.lightBlue[100],
              padding: const EdgeInsets.all(10),

              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NAMA',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18
                          ),
                        ),
                        Text(
                          'Putu Juniarta Eka Saputra',
                          style: TextStyle(
                            color: Colors.black54,
                          )
                        )
                      ],
                    ),
                  )
                ]
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 3),),
            Container(
              color: Colors.lightBlue[100],
              padding: const EdgeInsets.all(10),

              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-MAIL',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18
                          ),
                        ),
                        Text(
                          'juniarta@undiksha.ac.id',
                          style: TextStyle(
                            color: Colors.black54,
                          )
                        )
                      ],
                    ),
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}