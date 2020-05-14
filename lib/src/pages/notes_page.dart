import 'package:flutter/material.dart';
import 'package:noteslist/src/widgets/shadowed_card.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, top: 52, right: 8, bottom: 12),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(3)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: <Widget>[
        ShadowedCard(width: 300, height: 300),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left:15, right:15, bottom: 10, top: 10),
              child:
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Write your note here!",
                        fillColor: Colors.cyan,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                          ),
                        ),
                ),
              )
            )
          ),
        ),
      ],)
    );
  }
}

