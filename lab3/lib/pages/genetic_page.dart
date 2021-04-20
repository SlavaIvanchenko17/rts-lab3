import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lab3/calculation/genetic.dart';

class MyGeneticArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyGeneticAreaState();
}

class MyGeneticAreaState extends State<MyGeneticArea> {
  final _formKey = GlobalKey<FormState>();
  int a, b, c, d, res;
  int maxPop;
  int maxItr;
  var time;
  dynamic result;
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    Container(padding:EdgeInsets.all(8.0),
                        child: Text('a:', style: TextStyle(fontSize: 20.0),)),
                    Expanded(
                        child:
                        Container(padding:EdgeInsets.all(8.0),
                            child:
                            TextFormField(
                              validator: (value) {
                                if(value == null){
                                  return null;
                                }
                                a = num.tryParse(value);
                                if(a == null){
                                  return '"$value" is not a valid number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                            )
                        )
                    ),
                    Container(padding:EdgeInsets.all(8.0),
                        child: Text('b:', style: TextStyle(fontSize: 20.0),)),
                    Expanded(
                        child:
                        Container(padding:EdgeInsets.all(8.0),
                            child:
                            TextFormField(
                              validator: (value) {
                                if(value == null){
                                  return null;
                                }
                                b = num.tryParse(value);
                                if(b == null){
                                  return '"$value" is not a valid number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                            )
                        )
                    ),
                    Container(padding:EdgeInsets.all(8.0),
                        child: Text('c:', style: TextStyle(fontSize: 20.0),)),
                    Expanded(
                        child:
                        Container(padding:EdgeInsets.all(8.0),
                            child:
                            TextFormField(
                              validator: (value) {
                                if(value == null){
                                  return null;
                                }
                                c = num.tryParse(value);
                                if(c == null){
                                  return '"$value" is not a valid number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                            )
                        )
                    ),
                    Container(padding:EdgeInsets.all(8.0),
                        child: Text('d:', style: TextStyle(fontSize: 20.0),)),
                    Expanded(
                        child:
                        Container(padding:EdgeInsets.all(8.0),
                            child:
                            TextFormField(
                              validator: (value) {
                                if(value == null){
                                  return null;
                                }
                                d = num.tryParse(value);
                                if(d == null){
                                  return '"$value" is not a valid number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                            )
                        )
                    ),
                    Container(padding:EdgeInsets.all(8.0),
                        child: Text('result:', style: TextStyle(fontSize: 20.0),)),
                    Expanded(
                        child:
                        Container(padding:EdgeInsets.all(8.0),
                            child:
                            TextFormField(
                              validator: (value) {
                                if(value == null){
                                  return null;
                                }
                                res = num.tryParse(value);
                                if(res == null){
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
              Row(
                children: [
                  Container(padding:EdgeInsets.all(8.0),
                      child: new Text('Число ітерацій:', style: TextStyle(fontSize: 20.0),)),
                  Expanded(
                      child:
                      Container(padding:EdgeInsets.all(8.0),
                          child:
                          TextFormField(
                            validator: (value) {
                              if(value == null){
                                return null;
                              }
                              maxItr = num.tryParse(value);
                              if(maxItr == null){
                                return '"$value" is not a valid number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          )
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      padding:EdgeInsets.all(8.0),
                      child: new Text('Число популяцій:', style: TextStyle(fontSize: 20.0),)),
                  Expanded(
                      child:
                      Container(
                          padding:EdgeInsets.all(8.0),
                          child:
                          TextFormField(
                            validator: (value) {
                              if(value == null){
                                return null;
                              }
                              maxPop = num.tryParse(value);
                              if(maxPop == null){
                                return '"$value" is not a valid number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          )
                      )
                  ),
                ],
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
                        result = solve([a, b, c, d, res], maxItr, maxPop);
                        timer.stop();
                        time = timer.elapsedMilliseconds;
                      });
                    }},
                  child: Text('Знайти'),
                  color: Colors.blue, textColor: Colors.white,
                ),
              ),
              SizedBox(height: 50.0),
              Text(result == null ? '' : ' [x1, x2, x3, x4] = $result', style: TextStyle(fontSize: 30.0),),
              SizedBox(height: 20.0),
              Text(time == null ? '' : ' time = $time ms', style: TextStyle(fontSize: 30.0),)
            ]
        )
    );
  }
}