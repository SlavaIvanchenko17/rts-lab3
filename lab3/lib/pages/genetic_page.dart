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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          setState(() {
                            var timer = Stopwatch();
                            timer.start();
                            result = solve([a, b, c, d, res], maxItr, maxPop, 0.05);
                            timer.stop();
                            time = timer.elapsedMilliseconds;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _buildPopupDialogResult(context, result[0], time),
                            );
                          });
                        }},
                      child: Text('Знайти'),
                      color: Colors.blue, textColor: Colors.white,
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _buildPopupDialogTest(context, [a, b, c, d, res], maxItr, maxPop),
                            );
                          });
                        }},
                      child: Text('Тести'),
                      color: Colors.blue, textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ]
        )
    );
  }
}

Widget _buildPopupDialogResult(BuildContext context, dynamic result, dynamic time) {
  return new AlertDialog(
    title: const Text('Результати', style: TextStyle(fontSize: 20.0),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(result == null ? '' : ' [x1, x2, x3, x4] = $result', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 10.0),
        Text(time == null ? '' : 'Час = $time ms', style: TextStyle(fontSize: 20.0),),
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

Widget _buildPopupDialogTest(BuildContext context, List<int> data, int maxItr, int maxPop) {
  return new AlertDialog(
    title: const Text('Тести', style: TextStyle(fontSize: 20.0),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Шанс мутації >> Кількість популяцій', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('10% >> ${solve(data, maxItr, maxPop, 0.1)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('20% >> ${solve(data, maxItr, maxPop, 0.2)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('30% >> ${solve(data, maxItr, maxPop, 0.3)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('40% >> ${solve(data, maxItr, maxPop, 0.4)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('50% >> ${solve(data, maxItr, maxPop, 0.5)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('60% >> ${solve(data, maxItr, maxPop, 0.6)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('70% >> ${solve(data, maxItr, maxPop, 0.7)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('80% >> ${solve(data, maxItr, maxPop, 0.8)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('90% >> ${solve(data, maxItr, maxPop, 0.9)[1]}', style: TextStyle(fontSize: 20.0),),
        SizedBox(height: 5.0),
        Text('100% >> ${solve(data, maxItr, maxPop, 1)[1]}', style: TextStyle(fontSize: 20.0),),
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