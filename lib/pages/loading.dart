import 'package:flutter/material.dart';
import 'package:globaltime/services/global_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpGlobalTime() async {
    GlobalTime instance = GlobalTime(
        location: 'Johannesburg', flag: 'test.png', url: 'Africa/Johannesburg');

    await instance.getTime();
    // Using the pushReplacementNamed() method to push context to the home screen
    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   'location': instance.location,
    //   'flat': instance.flag,
    //   'time': instance.time
    // });
  }

  @override
  void initState() {
    super.initState();
    setUpGlobalTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[400],
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.white,
          size: 120.0,
        ),
      ),
    );
  }
}
