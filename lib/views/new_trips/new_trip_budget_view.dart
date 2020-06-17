import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:travelbudget/models/trip_model.dart';

class NewTripBudgetView extends StatelessWidget {
  final db = Firestore.instance;

  final Trip trip;

  NewTripBudgetView({@required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Trip Budget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("How much will you be spending?"),
            Text("${trip.title}"),
            Text("${trip.startDate}"),
            Text("${trip.endDate}"),
            RaisedButton(
              child: Text("Finish"),
              onPressed: () async {
                //save data to firebase
                await db.collection("trips").add(
                    //added as JSON
                    /*
                    //Not very nice way way of doing it but works. Remember FACTORY methods
                    {
                      'title': trip.title,
                      'startDate': trip.startDate,
                      'endDate': trip.endDate,
                    }
                  */
                    trip.toJson());

                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            )
          ],
        ),
      ),
    );
  }
}
