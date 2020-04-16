import 'package:flutter/material.dart';
import 'package:globaltime/services/global_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpGlobalTime() async {
    GlobalTime instance = GlobalTime(
        location: 'Johannesburg', flag: 'test.png', url: 'Africa/Johannesburg');

    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flat': instance.flag,
      'time': instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setUpGlobalTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text('loading'),
      ),
    );
  }
}
