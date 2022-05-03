
import 'package:flutter/material.dart';

import 'package:vygoda/models/data/category.dart';
import 'package:vygoda/pages/user_interf/windows/filter/catalog/select_category.dart';

class CategoryItem extends StatefulWidget {
  final int index;
  const CategoryItem(this.index, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(index);
  }
}

class InitState extends State<CategoryItem> with AutomaticKeepAliveClientMixin {
  int index;

  InitState(this.index);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 110,
      height: 110.0,
      margin: const EdgeInsets.only(
        left: 6,
        top: 3,
        bottom: 3,
      ),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            if(index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context)  => const SelectCategory()));
            } else {
              //
            }
          });
        },
        color: categoryList[index].couleur,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 0.0,
            top: 10.0,
            bottom: 15.0,
            right: 0.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  categoryList[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image(
                  image: AssetImage(categoryList[index].imageUrl),
                  height: 49.0,
                  width: 59.0,
                  alignment: Alignment.bottomRight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}