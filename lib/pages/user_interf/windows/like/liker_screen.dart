
import 'package:flutter/material.dart';
import 'package:vygoda/pages/user_interf/windows/filter/actions/list_actions.dart';

class LikerScreen extends StatefulWidget {
  const LikerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LikerScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const ListActions('Изобранное');
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}