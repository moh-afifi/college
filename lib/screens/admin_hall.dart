import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college/reusables/reusable_admin_schedule.dart';
import 'package:college/screens/update_data.dart';

class AdminHall extends StatefulWidget {
  AdminHall({this.docId, this.appBarTitle, this.hallName});
  final String docId, appBarTitle, hallName;
  @override
  _AdminHallState createState() => _AdminHallState();
}

class _AdminHallState extends State<AdminHall> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          //---------------------------------------------
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }
          //----------------------------------------------
          return ListView.builder(
            padding: EdgeInsets.all(15.0),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (_, int index) {
              String hall = snapshot.data.documents[index]["hall"];
              String doctor = snapshot.data.documents[index]["doctor"];
              String subject = snapshot.data.documents[index]["subject"];
              String from = snapshot.data.documents[index]["from"];
              String to = snapshot.data.documents[index]["to"];
              return (hall == widget.hallName)
                  ? ReusableAdminSchedule(
                      doctor: doctor,
                      subject: subject,
                      from: from,
                      to: to,
                      onPressed: () async {
                        await Firestore.instance
                            .runTransaction((Transaction myTransaction) async {
                          await myTransaction
                              .delete(snapshot.data.documents[index].reference);
                        });
                      },
                      ////////////////////////////////////////////////////////
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateData(
                              id: widget.docId,
                              doctor: doctor,
                              subject: subject,
                            ),
                          ),
                        );
                      }
                      ///////////////////////////////////////////////////////
                      )
                  : SizedBox();
            },
          );
        },
      ),
    );
  }
}
