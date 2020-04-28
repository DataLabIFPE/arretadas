import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248,92,104,1),
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
              color: Color.fromRGBO(245, 245, 245, 1)
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
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
                          'Lei Maria da Penha',
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
                          borderRadius: const BorderRadius.all(const Radius.circular(8))
                        ),
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Lei 11.130/44',
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
                    'blablablablablabbalablalbalbalbalblalbabalbalblaabllablablablablablablablablablablablablablablablablablblablablablablablalbalbbalblablablablablablabla',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              height: 120,
              padding: EdgeInsets.fromLTRB(10, 8, 8,0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                color: Color.fromRGBO(245,245, 245, 1)
              ),
              margin: const EdgeInsets.fromLTRB(15, 15, 15, 0)
            ),
          ),
          FlatButton(
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
                          'Lei Maria da Penha',
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
                          borderRadius: const BorderRadius.all(const Radius.circular(8))
                        ),
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Lei 11.130/44',
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
                    'blablablablablabbalablalbalbalbalblalbabalbalblaabllablablablablablablablablablablablablablablablablablblablablablablablalbalbbalblablablablablablabla',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              height: 120,
              padding: EdgeInsets.fromLTRB(10, 8, 8,0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                color: Color.fromRGBO(245,245, 245, 1)
              ),
              margin: const EdgeInsets.fromLTRB(15,15,15,0),
            ),
          ),
          FlatButton(
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
                          'Lei Maria da Penha',
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
                          borderRadius: const BorderRadius.all(const Radius.circular(8))
                        ),
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Lei 11.130/44',
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
                    'blablablablablabbalablalbalbalbalblalbabalbalblaabllablablablablablablablablablablablablablablablablablblablablablablablalbalbbalblablablablablablabla',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              height: 120,
              padding: EdgeInsets.fromLTRB(10, 8, 8,0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                color: Color.fromRGBO(245,245, 245, 1)
              ),
              margin: const EdgeInsets.fromLTRB(15,15,15,0),
            ),
          ),
          FlatButton(
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
                          'Lei Maria da Penha',
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
                          borderRadius: const BorderRadius.all(const Radius.circular(8))
                        ),
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Lei 11.130/44',
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
                    'blablablablablabbalablalbalbalbalblalbabalbalblaabllablablablablablablablablablablablablablablablablablblablablablablablalbalbbalblablablablablablabla',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              height: 120,
              padding: EdgeInsets.fromLTRB(10, 8, 8,0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                color: Color.fromRGBO(245,245, 245, 1)
              ),
              margin: const EdgeInsets.fromLTRB(15,15,15,0),
            ),
          ),
          FlatButton(
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
                          'Lei Maria da Penha',
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
                          borderRadius: const BorderRadius.all(const Radius.circular(8))
                        ),
                        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Lei 11.130/44',
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
                    'blablablablablabbalablalbalbalbalblalbabalbalblaabllablablablablablablablablablablablablablablablablablblablablablablablalbalbbalblablablablablablabla',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              height: 120,
              padding: EdgeInsets.fromLTRB(10, 8, 8,0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                color: Color.fromRGBO(245,245, 245, 1)
              ),
              margin: const EdgeInsets.fromLTRB(15,15,15,0),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(248,92,104,1),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.home,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}