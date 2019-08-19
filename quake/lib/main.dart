import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
//import 'package:intl/intl_browser.dart';

void main() async {

  Map _data = await getQuakes();
  List _features = _data['features'];
  print(_data.runtimeType);

//  print(_data.toString() + "******************************************************************************************");
//  print("printing....." +"${_data['features'][0]['properties']['place']}");
//  print("${_data[0]['properties']['place']}");
//  var format = new DateFormat("MMMM M, y H:m");
//  var dateString = format.format(DateTime(int.parse("${_data['features'][0]['properties']['time']}")));
//  print("********************************************  " + "$dateString");
//  print("${_features[0]}");

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Quake"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new Center(
        child: new ListView.builder(

          itemCount: _features.length,
          padding: const EdgeInsets.all(15.9),
            itemBuilder: (BuildContext context, int position) {


              if(position.isOdd) return new Divider();

              final index = position ~/ 2;

              var dateTime = DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['time']);


                return new ListTile(

                  title: new Text("${dateTime}",
                    style: new TextStyle(fontSize: 18.9),),


                  subtitle: new Text("${_data['features'][index]['properties']['place']}",
                    style: new TextStyle(
                        fontSize: 13.4,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic
                    ),
                  ),


                  leading: new CircleAvatar(
                    backgroundColor: Colors.green,

                    child: new Text(
                        "${_data['features'][index]['properties']['mag']}",
                      style: new TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
                    ),
                  ),

                  onTap:() { _showDialogueBox(context, "${_features[index]['properties']['title']}"); },
                );
            }
        ),


      ),
    ),
  ));
}

void _showDialogueBox(BuildContext context, String message) {

  var alert = new AlertDialog(
    title: new Text("Details"),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: (){Navigator.pop(context);}, child: new Text("OK"))
    ],
  );

  showDialog(context: context, builder: (context) => alert);



}

Future<Map> getQuakes() async {

    String apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
}