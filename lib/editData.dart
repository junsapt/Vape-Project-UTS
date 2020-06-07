import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import './home.dart';

class EditData extends StatefulWidget {

  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {


  TextEditingController controllerNama;
  TextEditingController controllerKeterangan;
  TextEditingController controllerJumlah;
  TextEditingController controllerTanggal;
  final format=DateFormat('yyyy-MM-dd');

  void editData(){
    var url="http://192.168.43.205/projectjun/index.php/Penjualan/save_update";
    http.post(url,body:{
      "id": widget.list[widget.index]['id'],
      "nama": controllerNama.text,
      "keterangan": controllerKeterangan.text,
      "jumlah": controllerJumlah.text,
      "tanggal": controllerTanggal.text,
    });
  }

  @override
  void initState() {
    controllerNama= new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerKeterangan= new TextEditingController(text: widget.list[widget.index]['keterangan']);
    controllerJumlah= new TextEditingController(text: widget.list[widget.index]['jumlah']);
    controllerTanggal= new TextEditingController(text: widget.list[widget.index]['tanggal']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("EDIT DATA"),),
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
                  child: new Text("EDIT DATA"),
                  color: Colors.lightBlueAccent,
                  onPressed: (){
                    editData();
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
      ),
    );
  }
}