import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../util/utils.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {

  String _city;

  Future _gotoNextScreen(BuildContext context) async {

    Map results = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
          builder: (BuildContext context) {
            return new ChangeCity();
          })
    );

    if(results != null && results.containsKey('city')) {
//      print(results['city'].toString());
        _city = results['city'].toString();
    }else{
      _city = util.defaultCity;
    }

  }
  

  void getStuff() async {
    Map data = await getWeather(util.apiId, util.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: new Text("Klimatic", style: new TextStyle(fontWeight: FontWeight.w800),),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {_gotoNextScreen(context);}
          )

        ],
      ),

      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset("images/umbrella.png",
              width: 490.0,
              height: 1200.0 ,
              fit: BoxFit.fill,
            ),

          ),


          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: new Text("${_city == null ? util.defaultCity : _city}",
              style: cityStyle(),
            ),
          ),
          
          
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/light_rain.png'),
          ),

          updateTempWidget("${_city == null ? util.defaultCity : _city}")

          // Container for weather data.

//          new Container(
////            margin: const EdgeInsets.fromLTRB(30.0, 310.0, 0.0, 0.0),
////            alignment: Alignment.center,
//            child: updateTempWidget("${_city == null ? util.defaultCity : _city}"),
//          )
          
        ],
      ),

    );
  }

  Future<Map> getWeather(String apiId, String city) async {

    String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.apiId}&units=metric';

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);

  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
      future: getWeather(util.apiId, city == null ? util.defaultCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        // Get all of the jon, and set up widgets.

        if(snapshot.hasData) {
          Map content = snapshot.data;

          return new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 310.0, 0.0, 0.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ListTile(
                  title: new Text(content['main']['temp'].toString() + " C",
                  style: new TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 49.9,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                  ),
                  subtitle: new ListTile(
                    title: new Text(
                      "Humidity: ${content['main']['humidity'].toString()} \n"
                          "Min: ${content['main']['temp_min'].toString()} C\n"
                          "Max: ${content['main']['temp_max'].toString()} C\n"
                          " \t\t\t\t ${content['weather'][0]['main'].toString()}",

                      style: extraDataStyle(),
                    ),
                  ),

                )
              ],
            ),
          );
        }else{
          return new Container();
        }

      },
    );
  }


}



class ChangeCity extends StatelessWidget {

  var _cityFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Change City'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
         new Center(
           child:  new Image.asset('images/white_snow.png',
             width: 490.0,
             height: 1200.0,
             fit: BoxFit.fill,),
         ),

          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter City',
                  ),
                  controller: _cityFieldController,
                ),
              ),
              
              new ListTile(
                title: new FlatButton(
                    onPressed: () {
                      Navigator.pop(context, {
                      'city': _cityFieldController == null ? util.defaultCity : _cityFieldController.text
                      });
                    },
                    color: Colors.redAccent,
                    textColor: Colors.white70,
                    child: new Text("Get Weather")
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}




TextStyle extraDataStyle() {
  return new TextStyle(
    color: Colors.white70,
    fontStyle: FontStyle.normal,
    fontSize: 17.9,
  );
}

TextStyle cityStyle() {

  return new TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.7,
  );
}