import 'package:flutter/material.dart';
import 'package:lab3/pages//fermat_page.dart';
import 'package:lab3/pages//genetic_page.dart';
import 'package:lab3/pages//percepton_page.dart';

void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
    )
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    MyFermatArea(),
    MyGeneticArea(),
    MyPerceptonArea(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Lab3'),
        ),
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.done_outline, size: 30), title: Text('Lab3.1')),
            BottomNavigationBarItem(icon: Icon(Icons.done_outline, size: 30), title: Text('Lab3.2')),
            BottomNavigationBarItem(icon: Icon(Icons.done_outline, size: 30), title: Text('Lab3.3')),
          ],
          selectedItemColor: Colors.blue,
          elevation: 5.0,
          unselectedItemColor: Colors.blue[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },
        )
    );
  }
}