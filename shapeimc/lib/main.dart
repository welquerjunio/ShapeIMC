import 'dart:ffi';

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

//variavel dos textos dos dados
String infoText = "Informe seus dados";

//controler
TextEditingController weightController = TextEditingController();
TextEditingController heightController = TextEditingController();



//função dos campos
Widget buildTextField(String label, TextEditingController c){
  return TextField(
            decoration: InputDecoration(
              labelText: label, labelStyle: TextStyle(color: Colors.teal, fontSize: 20.0),
              border: OutlineInputBorder()
            ),
            style: TextStyle(color: Colors.teal, fontSize: 25.0),
            keyboardType: TextInputType.number,
            controller: c,
          );

}

//função de limpar
void _resetFields(){
  setState(() {
     weightController.text = "";
     heightController.text = "";
     infoText = "Informe seus dados acima!";
    
  });
 

}

//função de calcular
void _calculate(){
    double weigth = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weigth / (height * height);
      setState(() {
        if( imc < 17){
      infoText = "Muito frango! (IMC ${imc.toStringAsPrecision(4)})";

    } else if (imc >= 17 && imc <= 18.49){
      infoText = "Está frangolino! (IMC ${imc.toStringAsPrecision(4)})";
    
    } else if (imc >= 18.5 && imc <= 29.99){
      infoText = "Está no Shape! (IMC ${imc.toStringAsPrecision(4)})";
    
    } else if (imc >= 25 && imc <= 29.99){
      infoText = "Treina fofo! (IMC ${imc.toStringAsPrecision(4)})";
    
    } else if (imc >= 30 && imc <= 34.99){
      infoText = "Furou a dieta! (IMC ${imc.toStringAsPrecision(4)})";
    
    } else if (imc >= 35 && imc <= 39.99){
      infoText = "Só com veneno! (IMC ${imc.toStringAsPrecision(4)})";
  
    } else if (imc >= 40){
      infoText = "Nem suco resolve... (IMC ${imc.toStringAsPrecision(4)})";
    }

     });

    
}


  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Calculadora do Shape", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
          onPressed: () {
            _resetFields();
          },)

        ],

      ),
    //Corpo do app
    body: SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Image.asset(
            'img/tanoshape.png', color: const Color.fromARGB(255, 20, 145, 114), width: 100, height: 220),


          Divider(),
          //Icon(Icons.person_outline, size: 170.0, color: Colors.green,),
          buildTextField("Peso", weightController),
          Divider(),
          buildTextField("Altura", heightController),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 50.0,
              child: ElevatedButton(
                child: Text("verificar o shape", style: TextStyle(color: Colors.white, fontSize:  25.0),),
                onPressed: (){
                  _calculate();
                },
                style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(infoText, style: TextStyle(color: Colors.teal, fontSize: 25.00),
            textAlign: TextAlign.center,),
          )
        ],
      ),
    ) ,

    );
  }
}

