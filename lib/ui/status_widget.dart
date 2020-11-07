import 'package:chat_app_desktop/utils/app_constants.dart';
import 'package:flutter/material.dart';

class StatusCircle extends StatelessWidget {
  final int index;
  StatusCircle({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 80,
          margin: EdgeInsets.fromLTRB(6, 6, 8, 6),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Color(0xFFE2336B), width: 3)),
          child: IconButton(
            icon: Image.asset(status[index].profilePic, width: 60, height: 60),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 5),
        Text(status[index].name.split(' ')[0],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ))
      ],
    );
  }
}
