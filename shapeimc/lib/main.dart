import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();
}

//Class appBar
class _HomeState extends State<Home> {

Widget buildTextField(String label){
  return TextField(
            decoration: InputDecoration(
              labelText: label, labelStyle: TextStyle(color: Colors.green, fontSize: 20.0),
              border: OutlineInputBorder()
            ),
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            keyboardType: TextInputType.number,
          );

}



  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: () {},)

        ],

      ),
    //Corpo do app
    body: SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Icon(Icons.person_outline, size: 170.0, color: Colors.green,),
          buildTextField("Reais"),
          Divider(),
          buildTextField("Altura"),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 50.0,
              child: ElevatedButton(
                child: Text("verificar", style: TextStyle(color: Colors.white, fontSize:  25.0),),
                onPressed: (){},
                style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green))
              
              ),
            ),
          )
        ],
      ),
    ) ,






    );
  }
}

