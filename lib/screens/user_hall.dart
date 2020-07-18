import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college/reusables/reusable_user_schedule.dart';
class Hall extends StatefulWidget {
  Hall({this.appBarTitle,this.hallName});
  final String appBarTitle , hallName;
  @override
  _HallState createState() => _HallState();
}

class _HallState extends State<Hall> {
  final _firestore = Firestore.instance;
  String doctor,subject,hall,from,to;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
         widget.appBarTitle,
          style: TextStyle(fontSize: 35),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('schedule').snapshots(),
          builder: (context, snapshot) {

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                ),
              );
            }

            final items = snapshot.data.documents.reversed;

            List<ReusableUserSchedule> itemElements = [];

            for (var item in items) {
              doctor = item.data['doctor'];
              subject = item.data['subject'];
              hall = item.data['hall'];
              from = item.data['from'];
              to = item.data['to'];

              final reusableSchedule = ReusableUserSchedule(
                doctor: doctor,subject: subject,from: from,to: to,);

              if(hall== widget.hallName){
                itemElements.add(reusableSchedule);
              }
            }
            return ListView(
              padding: EdgeInsets.all(15),
              children:itemElements,
            );
          })
    );
  }
}
