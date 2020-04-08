import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Contador de Pessoas',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _counter = 0;
  String _message = 'Pode Entrar';

  void _changeCounter (int delta){
    setState(() {
      _counter += delta;

      if (_counter < 0) {
        _message = 'Mundo Invertido?';
      } else if ( _counter < 10) {
        _message = 'Pode Entrar';
      } else {
        _message = 'Super Lotado!';
        _counter = 10;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Image.asset(
          "images/fundo.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pessoas: $_counter',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FlatButton(
                      child: Text(
                        '+1',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.amber
                        ),
                      ),
                      onPressed: () {
                        _changeCounter(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: FlatButton(
                      child: Text(
                        '-1',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.amber
                        ),
                      ),
                      onPressed: () {
                        _changeCounter(-1);
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _message,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white70
                ),
              )
            ],
          ),
        ),
      ],),
    );
  }
}
