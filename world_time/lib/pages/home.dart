import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImg = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color textColorPrime = data['isDayTime'] ? Colors.black : Colors.white;
    Color bgColorPrime =
        data['isDayTime'] ? Colors.blue[100] : Colors.blueGrey[900];
    Color textColorSecond = Colors.white;

    return Scaffold(
      backgroundColor: bgColorPrime,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 310, 0, 0),
            child: Column(
              children: [
                RaisedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/loc');
                    setState(() {
                      data = {
                        'curLoc': result['curLoc'],
                        'curTime': result['curTime'],
                        'curFlag': result['curFlag'],
                        'isDayTime': result['isDayTime'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: textColorSecond,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: textColorSecond),
                  ),
                  color: Colors.blueGrey[800],
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['curLoc'],
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: textColorPrime),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  data['curTime'],
                  style: TextStyle(fontSize: 66, color: textColorPrime),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
