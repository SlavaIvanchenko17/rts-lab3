import 'package:lab3/calculation/fermat.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class MyFermatArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFermatAreaState();
}

class MyFermatAreaState extends State<MyFermatArea> {
  final _formKey = GlobalKey<FormState>();
  int number;
  dynamic result;
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            children: [
              Row(
                  children: [
                    Container(padding:EdgeInsets.all(10.0),
                        child: Text('Число:', style: TextStyle(fontSize: 20.0),)),
                    Expanded(
                        child:
                        Container(padding:EdgeInsets.all(10.0),
                            child:
                            TextFormField(
                              validator: (value) {
                                if(value == null){
                                  return null;
                                }
                                number = num.tryParse(value);
                                if(number == null){
                                  return '"$value" is not a valid number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                            )
                        )
                    ),

                  ]
              ),
              SizedBox(height: 10.0),
              Container(
                padding:EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      setState(() {
                        result = fermat(number);
                      });
                    }},
                  child: Text('Знайти'),
                  color: Colors.blue, textColor: Colors.white,
                ),
              ),
              SizedBox(height: 50.0),
              Text(result == null ? '' : 'p = ${result[0]} \n'
                  'q = ${result[1]}', style: TextStyle(fontSize: 30.0),),
            ]
        )
    );
  }
}