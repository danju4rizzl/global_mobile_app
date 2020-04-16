import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //  Used ModalRoute() method to get data from context in loading screen
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      body: SafeArea(
        child: FlatButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/location');
          },
          icon: Icon(Icons.edit_location),
          label: Text('Edit Location'),
        ),
      ),
    );
  }
}
