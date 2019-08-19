import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Screens',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _nameFieldController = new TextEditingController();

  Future _gotoNextScreen(BuildContext context) async {

    Map result = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
          builder: (BuildContext context) {
            return new NextScreen(name: _nameFieldController.text,);
          })
    );
    
    if(result != null && result.containsKey("info")) {
      print(result['info']);
      _nameFieldController.text = result['info'].toString();
    }else
      print("Nothing");

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(
                labelText: 'Enter Your Name'
              ),
            ),

          ),

          new ListTile(
            title: new RaisedButton(
                child: new Text("Send to next screen"),
                color: Colors.yellow,
                onPressed: () {_gotoNextScreen(context);}
            ),
          )
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {

  final String name;
  NextScreen({Key key, this.name}) : super(key: key);
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {

  var _backScreenController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
        backgroundColor: Colors.black12,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text("${widget.name}"),
            ),
            new ListTile(
              title: new TextField(
                controller: _backScreenController,
              ),
            ),
            new ListTile(
              title: new FlatButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'info': _backScreenController.text
                  });
                },
                color: Colors.black,
                child: new Text('Send back to previous screen ', style: new TextStyle(color: Colors.white),),

              ),
            )
          ],
        ),
      ),
    );
  }
}



