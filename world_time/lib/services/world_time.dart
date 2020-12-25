import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String loc; // UI Loc Name
  String time; // UI Time
  String flag; // UrL to flag asset
  String url; // API end point Url
  bool isDayTime;

  WorldTime({this.loc, this.flag, this.url});

  Future<void> getTime() async {
    print('getting Time');
    Map timeData = {};
    // Req
    while (timeData.isEmpty) {
      Response resp = await get('http://worldtimeapi.org/api/timezone/$url');
      var decodeSucceeded = false;
      try {
        timeData = jsonDecode(resp.body) as Map<String, dynamic>;
        decodeSucceeded = true;
      } on FormatException catch (e) {}
    }
    String datetime = timeData['datetime'];
    String offsetType = timeData['utc_offset'].substring(0, 1);
    String offsetHrs = timeData['utc_offset'].substring(1, 3);
    String offsetMins = timeData['utc_offset'].substring(4, 6);

    DateTime now = DateTime.parse(datetime);
    if (offsetType == '+') {
      now = now.add(Duration(
          hours: int.parse(offsetHrs), minutes: int.parse(offsetMins)));
    } else {
      now = now.subtract(Duration(
          hours: int.parse(offsetHrs), minutes: int.parse(offsetMins)));
    }

    // Setting TIme property
    isDayTime = now.hour > 5 && now.hour < 19 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
