import 'package:flutter/material.dart';
import './editData.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void confirm (id){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure want to delete '${widget.list[widget.index]['nama']}' with '${widget.list[widget.index]['keterangan']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK Delete!"),
          color: Colors.red[400],
          onPressed: (){
            deletePenjualan(id);
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=>new Home(),
              )
            );
          },
        ),
        new RaisedButton(
          child: new Text("Cancel!"),
          color: Colors.lightBlueAccent,
          onPressed: ()=>Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nama']}"),),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['nama'], style: new TextStyle(fontSize: 20.0),),
                new Text("Liquid : ${widget.list[widget.index]['keterangan']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Harga : ${widget.list[widget.index]['jumlah']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Tanggal : ${widget.list[widget.index]['tanggal']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.lightBlueAccent,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10.0)),
                    new RaisedButton(
                      child: new Text("Delete"),
                      color: Colors.red[400],
                      onPressed: ()=>confirm(widget.list[widget.index]['id']),
                    ),
                  ],
                )
              ],
            )
          ),
        )
      ),
    );
  }

  Future<http.Response> deletePenjualan(id) async {
    final http.Response response= await http.delete("http://192.168.43.205/projectjun/index.php/Penjualan/delete/$id");

    return response;
  }
}