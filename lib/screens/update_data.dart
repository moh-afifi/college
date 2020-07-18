import 'package:flutter/material.dart';
import 'package:college/reusables/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college/reusables/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UpdateData extends StatefulWidget {
  UpdateData({this.id, this.doctor, this.subject});
  final String id, doctor, subject;
  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  String doctor, subject, hall = 'hall1';
  int from = 12, to = 12;
  final _firestore = Firestore.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Data",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Builder(
        builder: (context) => ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                Text(
                  'Enter doctor:',
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    doctor = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.doctor,
                  ),
                ),
                //---------------------------------------------------
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Enter subject:',
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    subject = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.subject,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //------------------------------------------------
                Text(
                  'Choose hall:',
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('chooose'),
                  value: hall,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      hall = newValue;
                    });
                  },
                  items: <String>[
                    'hall1',
                    'hall2',
                    'hall3',
                    'hall4',
                    'hall5',
                    'hall6',
                    'hall7',
                    'hall8'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                //-------------------------------------------------
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'From:',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      onPressed: () {
                        setState(
                          () {
                            from--;
                          },
                        );
                      },
                    ),
                    Text(
                      from.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                    ),
                    RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            from++;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //------------------------------------------------------------
                Divider(
                  height: 10,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'To:',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    //Text('To:',style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
                    RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      onPressed: () {
                        setState(
                          () {
                            to--;
                          },
                        );
                      },
                    ),
                    Text(
                      to.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                    ),
                    RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            to++;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                //--------------------------------------------------
                RoundedButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    print(widget.id);
                    //------------------------
                    try {
                      await _firestore
                          .collection('schedule')
                          .document(widget.id)
                          .updateData({
                        'doctor': doctor,
                        'subject': subject,
                        'from': from.toString(),
                        'to': to.toString(),
                        'hall': hall,
                        'id': widget.id
                      });
//to delete a specific document by its id:
//                    _firestore.collection('schedule').document(id)
//                        .delete();
                      //////////////////////////////////////////////////
                      new Future.delayed(new Duration(seconds: 2), () {
                        setState(() {
                          showSpinner = false;
                        });
                        //-----------------------
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          backgroundColor: Colors.teal,
                          duration: Duration(seconds: 3),
                          content: Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Your data has been sent!"),
                            ],
                          ),
                        ));
                      });
                    } catch (e) {

                      new Future.delayed(new Duration(seconds: 3), () {
                        setState(() {
                          showSpinner = false;
                        });
                        //-----------------------
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                          content: Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_down,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Fields can\'t be empty !"),
                            ],
                          ),
                        ));
                      });

                    }
                    //////////////////////////////////////////////////
                  },
                  title: 'submit',
                  colour: Colors.teal,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
