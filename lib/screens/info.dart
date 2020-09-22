import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  Widget criaLinha({String lei, String numero, String previa}) {
    return FlatButton(
      onPressed: () {},
      child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(253, 231, 208, 1),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    padding: EdgeInsets.fromLTRB(5, 3, 10, 3),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      '$lei',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 0, 102, 1),
                        fontSize: 18.0,
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(253, 231, 208, 1),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8))),
                    padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                    margin: EdgeInsets.only(bottom: 4),
                    child: Text(
                      '$numero',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 0, 102, 1),
                        fontSize: 12.0,
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Text(
                '$previa',
                style: TextStyle(
                  color: Colors.grey,
                ),
                overflow: TextOverflow.visible,
              ),
            ],
          ),
          height: 120,
          padding: EdgeInsets.fromLTRB(10, 8, 8, 0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(20)),
              color: Color.fromRGBO(245, 245, 245, 1)),
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 92, 104, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.gavel,
                  color: Color.fromRGBO(255, 0, 102, 1),
                  size: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Leis e direitos',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontFamily: 'Exo',
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 0, 102, 1),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
                color: Color.fromRGBO(245, 245, 245, 1)),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          criaLinha(
              lei: 'Lei Maria da Penha',
              numero: 'Lei 10.512/12',
              previa:
                  'blablalbalbalblablablalbalbalblalbalbalblablablalbalbalblablalbalbalblablalbalbalblalbal'),
          criaLinha(
              lei: 'Lei Maria da Penha',
              numero: 'Lei 10.512/12',
              previa:
                  'blablalbalbalblablablalbalbalblalbalbalblablablalbalbalblablalbalbalblablalbalbalblalbal'),
          criaLinha(
              lei: 'Lei Maria da Penha',
              numero: 'Lei 10.512/12',
              previa:
                  'blablalbalbalblablablalbalbalblalbalbalblablablalbalbalblablalbalbalblablalbalbalblalbal'),
          criaLinha(
              lei: 'Lei Maria da Penha',
              numero: 'Lei 10.512/12',
              previa:
                  'blablalbalbalblablablalbalbalblalbalbalblablablalbalbalblablalbalbalblablalbalbalblalbal'),
          criaLinha(
              lei: 'Lei Maria da Penha',
              numero: 'Lei 10.512/12',
              previa:
                  'blablalbalbalblablablalbalbalblalbalbalblablablalbalbalblablalbalbalblablalbalbalblalbal'),
        ],
      ),

    );
  }
}
