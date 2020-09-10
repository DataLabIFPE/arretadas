import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class Button extends StatefulWidget {
  Button(
      {Key key,
      this.margin,
      this.width,
      this.height,
      this.txtColor,
      this.btnColor,
      this.child,
      this.fontSize,
      this.callback,
      this.fontWeight})
      : super(key: key);

  final EdgeInsets margin;
  final double width;
  final double height;
  final Color txtColor;
  final Color btnColor;
  final Widget child;
  final double fontSize;
  final Function callback;
  final FontWeight fontWeight;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  // Future<dynamic> _checkUser(email, password) async {
  //   final url = 'http://10.0.2.2:3000/exists';
  //   final isLogged =
  //       await http.post(url, body: {'email': email, 'password': password});

  //   print(isLogged.statusCode);

  //   return isLogged.statusCode;
  // }

  // Future<dynamic> _sendMessage() async {
  //   final url = 'http://10.0.2.2:3000/help';
  //   final send = await http.post(url, body: {
  //     'num1': '5583996292935',
  //     'num2': '5587999429510',
  //     'num3': '5587999914901',
  //     'num4': '5581992882988',
  //     'num5': '5587981090745'
  //   });
  //   print('enviou');
  //   return send.statusCode;
  // }

  @override
  Widget build(BuildContext context) {
    final bgColor =
        widget.btnColor != null ? widget.btnColor : Colors.transparent;
    final width = widget.width != null
        ? widget.width
        : (MediaQuery.of(context).size.width * 0.55);
    final height = widget.height != null ? widget.height : 50.0;

    return Container(
      margin: widget.margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: bgColor,
          border: Border.all(
            color: Colors.white,
          )),
      child: FlatButton(
        onPressed: widget.callback,
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
