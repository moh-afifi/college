import 'package:flutter/material.dart';
import 'package:college/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableAdminSchedule extends StatefulWidget {
  ReusableAdminSchedule({this.doctor,this.from,this.subject,this.to,this.onPressed,this.onTap});
  final String from,to,doctor,subject;
  final Function onPressed,onTap;
  @override
  _ReusableAdminScheduleState createState() => _ReusableAdminScheduleState();
}

class _ReusableAdminScheduleState extends State<ReusableAdminSchedule> {

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
                  widget.from,
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
                  widget.to,
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
                  widget.doctor,
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
                  widget.subject,
                  style: kTextCard1,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(icon: Icon(FontAwesomeIcons.pen,color: Colors.teal,), onPressed: widget.onTap),
            SizedBox(width: 20,),
            IconButton(icon: Icon(FontAwesomeIcons.trash,color: Colors.red,), onPressed: widget.onPressed),
          ],
        ),
        Divider(
          endIndent: 20.0,
          indent: 20.0,
          color: Colors.blueAccent,
        )
      ],
    );
  }
}
