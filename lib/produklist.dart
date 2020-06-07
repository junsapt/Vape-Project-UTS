import 'package:flutter/material.dart';
import './detail_produk.dart';

class ProdukList extends StatefulWidget {
  @override
  _ProdukListState createState() => _ProdukListState();
}

class _ProdukListState extends State<ProdukList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST PRODUK")
      ),

      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[

          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "Bukan Liquid KW Indonesian Juices X Roy Ricardo",
                  description: "Liquid vape dengan varian rasa anggur merah dengan sensasi dingin yang menyegarkan",
                  price: 150000,
                  image: "anggur1.png",
                  star: 5,
                ),
              ));
            },

            child: ProductBox(
              name: "Bukan Liquid KW Indonesian Juices X Roy Ricardo",
              description: "Liquid vape dengan varian rasa anggur merah dengan sensasi dingin yang menyegarkan",
              price: 150000,
              image: "anggur2.png",
              star: 5,
            ),
          ),
          
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "Bukan Liquid KW Indonesian Juices X Roy Ricardo",
                  description: "Liquid vape dengan varian rasa biskuit stroberi pudding",
                  price: 150000,
                  image: "strawberry1.png",
                  star: 4,
                ),
              ));
            },

            child: ProductBox(
              name: "Bukan Liquid KW Indonesian Juices X Roy Ricardo",
              description: "Liquid vape dengan varian rasa biskuit stroberi pudding",
              price: 150000,
              image: "strawberry2.png",
              star: 4,
            ),
          ),


          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  name: "Premium Liquid",
                  description: "Liquid dengan varian rasa donat dengan campuran krim storberi",
                  price: 100000,
                  image: "donuts1.png",
                  star: 3,
                ),
              ));
            },

            child: ProductBox(
              name: "Premium Liquid",
              description: "Liquid dengan varian rasa donat dengan campuran krim storberi",
              price: 100000,
              image: "donuts2.png",
              star: 3,
            ),
          ),
        ],
      )
    );
  }
}

class ProductBox extends  StatelessWidget{
  ProductBox({Key key, this.name, this.description, this.price, this.image, this.star}): super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  final int star;

  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/appimages/" + image, width: 50,),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text(
                      "Price: " + this.price.toString(),
                      style: TextStyle(color: Colors.red),
                    ),

                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.star, size: 10, color: Colors.deepOrange),
                            Icon(Icons.star, size: 10, color: Colors.deepOrange),
                            Icon(Icons.star, size: 10, color: Colors.deepOrange),
                            Icon(Icons.star, size: 10, color: Colors.orange),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}