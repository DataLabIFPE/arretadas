import 'package:arretadas/app/modules/info/domain/entities/info_details.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatefulWidget {
  final List<InfoDetails> textos;
  final ScrollController controller;

  const DetailsBody({Key? key, required this.textos, required this.controller})
      : super(key: key);

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: ListView.builder(
            controller: widget.controller,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(bottom: 10),
                elevation: 4,
                child: ListTile(
                  leading: widget.textos[index].leading == null
                      ? null
                      : Text(
                          widget.textos[index].leading.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                  title: Text(
                    widget.textos[index].description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontWeight: widget.textos[index].leading == null
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
              );
            },
            itemCount: widget.textos.length),
      ),
    );
  }
}
