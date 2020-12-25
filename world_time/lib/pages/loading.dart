import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String text = 'Loading...';

  void setupWorldTime() async {
    WorldTime ins = WorldTime(
        loc: 'Kolkata', url: 'Asia/Kolkata', flag: 'somehtinadfads');
    await ins.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'curLoc': ins.loc,
      'curTime': ins.time,
      'curFlag': ins.flag,
      'isDayTime' : ins.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: SpinKitWave(
                color: Colors.blueGrey[700],
                size: 50,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: 'World time App', // default text style
                  children: <TextSpan>[
                    TextSpan(text: ' by', style: TextStyle( fontStyle: FontStyle.italic)),
                    TextSpan(text: ' Shreyansh ', style: TextStyle( fontWeight: FontWeight.bold)),
                  ],
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
