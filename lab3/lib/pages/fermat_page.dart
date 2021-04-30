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
  var time;
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
                        var timer = Stopwatch();
                        timer.start();
                        result = fermat(number);
                        timer.stop();
                        time = timer.elapsedMicroseconds;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialog(context, result, time),
                        );
                      });
                    }},
                  child: Text('Знайти'),
                  color: Colors.blue, textColor: Colors.white,
                ),
              ),
            ]
        )
    );
  }
}

Widget _buildPopupDialog(BuildContext context, List<int> result, dynamic time) {
  return new AlertDialog(
    title: const Text('Результати', style: TextStyle(fontSize: 20.0),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(result == null ? '' : 'p = ${result[0]} \n'
            'q = ${result[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 10.0),
        Text(time == null ? '' : 'Час = $time мікросекунд(и)', style: TextStyle(fontSize: 20.0),),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Закрити'),
      ),
    ],
  );
}