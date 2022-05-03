
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StaticData {
  static int selectIndex = 0;
  static int catalogIndex = 0;

  static void showSnackbar(BuildContext context, String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
  }
}