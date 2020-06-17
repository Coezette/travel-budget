import 'package:flutter/material.dart';

import 'package:travelbudget/models/trip_model.dart';
import 'package:travelbudget/views/new_trips/new_trip_date_view.dart';

class NewTripLocationView extends StatelessWidget {
  final Trip trip;

  NewTripLocationView({@required this.trip});

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();
    _titleController.text = trip.title;

    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Trip-Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Enter thy chosen location!"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: _titleController,
                autofocus: true,
              ),
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                trip.title = _titleController.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewTripDateView(
                              trip: trip,
                            )));
              },
            )
          ],
        ),
      ),
    );
  }
}
