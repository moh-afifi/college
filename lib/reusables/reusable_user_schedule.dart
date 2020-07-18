import 'package:flutter/material.dart';
import 'package:college/components/constants.dart';
class ReusableUserSchedule extends StatelessWidget {
  ReusableUserSchedule({this.doctor,this.from,this.subject,this.to});
  final String from,to,doctor,subject ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'From:',
              style: kTextCard2,
            ),
            SizedBox(width: 10,),
            Card(
              elevation: 10,
              child: Padding(
                padding:  EdgeInsets.all(5.0),
                child: Text(
                  from,
                  style:kTextCard1,
                ),
              ),
            ),
            SizedBox(width: 40,),
            Text(
              'To:',
              style: kTextCard2,
            ),
            SizedBox(width: 10,),
            Card(
              elevation: 10,
              child: Padding(
                padding:  EdgeInsets.all(5.0),
                child: Text(
                  to,
                  style: kTextCard1,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  doctor,
                  style: kTextCard1,
                ),
              ),
            ),
            SizedBox(width: 20,),
            Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  subject,
                  style: kTextCard1,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        Divider(
          endIndent: 20.0,
          indent: 20.0,
          color: Colors.blueAccent,
        )
      ],
    );
  }
}
