import 'package:flutter/material.dart';

class UsefulcontactDetails extends StatelessWidget {
  final String name;
  final String number;

  const UsefulcontactDetails(
      {Key? key, required this.name, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.person_pin,
                            color: Theme.of(context).primaryColor,
                            size: 40,
                          )),
                      Expanded(
                        child: Text(name,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic)),
                      )
                    ]),
                    Row(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.phone,
                              color: Theme.of(context).primaryColor, size: 40)),
                      Text(number,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18.0,
                              fontStyle: FontStyle.italic))
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
