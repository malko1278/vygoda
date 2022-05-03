
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/views/user_option.dart';

import '../../../tchat_screen.dart';

class ItemUserOption extends StatefulWidget {
  final UserOption userOption;
  const ItemUserOption(this.userOption, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(userOption);
  }
}

class InitState extends State<ItemUserOption> {
  UserOption _userOption;

  InitState(this._userOption);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userOption = widget.userOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10, right: 10,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(_userOption.icon,),
                  const SizedBox(width: 10.0,),
                  Text(
                    _userOption.title,
                    style: const TextStyle(
                      color: firstColor,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              IconButton(
                // onPressed: () => Navigator.pop(context, false),
                onPressed: () {
                  if(_userOption.title == 'Чат с менеджером') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)  =>
                          const TchatScreen()
                      )
                    );
                  } else {

                  }
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade500,
                  size: 25.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
          child: Image(
            alignment: Alignment.bottomCenter,
            image: const AssetImage('assets/images/line_max.png'),
            color: Colors.grey,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}