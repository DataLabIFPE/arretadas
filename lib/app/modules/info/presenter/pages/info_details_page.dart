import 'package:arretadas/app/modules/info/domain/entities/info_details.dart';
import 'package:arretadas/app/modules/info/presenter/components/details_body.dart';
import 'package:flutter/material.dart';

class InfoDetailsPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final List<InfoDetails> textos;

  const InfoDetailsPage(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.textos})
      : super(key: key);

  @override
  _InfoDetailsPageState createState() => _InfoDetailsPageState();
}

class _InfoDetailsPageState extends State<InfoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          child: DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              builder: (context, ScrollController scrollController) {
                return DetailsBody(
                  textos: widget.textos,
                  controller: scrollController,
                );
              }),
        ),
      ),
    );
  }
}
