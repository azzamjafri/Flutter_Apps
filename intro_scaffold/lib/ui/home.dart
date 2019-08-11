import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  void _onPress() => print("Search Pressed !");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlue.shade800,
        title: new Text("Fency Day"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.send),
            onPressed: () => debugPrint("Icon Tapped !"),
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: _onPress,
          ),
        ],
      ),

      // other props

      backgroundColor: Colors.lightBlue.shade200,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Azzam",
              style: new TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),

            new InkWell(
              child: new Text("Button !"),

              onTap: ()=> debugPrint("Button Tapped !"),
            )
          ],
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        tooltip: 'Going up !',
        child: new Icon(Icons.call_missed),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text("Hey!")),
        new BottomNavigationBarItem(icon: new Icon(Icons.print), title: new Text("print?")),
        new BottomNavigationBarItem(icon: new Icon(Icons.phone_missed), title: new Text("missed !"))


      ],
      onTap: (int i) => debugPrint("Hey touched $i"),
      ),
    );
  }
}
