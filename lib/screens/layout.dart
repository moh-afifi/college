import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college/reusables/reusable_positioned.dart';
import 'package:college/screens/user_hall.dart';
import 'package:college/reusables/rounded_button.dart';

class Layout extends StatefulWidget {
  Layout({this.mySearch, this.myEntry});
  final String mySearch, myEntry;
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  final _fireStore = Firestore.instance;
  String hall, doctor, subject, myHall, imageName;
  bool check=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'layout',
          style: TextStyle(fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: _fireStore.collection('schedule').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {

                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }
                final items = snapshot.data.documents;

                for (var item in items) {
                  hall = item.data['hall'];
                  doctor = item.data['doctor'];
                  subject = item.data['subject'];

                  if (widget.mySearch == doctor || widget.mySearch == subject) {
                    myHall = hall; check= true;
                  }
                  //-----------------------------------------------------------
                  if (widget.myEntry == 'entry 1' && myHall == 'hall1') {
                    imageName = '11.png';
                  } else if (widget.myEntry == 'entry 1' && myHall == 'hall2') {
                    imageName = '12.png';
                  } else if (widget.myEntry == 'entry 1' && myHall == 'hall3') {
                    imageName = '13.png';
                  } else if (widget.myEntry == 'entry 1' && myHall == 'hall4') {
                    imageName = '14.png';
                  } else if (widget.myEntry == 'entry 1' && myHall == 'hall5') {
                    imageName = '15.png';
                  } else if (widget.myEntry == 'entry 1' && myHall == 'hall6') {
                    imageName = '16.png';
                  } else if (widget.myEntry == 'entry 1' && myHall == 'hall7') {
                    imageName = '17.png';
                  } else if (widget.myEntry == 'entry 1' && myHall == 'hall8') {
                    imageName = '18.png';
                  }
                  //------------------------------------------------------------------------
                  else if (widget.myEntry == 'entry 2' && myHall == 'hall1') {
                    imageName = '21.png';
                  } else if (widget.myEntry == 'entry 2' && myHall == 'hall2') {
                    imageName = '22.png';
                  } else if (widget.myEntry == 'entry 2' && myHall == 'hall3') {
                    imageName = '23.png';
                  } else if (widget.myEntry == 'entry 2' && myHall == 'hall4') {
                    imageName = '24.png';
                  } else if (widget.myEntry == 'entry 2' && myHall == 'hall5') {
                    imageName = '25.png';
                  } else if (widget.myEntry == 'entry 2' && myHall == 'hall6') {
                    imageName = '26.png';
                  } else if (widget.myEntry == 'entry 2' && myHall == 'hall7') {
                    imageName = '27.png';
                  } else if (widget.myEntry == 'entry 2' && myHall == 'hall8') {
                    imageName = '28.png';
                  }
                  //------------------------------------------------------------------------
                  else if (widget.myEntry == 'entry 3' && myHall == 'hall1') {
                    imageName = '31.png';
                  } else if (widget.myEntry == 'entry 3' && myHall == 'hall2') {
                    imageName = '32.png';
                  } else if (widget.myEntry == 'entry 3' && myHall == 'hall3') {
                    imageName = '33.png';
                  } else if (widget.myEntry == 'entry 3' && myHall == 'hall4') {
                    imageName = '34.png';
                  } else if (widget.myEntry == 'entry 3' && myHall == 'hall5') {
                    imageName = '35.png';
                  } else if (widget.myEntry == 'entry 3' && myHall == 'hall6') {
                    imageName = '36.png';
                  } else if (widget.myEntry == 'entry 3' && myHall == 'hall7') {
                    imageName = '37.png';
                  } else if (widget.myEntry == 'entry 3' && myHall == 'hall8') {
                    imageName = '38.png';
                  }
                  //------------------------------------------------------------------------
                  else if (widget.myEntry == 'entry 4' && myHall == 'hall1') {
                    imageName = '41.png';
                  } else if (widget.myEntry == 'entry 4' && myHall == 'hall2') {
                    imageName = '42.png';
                  } else if (widget.myEntry == 'entry 4' && myHall == 'hall3') {
                    imageName = '43.png';
                  } else if (widget.myEntry == 'entry 4' && myHall == 'hall4') {
                    imageName = '44.png';
                  } else if (widget.myEntry == 'entry 4' && myHall == 'hall5') {
                    imageName = '45.png';
                  } else if (widget.myEntry == 'entry 4' && myHall == 'hall6') {
                    imageName = '46.png';
                  } else if (widget.myEntry == 'entry 4' && myHall == 'hall7') {
                    imageName = '47.png';
                  } else if (widget.myEntry == 'entry 4' && myHall == 'hall8') {
                    imageName = '48.png';
                  }
                }
                //-------------------------------------------------------------
                return  Expanded(
                  child: (check == true)? Center(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Image(
                              image: AssetImage('images/$imageName'),
                              height: 600,
                              width: 380,
                            ),
                            left: 1,
                            bottom: 1,
                          ),
                          //-------------------------
                          ReusablePositioned(
                            text: 'Hall One',
                            bottom: 470,
                            left: 250,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Hall(appBarTitle: 'Hall One',hallName: 'hall1',),
                                ),
                              );
                            },
                          ),
                          ReusablePositioned(
                            text: 'Hall Two',
                            bottom: 350,
                            left: 270,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Hall(appBarTitle: 'Hall Two',hallName: 'hall2',),
                                ),
                              );
                            },
                          ),
                          ReusablePositioned(
                            text: 'Hall Three',
                            bottom: 188,
                            left: 275,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>Hall(appBarTitle: 'Hall Three',hallName: 'hall3',),
                                ),
                              );
                            },
                          ),
                          ReusablePositioned(
                            text: 'Hall Four',
                            bottom: 80,
                            left: 250,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>Hall(appBarTitle: 'Hall Four',hallName: 'hall4',),
                                ),
                              );
                            },
                          ),
                          ReusablePositioned(
                            text: 'Hall Five',
                            bottom: 470,
                            left: 20,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Hall(appBarTitle: 'Hall Five',hallName: 'hall5',),
                                ),
                              );
                            },
                          ),
                          ReusablePositioned(
                            text: 'Hall Six',
                            bottom: 350,
                            left: 10,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Hall(appBarTitle: 'Hall Six',hallName: 'hall6',),
                                ),
                              );
                            },
                          ),
                          ReusablePositioned(
                            text: 'Hall Seven',
                            bottom: 188,
                            left: 8,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Hall(appBarTitle: 'Hall Seven',hallName: 'hall7',),
                                ),
                              );
                            },
                          ),
                          ReusablePositioned(
                            text: 'Hall Eight',
                            bottom: 80,
                            left: 15,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>Hall(appBarTitle: 'Hall Eight',hallName: 'hall8',),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      height: 600,
                      width: 380,
                    ),
                  ):Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/ex.webp'),
                      ),
                      Center(
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'No such doctor or subject exists !',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blueAccent),
                            ),
                          ),
                          elevation: 10,
                        ),
                      ),
                    RoundedButton(
                      title: 'Go Back',
                      colour: Colors.blueAccent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                    ],
                  ),
                ) ;
              }),
          //-------------------------------------------------------

        ],
      ),
    );
  }
}
