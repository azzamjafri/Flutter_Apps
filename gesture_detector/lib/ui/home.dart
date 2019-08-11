import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {

  final String title;

  Home({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new customButton(),
      ),

    );
  }


}

class customButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Hello Gestures !"),
        backgroundColor: Theme.of(context).backgroundColor,
          duration: new Duration(milliseconds: 1200),
        );
        Scaffold.of(context).showSnackBar(snackBar);

      },
      // Actual Button
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(5.5)
        ),

        child: new Text("First Button !"),

      ),
    );
  }

}