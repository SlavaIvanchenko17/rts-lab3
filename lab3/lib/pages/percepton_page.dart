import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lab3/calculation/percepton.dart';

class MyPerceptonArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPerceptonAreaState();
}

class MyPerceptonAreaState extends State<MyPerceptonArea> {
  final _formKey = GlobalKey<FormState>();
  dynamic start = perceptron([[0, 6], [1, 5], [3, 3], [2, 4]], 4);
  int maxItr;
  double maxTime;
  double sigma;
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
                      child: Text('Число ітерацій:', style: TextStyle(fontSize: 20.0),)),
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
                  Container(padding:EdgeInsets.all(8.0),
                      child: new Text('Максимальний час:', style: TextStyle(fontSize: 20.0),)),
                  Expanded(
                      child:
                      Container(padding:EdgeInsets.all(8.0),
                          child:
                          TextFormField(
                            validator: (value) {
                              if(value == null){
                                return null;
                              }
                              maxTime = num.tryParse(value);
                              if(maxTime  == null){
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
                      child: new Text('Швидкість навчання:', style: TextStyle(fontSize: 20.0),)),
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
                              sigma = num.tryParse(value);
                              if(sigma == null){
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
                        result = start(maxItr, maxTime, sigma);
                      });
                    }},
                  child: Text('Знайти'),
                  color: Colors.blue, textColor: Colors.white,
                ),
              ),
              SizedBox(height: 50.0),
              Text(result == null ? '' : ' w1 = ${result[0]} \n '
                  'w2 = ${result[1]}  \n '
                  'Iterations = ${result[2]} \n '
                  'Time = ${result[3]} s', style: TextStyle(fontSize: 30.0),),
            ]
        )
    );
  }
}