import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return new LoginState();
  }

}

class LoginState extends State<Login> {

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcome = "";

  void _erase(){

    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome() {

    setState(() {

      if(_userController.text.isNotEmpty
      && _passwordController.text.isNotEmpty) {
        _welcome = "Welcome, " + _userController.text;
      }else {
        _welcome = "Invalid Details !";
      }

    });
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            //image/profile
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.lightGreen,
            ),

            //form
            new Container(
              height: 179.0,
              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: "username",
                      icon: new Icon(Icons.person)
                    ),
                  ),

                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: "password",
                      icon: new Icon(Icons.lock)
                    ),
                    obscureText: true,
                  ),
  
                  new Padding(padding: new EdgeInsets.all(10.5)), // add pading
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        //Login button
                        new Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(
                              onPressed: _showWelcome,
                              color: Colors.redAccent,
                              child: new Text("Login", style: new TextStyle(color: Colors.white, fontSize: 16.9),),

                          ),
                        ),

                        // Clear button
                        new Container(
                          margin: const EdgeInsets.only(left: 110.0),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.redAccent,
                            child: new Text("Clear", style: new TextStyle(color: Colors.white, fontSize: 16.9),),

                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),

            ),// Forms End here
            
            new Padding(padding: const EdgeInsets.all(20.5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_welcome" ,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 25.4,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),

          ],
        ),


      ),
    );

  }
}