import 'package:flutter/material.dart';
import 'package:lab3/fermat.dart';

class MyFermatArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFermatAreaState();
}

class MyFermatAreaState extends State<MyFermatArea> {
  final _formKey = GlobalKey<FormState>();
  int number;
  dynamic result;
  Widget build(BuildContext context) {
    return new Form(key: _formKey, child: new Column(
        children: [
          new Row(children: <Widget>[
            new Container(padding:EdgeInsets.all(10.0),child: new Text('Число:')),
            new Expanded(child: Container(padding:EdgeInsets.all(10.0),child:
            new TextFormField(validator: (value){

              if (value.isEmpty) return 'Введіть число!!!';
              try {
                number = int.parse(value);
              } catch(e) {
                number = null;
                return 'Не число!!!';
              }
            })
            )),
          ]
          ),

          new SizedBox(height: 10.0),

          new RaisedButton(onPressed: (){
            if(_formKey.currentState.validate()) {
              setState(() {
                if (number is int) result = fermat(number);
              });
            }
          }, child: Text('Знайти'), color: Colors.blue, textColor: Colors.white,),

          new SizedBox(height: 50.0),

          new Text(result == null ? '' : 'p = ${result[0]}\nq = ${result[1]}', style: TextStyle(fontSize: 30.0),)
        ]
    ));
  }
}

void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Факторизація Ферма')),
            body: new MyFermatArea()
        )
    )
);