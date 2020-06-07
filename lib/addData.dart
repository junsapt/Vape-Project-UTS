import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import './home.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerKeterangan = new TextEditingController();
  TextEditingController controllerJumlah = new TextEditingController();
  TextEditingController controllerTanggal = new TextEditingController();
  final format=DateFormat('yyyy-MM-dd');

  void addData(){
    var url="http://192.168.43.205/projectjun/index.php/Penjualan/save";

    http.post(url, body: {
      "nama": controllerNama.text,
      "keterangan": controllerKeterangan.text,
      "jumlah": controllerJumlah.text,
      "tanggal": controllerTanggal.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama",
                    labelText: "Nama Pembeli"
                  )
                ),
                new TextField(
                  controller: controllerKeterangan,
                  decoration: new InputDecoration(
                    hintText: "Liquid",
                    labelText: "Nama Liquid"
                  )
                ),
                new TextField(
                  controller: controllerJumlah,
                  decoration: new InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah"
                  )
                ),
                new DateTimeField(
                  controller: controllerTanggal,
                  format: format, 
                  onShowPicker: (context, currentValue){
                    return showDatePicker(
                      context: context, 
                      initialDate: currentValue??DateTime.now(), 
                      firstDate: DateTime(2020), 
                      lastDate: DateTime(2045)
                    );
                  },
                  decoration: new InputDecoration(
                    hintText: "Tanggal",
                    labelText: "Tanggal pembelian"
                  )
                ),

                new Padding(padding: const EdgeInsets.all(10.0),),

                new RaisedButton(
                  child: new Text("ADD DATA"),
                  color: Colors.lightBlueAccent,
                  onPressed: (){
                    addData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new Home()
                      )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}