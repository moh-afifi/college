import 'package:college/screens/add_data.dart';
import 'package:flutter/material.dart';
import 'package:college/reusables/reusable_admin_card.dart';
import 'package:college/screens/admin_hall.dart';

class Admin extends StatefulWidget {
  Admin({this.id});
  final String id;
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Admin",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ReusableAdminCard(
                label: 'Hall One',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHall(docId: widget.id,appBarTitle: 'Hall One',hallName: 'hall1',),
                    ),
                  );
                },
              ),
              ReusableAdminCard(
                label: 'Hall Two',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHall(docId: widget.id,appBarTitle: 'Hall Two',hallName: 'hall2',),
                    ),
                  );
                },
              ),
            ],
          ),
          //--------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ReusableAdminCard(
                label: 'Hall Three',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHall(docId: widget.id,appBarTitle: 'Hall Three',hallName: 'hall3',),
                    ),
                  );
                },
              ),
              ReusableAdminCard(
                label: 'Hall Four',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHall(docId: widget.id,appBarTitle: 'Hall Four',hallName: 'hall4',),
                    ),
                  );
                },
              ),
            ],
          ),
          //--------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ReusableAdminCard(
                label: 'Hall Five',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHall(docId: widget.id,appBarTitle: 'Hall Five',hallName: 'hall5',),
                    ),
                  );
                },
              ),
              ReusableAdminCard(
                label: 'Hall Six',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHall(docId: widget.id,appBarTitle: 'Hall Six',hallName: 'hall6',),
                    ),
                  );
                },
              ),
            ],
          ),
          //--------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ReusableAdminCard(
                label: 'Hall Seven',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHall(docId: widget.id,appBarTitle: 'Hall Seven',hallName: 'hall7',),
                    ),
                  );
                },
              ),
              ReusableAdminCard(
                label: 'Hall Eight',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHall(docId: widget.id,appBarTitle: 'Hall Eight',hallName: 'hall8',),
                    ),
                  );
                },
              ),
            ],
          ),
          //---------------------------------------------------
          ReusableAdminCard(
            label: 'Add Data  +',
            color: Colors.cyan,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddData(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
