
import 'package:flutter/material.dart';
import 'package:vygoda/color/color_constant.dart';

class TchatScreen extends StatefulWidget {
  const TchatScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<TchatScreen> with AutomaticKeepAliveClientMixin {
  List<Widget> _listTchatObject = [];
  var contrlTextFieldTchat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /**
     * Initialise le tchat avec les anciennes discussions si elles exitent
     */
    contrlTextFieldTchat = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    contrlTextFieldTchat = null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size _size = MediaQuery.of(context).size;

    final _getAppBar = Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 23,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 48.0,
            margin: const EdgeInsets.only(left: 10.0, top: 14.0,),
            // color: secondColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.pop(context, false),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: firstColor,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            // height: 100,
            width: _size.width-116,
            // color: Colors.red,
            margin: const EdgeInsets.only(top: 14.0,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Ваш менежер",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade400,
                  ),
                ),
                const Text(
                  "Тексттекст Тексттекст",
                  style: TextStyle(
                    fontSize: 20,
                    color: firstColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            // height: 60,
            width: 48.0,
            //color: secondColor,
            margin: const EdgeInsets.only(right: 10.0,),
          ),
        ],
      ),
    );

    /*List<Widget> _listTchatObject = [];
    for(var i = 0; i < 6; i++) {
      // _listTchatObject.add(_getObjetSlidable(i));
    }
    */
    final _contentWidgetTchat = SingleChildScrollView(
      child: Column(
        children: _listTchatObject,
      ),
      physics: const ClampingScrollPhysics(),
    );

    final _textFielTchat = Container(
      padding: const EdgeInsets.all(10),
      width: _size.width-80,
      height: 100.0,
      margin: const EdgeInsets.only(left: 10.0, ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
      child: TextField(
        controller: contrlTextFieldTchat,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          fontSize: 16,
          color: firstColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Введите текст",
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          )
        ),
      ),
    );

    final _contentEnterText = Row(
      children: <Widget>[
        _textFielTchat,
        Container(
          width: 70.0,
          height: 90.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 5.0, ),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/send.png',
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5.0, ),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/paper_clip.png',
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: thirdColor,
      body: SizedBox(
        width: double.infinity,
        height: _size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _getAppBar,
                _contentWidgetTchat,
              ],
            ),
            _contentEnterText,
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}