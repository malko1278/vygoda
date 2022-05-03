
import 'package:flutter/material.dart';

import 'package:vygoda/color/color_constant.dart';
import 'package:vygoda/models/data/product_elt.dart';
import 'package:vygoda/pages/user_interf/windows/filter/page_view/slide/slide_dots.dart';

import 'item_product.dart';

class ProductScreen extends StatefulWidget {
  final int index;
  const ProductScreen(this.index, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InitState(this.index);
  }
}

List myColors = <Color>[
  const Color(0xFFdd2c00),
  const Color(0xFF1eb8ce),
  const Color(0xFF1de9b6),
];
Color usualColor = myColors[0];

class InitState extends State<ProductScreen> with AutomaticKeepAliveClientMixin {
  List<int> itemsDropBtn = [];
  var eltValue;
  int index;
  var objetPresent;
  var colorButtonLeft;
  var colorButtonRight;
  List<bool> isSelected = <bool>[];
  List<Color> presentColorButton = <Color>[];
  List<UnderlineInputBorder> shapesButton = <UnderlineInputBorder>[];

  var textPresentation;
  var textContentDescription;

  InitState(this.index);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      eltValue = productList[index].nbrBasket;
      for (int i = 0; i <= productList[index].quantity; i++) {
        itemsDropBtn.add(i);
      }
      objetPresent = true;
      presentColorButton.add(Colors.black54);
      presentColorButton.add(Colors.grey.shade400);
      shapesButton.add(
        const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        )
      );
      shapesButton.add(
          const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          )
      );
      colorButtonLeft = Colors.white;
      colorButtonRight = Colors.transparent;
      isSelected.add(true);
      isSelected.add(false);
      textContentDescription = 'Домашняя форма Chelsea FC 20-21, вдохновленная Лондоном как центром '
      'мужской моды, представляет собой сдержанный образ в двух оттенках синего.'
      ' Традиционный синий оттенок подчеркивается тонким сплошным трикотажем в '
      'елочку и украшен үникальными орнаментами». Одним из штрихов стал тонкий '
      'текст «Pride of London» внутри боковых полос новой домашней футболки «Челси»,'
      ' который имеют темно синий цвет. воротник и манжеты домашней футболки такое '
      'темно-синего цвета, а тонкий шевронный узор покрывает всю переднюю часть, '
      'рукава и спину.';
      textPresentation = textContentDescription;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    presentColorButton.remove(presentColorButton);
    shapesButton.remove(shapesButton);
    colorButtonLeft = null;
    colorButtonRight = null;
    isSelected.remove(isSelected);
    textPresentation = null;
    textContentDescription = null;
  }

  void _presentDescription() {
    setState(() {
      if(objetPresent == false) {
        presentColorButton.first = Colors.black54;
        presentColorButton.last = Colors.grey.shade400;
        shapesButton.first = const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        );
        shapesButton.last = const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        );
        objetPresent = true;
        textPresentation = textContentDescription;
      }
    });
  }

  void _presentCaracteristic() {
    setState(() {
      if(objetPresent == true) {
        presentColorButton.first = Colors.grey.shade400;
        presentColorButton.last = Colors.black54;
        shapesButton.first = const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        );
        shapesButton.last = const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        );
      }
      objetPresent = false;
      textPresentation = 'Нет поквзывать характеристик';
    });
  }

  void _changeColorLeft() {
    setState(() {
      if(isSelected.first == false) {
        colorButtonLeft = Colors.white;
        colorButtonRight = Colors.transparent;
        isSelected.first = true;
        isSelected.last = false;
      }
    });
  }

  void _changeColorRight() {
    setState(() {
      if(isSelected.last == false) {
        colorButtonLeft = Colors.transparent;
        colorButtonRight = Colors.white;
        isSelected.first = false;
        isSelected.last = true;
      }
    });
  }

  final _viewSlideDot = Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      for(int i = 0; i < 3; i++)
        if( i == 0 )
          SlideDots(true)
        else
          SlideDots(false)
    ],
  );

  final _oneTitle = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 8, left: 10.0, right: 10.0),
    child: const Text(
      'Артикул 13323824',
      style: TextStyle(
        color: fourtColor,
        fontSize: 12.0,
      ),
    ),
  );

  final _oneTextProduct = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
    child: const Text(
      'Тексттексттексттексттексттексттексттексттексттексттексттекст',
      style: TextStyle(
        color: firstColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _twoTitle = Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(top: 8, left: 10.0, right: 10.0),
    child: const Text(
      'Цвет на выбор:',
      style: TextStyle(
        color: fourtColor,
        fontSize: 12.0,
        // fontWeight: FontWeight.w800,
      ),
    ),
  );

  final _titleOptionsBuy = Container(
    margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
    child: const Text(
      'С этим товаром покупают',
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    ),
  );

  Color _couleur(bool valeur) {
    if(valeur == true) {
      return Colors.blue;
    }
    return Colors.grey;
  }

  void _ontappedLike() {
    setState(() {
      // _selectIndex = index;
      if(productList[index].isLiked) {
        productList[index].isLiked = false;
      } else {
        productList[index].isLiked = true;
      }
      _couleur(productList[index].isLiked);
      /**
       * Actions d'ajout du like de ce produit
       * ou du retrait du like de ce produit
       */
    });
  }

  @override
  Widget build(BuildContext context) {
    var _sizeInterface = MediaQuery.of(context).size;

    final _imageProduct = Image(
      image: const AssetImage('assets/images/t_shirt_chelsea.png'),
      height: _sizeInterface.height/2,
      width: _sizeInterface.width,
    );

    Widget buildIconBtn(Color myColor) => IconButton(
      onPressed: () {
        setState(() {
          usualColor = myColor;
        });
      },
      icon: Icon(
        Icons.circle,
        color: myColor.withOpacity(0.85),
        size: 35,
      ),
    );

    List<Widget> _boutonColorsList = [];
    for(var i = 0; i < 3; i++) {
      _boutonColorsList.add(buildIconBtn(myColors[i]));
    }

    final _roundSvet = Container(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: _boutonColorsList,
      ),
    );

    final _rowSelectNumber = Container(
      margin: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
      width: double.infinity,
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 35.0,
            // color: Colors.grey,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: thirdColor,
              // border: Border.all(color: Colors.deepOrange, width: 4),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: eltValue, // currently selected item
                items: itemsDropBtn.map((item) => DropdownMenuItem<int>(
                  child: Container(
                    padding: const EdgeInsets.only(left: 6,),
                    child: Text(
                      '$item шт.',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  value: item,
                )).toList(),
                onChanged: (value) => setState(() {
                  if(value != null) {
                    eltValue = value;
                  } else {
                    eltValue = 0;
                  }
                }),
              ),
            ),
          ),
          Container(
            width: 150.0,
            height: 35.0,
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'В наличнии 3500 шт',
                  style: TextStyle(
                    color: fourtColor,
                    fontSize: 14.0,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 135.0,
            height: 35.0,
            //color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${productList[index].prixAffich}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: firstColor,
                  ),
                ),
                const Text(
                  ' ₽/шт',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: firstColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final _optionBottom = Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      width: double.infinity,
      height: 50.0,
      // color: Colors.red,
      child: Row(
        children: <Widget>[
          SizedBox(
              height: 60.0,
              width: (((MediaQuery.of(context).size.width/4)*2)+((MediaQuery.of(context).size.width/4)/7)),
              // width: ((MediaQuery.of(context).size.width/4)*2),
              child: RaisedButton(
                child: const Text(
                  "Добавить в корзину",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {},
                elevation: 5.0,
                color: secondColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              )
          ),
          Container(
            height: 60.0,
            margin: const EdgeInsets.only(left: 2.0),
            child: FlatButton (
              child: const Text(
                "+ в спецификацию",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {},
              // elevation: 5.0,
              color: Colors.white,
              // textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );

    final _titleToggleButton = FlatButton(
      child: const Text(
        "Пожаловаться на цену",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.redAccent,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: () {
        /**
         * Cette action conduit à l'interface de tchat avec l'administraatr
         */
        /*Navigator.push(context, MaterialPageRoute(
            builder: (context)  => const CreateCompagny()),);*/
      },
      highlightColor: secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
    );

    final _toggleOption = Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      width: double.infinity,
      // height: 45.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ToggleButtons(
        isSelected: isSelected,
        children: <Widget>[
          SizedBox(
            height: 46.0,
            width: ((MediaQuery.of(context).size.width/2)-12),
            child: TextButton (
              child: const Text(
                'Отзывы (11)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: _changeColorLeft,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.black26;
                      }
                      return colorButtonLeft;
                    }
                ),
              ),
            ),
          ),
          SizedBox(
            height: 46.0,
            width: ((MediaQuery.of(context).size.width/2)-12),
            child: TextButton (
              child: const Text(
                'Вопросы и ответы (0)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: _changeColorRight,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.black26;
                      }
                      return colorButtonRight;
                    }
                ),
              ),
            ),
            // color:Colors.grey,
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
    );

    final _presentProduct = Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Row(
        children: <Widget>[
          FlatButton(
            height: 40.0,
            child: Text(
              'Описание',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: presentColorButton.first,
              ),
              textAlign: TextAlign.start,
            ),
            shape: shapesButton.first,
            onPressed: _presentDescription,
          ),
          FlatButton(
            height: 40.0,
            child: Text(
              'Характеристики',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: presentColorButton.last,
              ),
              textAlign: TextAlign.center,
            ),
            shape: shapesButton.last,
            onPressed: _presentCaracteristic,
          ),
        ],
      ),
    );

    final _textPresentation = Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Text(
        textPresentation,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black45,
        ),
        textAlign: TextAlign.start,
      ),
    );

    Widget _productToBuy(int position) {
      return SizedBox(
        width: 125,
        height: 155,
        // margin: const EdgeInsets.only(top: 10.0,),
        child: ItemProduct(position),
      );
    }

    final _showProducts = SingleChildScrollView(
      padding: const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Row(
          children: List.generate(productList.length, (position) {
            return _productToBuy(position);
          }),
        ),
      ),
    );

    final _cadrePourcent = Container(
      margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      width: double.infinity,
      height: 76.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 30.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Средняя оценка',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3.0,),
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                      SizedBox(width: 4.0,),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                      SizedBox(width: 4.0,),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                      SizedBox(width: 4.0,),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                      SizedBox(width: 4.0,),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              const Text(
                '4.7',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
              Container(
                width: 80.0,
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  '/5',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final _lastButton = Container(
        height: 46.0,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: RaisedButton(
          child: const Text(
            "Оставить отзыв",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {},
          elevation: 5.0,
          color: secondColor,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        )
    );

    final _frameOwnerName = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      width: double.infinity,
      // height: 76.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0, bottom: 20.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Имя фамилия',
                  style: TextStyle(
                    fontSize: 14,
                    color: firstColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  children: const <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18.0,
                    ),
                    SizedBox(width: 4.0,),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18.0,
                    ),
                    SizedBox(width: 4.0,),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18.0,
                    ),
                    SizedBox(width: 4.0,),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18.0,
                    ),
                    SizedBox(width: 4.0,),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18.0,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0,),
              child: Text(
                '02/08/2021',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                'Тексттексттексттексттексттексттексттексттексттексттексттекст'
                'тексттексттексттексттексттексттексттексттексттексттексттекст'
                'тексттексттексттексттексттексттексттексттексттексттексттекст',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final _foodInterface = Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(top: 20, left: 12.0, right: 10.0, bottom: 10.0,),
      child: Text(
        'Действительный цвет и текстура товаров могут незначитльно отличаться'
        ' от их изображений, представленных в приложении',
        style: TextStyle(
          color: Colors.grey.shade300,
          fontSize: 10.0,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context, false),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: firstColor,
            size: 25.0,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: _ontappedLike,
              // onPressed: () => Navigation.of(context).pop(null),
              icon: Image(
                image: const AssetImage('assets/images/like_max.png'),
                color: _couleur(productList[index].isLiked),
                height: 25.0,
                width: 25.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20,),
        child: Column(
          children: <Widget>[
            _imageProduct,
            _viewSlideDot,
            Expanded(
              child: SingleChildScrollView(
                // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _oneTitle,
                    _oneTextProduct,
                    _twoTitle,
                    _roundSvet,
                    _rowSelectNumber,
                    _optionBottom,
                    _presentProduct,
                    _textPresentation,
                    _titleOptionsBuy,
                    _showProducts,
                    _titleToggleButton,
                    _toggleOption,
                    _cadrePourcent,
                    _lastButton,
                    _frameOwnerName,
                    _foodInterface,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}