import 'package:arretadas/modules/friendcontacts/controller/friendcontacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Warning extends StatelessWidget {
  const Warning({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (_) => FriendContactController()..findFriendcontacts(),
        child: WarningContent(),
      ),
    );
  }
}

class WarningContent extends StatefulWidget {
  const WarningContent({Key key}) : super(key: key);

  @override
  _WarningContentState createState() => _WarningContentState();
}

class _WarningContentState extends State<WarningContent> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    final controller = context.read<FriendContactController>();
    controller.addListener(() {
      if (controller.isVisible) {
        setState(() {
          isVisible = true;
        });
      } else {
        setState(() {
          isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Visibility(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/warning.png',
                width: 30,
              ),
              Text('Lembre-se de cadastrar seus amigos.'),
            ],
          ),
        ),
        visible: isVisible,
      ),
    );
  }
}
