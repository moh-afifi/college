import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../reusables/rounded_button.dart';
import 'package:college/screens/layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String search, entry = 'entry 1';
  //-----------------------------------
  validate(String val){
    if (val.isEmpty) {
    return 'Please enter a doctor or subject ..';
  }}
  //--------------------------------------------------------
  final _firestore = Firestore.instance;
  String doctor, subject;

  //this is the list in which we save data from fireBase:
  List<String> values = [];

  //this is the method which retrieves data from fireBase
  getData() async{
    await for( var snapshot in _firestore.collection('schedule').snapshots()){
      for(var item in snapshot.documents){
        doctor= item.data['doctor'];
        values.add(doctor);
        subject=item.data['subject'];
        values.add(subject);
      }
    }
  }
//we used initState to trigger the getData method:
  @override
  void initState() {
    getData();
    super.initState();
  }
  // this method is used for the AutoComplete Widget:
  List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(values);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
  //------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'search',
          style: TextStyle(fontSize: 35),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Builder(
        builder: (context) => ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Image.asset('images/layout.png',width: 300,height: 350,),
            SizedBox(
              height: 30,
            ),
            Text(
              'Choose Entry:',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('chooose'),
              value: entry,
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  entry = newValue;
                });
              },
              items: <String>['entry 1', 'entry 2', 'entry 3', 'entry 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            //--------------------------------------
            SizedBox(
              height: 30,
            ),
            Text(
              'Find hall:',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: this._formKey,
              child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(labelText: 'doctor or subject'),
                  controller: this._typeAheadController,

                ),
                suggestionsCallback: (pattern) {
                  return getSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadController.text = suggestion;
                },
                validator: (value) {
                  return validate(value);
                },
                onSaved: (value){
                  search=value;
                },
              ),
            ),
            //--------------------------------
            SizedBox(
              height: 20,
            ),
            //---------------------------------------
            RoundedButton(
              title: 'search',
              colour: Colors.blueAccent,
              onPressed: () {
                if (this._formKey.currentState.validate()) {
                  this._formKey.currentState.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Layout(
                        mySearch: search,
                        myEntry: entry,
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            //---------------------------------------------------
          ],
        )
      ),
    );
  }
}
