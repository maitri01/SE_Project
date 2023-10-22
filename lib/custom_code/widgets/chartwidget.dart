// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ignore: unnecessary_import

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:k_chart/chart_translations.dart';
import 'package:k_chart/flutter_k_chart.dart';

void main() => runApp(Chartwidget());

class Chartwidget extends StatefulWidget {
  const Chartwidget({
    Key? key,
    this.width,
    this.height,
    // required this.search,
  }) : super(key: key);

  final double? width;
  final double? height;
  // final String search;

  @override
  _ChartwidgetState createState() => _ChartwidgetState();
}

class _ChartwidgetState extends State<Chartwidget> {
  // String get searchtext => this.searchtext;
  List<KLineEntity>? datas;
  bool showLoading = true;
  MainState _mainState = MainState.MA;
  bool _volHidden = false;
  SecondaryState _secondaryState = SecondaryState.MACD;
  bool isLine = true;
  bool isChinese = false;
  bool _hideGrid = false;
  bool _showNowPrice = true;
  List<DepthEntity>? _bids, _asks;
  bool isChangeUI = false;
  bool _isTrendLine = false;
  bool _priceLeft = true;
  VerticalTextAlignment _verticalTextAlignment = VerticalTextAlignment.left;

  ChartStyle chartStyle = ChartStyle();
  ChartColors chartColors = ChartColors();

  // String get search => search;

  // get searchtext => searchtext;
  // print(searchtext);

  @override
  void initState() {
    super.initState();
    // print(searchtext);
    // getData('1day', search);
    getData('1day');
    rootBundle.loadString('assets/depth.json').then((result) {
      final parseJson = json.decode(result);
      final tick = parseJson['tick'] as Map<String, dynamic>;
      final List<DepthEntity> bids = (tick['bids'] as List<dynamic>)
          .map<DepthEntity>(
              (item) => DepthEntity(item[0] as double, item[1] as double))
          .toList();
      final List<DepthEntity> asks = (tick['asks'] as List<dynamic>)
          .map<DepthEntity>(
              (item) => DepthEntity(item[0] as double, item[1] as double))
          .toList();
      initDepth(bids, asks);
    });
  }

  void initDepth(List<DepthEntity>? bids, List<DepthEntity>? asks) {
    if (bids == null || asks == null || bids.isEmpty || asks.isEmpty) return;
    _bids = [];
    _asks = [];
    double amount = 0.0;
    bids.sort((left, right) => left.price.compareTo(right.price));
    //累加买入委托量
    bids.reversed.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _bids!.insert(0, item);
    });

    amount = 0.0;
    asks.sort((left, right) => left.price.compareTo(right.price));
    //累加卖出委托量
    asks.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _asks!.add(item);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Stack(children: <Widget>[
          Container(
            height: 500,
            width: double.infinity,
            child: KChartWidget(
              datas,
              chartStyle,
              chartColors,
              isLine: isLine,
              onSecondaryTap: () {
                print('Secondary Tap');
              },
              isTrendLine: _isTrendLine,
              mainState: _mainState,
              volHidden: _volHidden,
              secondaryState: _secondaryState,
              fixedLength: 2,
              timeFormat: TimeFormat.YEAR_MONTH_DAY,
              translations: kChartTranslations,
              showNowPrice: _showNowPrice,
              //`isChinese` is Deprecated, Use `translations` instead.
              // ignore: deprecated_member_use
              isChinese: isChinese,
              hideGrid: _hideGrid,
              isTapShowInfoDialog: false,
              verticalTextAlignment: _verticalTextAlignment,
              maDayList: [1, 100, 1000],
            ),
          ),
          if (showLoading)
            Container(
                width: double.infinity,
                height: 500,
                alignment: Alignment.center,
                child: const CircularProgressIndicator()),
        ]),
        buildButtons(),
        if (_bids != null && _asks != null)
          Container(
            height: 250,
            width: double.infinity,
            child: DepthChart(_bids!, _asks!, chartColors),
            color: Colors.white,
          )
      ],
    );
  }

  Widget buildButtons() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: <Widget>[
        button("Time Mode", onPressed: () => isLine = true),
        button("K Line Mode", onPressed: () => isLine = false),
        button("TrendLine", onPressed: () => _isTrendLine = !_isTrendLine),
        button("Line:MA", onPressed: () => _mainState = MainState.MA),
        button("Line:BOLL", onPressed: () => _mainState = MainState.BOLL),
        button("Hide Line", onPressed: () => _mainState = MainState.NONE),
        button("Secondary Chart:MACD",
            onPressed: () => _secondaryState = SecondaryState.MACD),
        button("Secondary Chart:KDJ",
            onPressed: () => _secondaryState = SecondaryState.KDJ),
        button("Secondary Chart:RSI",
            onPressed: () => _secondaryState = SecondaryState.RSI),
        button("Secondary Chart:WR",
            onPressed: () => _secondaryState = SecondaryState.WR),
        button("Secondary Chart:CCI",
            onPressed: () => _secondaryState = SecondaryState.CCI),
        button("Secondary Chart:Hide",
            onPressed: () => _secondaryState = SecondaryState.NONE),
        button(_volHidden ? "Show Vol" : "Hide Vol",
            onPressed: () => _volHidden = !_volHidden),
        // button("Change Language", onPressed: () => isChinese = !isChinese),
        button(_hideGrid ? "Show Grid" : "Hide Grid",
            onPressed: () => _hideGrid = !_hideGrid),
        button(_showNowPrice ? "Hide Now Price" : "Show Now Price",
            onPressed: () => _showNowPrice = !_showNowPrice),
        // button("Customize UI", onPressed: () {
        //   setState(() {
        //     this.isChangeUI = !this.isChangeUI;
        //     if (this.isChangeUI) {
        //       chartColors.selectBorderColor = Colors.red;
        //       chartColors.selectFillColor = Colors.red;
        //       chartColors.lineFillColor = Colors.red;
        //       chartColors.kLineColor = Colors.yellow;
        //     } else {
        //       chartColors.selectBorderColor = Color(0xff6C7A86);
        //       chartColors.selectFillColor = Color(0xff0D1722);
        //       chartColors.lineFillColor = Color(0x554C86CD);
        //       chartColors.kLineColor = Color(0xff4C86CD);
        //     }
        //   });
        // }),
        button("Change PriceTextPaint",
            onPressed: () => setState(() {
                  _priceLeft = !_priceLeft;
                  if (_priceLeft) {
                    _verticalTextAlignment = VerticalTextAlignment.left;
                  } else {
                    _verticalTextAlignment = VerticalTextAlignment.right;
                  }
                })),
      ],
    );
  }

  Widget button(String text, {VoidCallback? onPressed}) {
    return TextButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
          setState(() {});
        }
      },
      child: Text(text),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: const Size(66, 44),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0)),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  // void getData(String period, String searchtext) {
  void getData(String period) {
    /*
     * 可以翻墙使用方法1加载数据，不可以翻墙使用方法2加载数据，默认使用方法1加载最新数据
     */
    final Future<Map<String, dynamic>> future = getChatDataFromInternet(period);
    // getChatDataFromInternet(period, search);
    //final Future<String> future = getChatDataFromJson();
    future.then((Map<String, dynamic> result) {
      solveChatData(result);
    }).catchError((_) {
      showLoading = false;
      setState(() {});
      print('### datas error $_');
    });
  }

  //获取火币数据，需要翻墙
  // Future<Map<String, dynamic>> getChatDataFromInternet(
  // String? period, String search) async {

  Future<Map<String, dynamic>> getChatDataFromInternet(String? period) async {
    // var searchtext = 'AMZN';
    // var url =
    //     'https://alpha-vantage.p.rapidapi.com/query?interval=60min&function=TIME_SERIES_INTRADAY&symbol=${searchtext}&datatype=json&output_size=compact';

    // var headers = {
    //   'X-RapidAPI-Key': 'f40ef21d0bmsh98428bce74b479ep12f80bjsn3b9d2aa1a891',
    //   'X-RapidAPI-Host': 'alpha-vantage.p.rapidapi.com',
    //   'useQueryString': 'true'
    // };

    // request.headers.addAll(headers);

    // late String result;
    // final response = await http.get(Uri.parse(url), headers: headers);
    // if (response.statusCode == 200) {
    //   result = response.body;
    //   print(result);
    // } else {
    //   print('Failed getting IP address');
    // }
    // return result;

    var headers = {
      'X-RapidAPI-Key': 'f40ef21d0bmsh98428bce74b479ep12f80bjsn3b9d2aa1a891',
      'X-RapidAPI-Host': 'alpha-vantage.p.rapidapi.com',
      'useQueryString': 'true'
    };
    // String searchtextt = search;
    var searchtextt = 'GOOG';
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://alpha-vantage.p.rapidapi.com/query?interval=60min&function=TIME_SERIES_INTRADAY&symbol=${searchtextt}&datatype=json&output_size=compact'));

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;
    print(result);
    return result;
  }

  Future<String> getChatDataFromJson() async {
    return rootBundle.loadString('assets/chatData.json');
  }

  void solveChatData(Map<String, dynamic> result) {
    // print(1);
    // final Map parseJson = json.decode(result) as Map<dynamic, dynamic>;
    // print(parseJson);
    // print('adfrgtnymumi');
    // print(parseJson['Time Series (60min)']);
    // final list = parseJson['Time Series (60min)'] as List<dynamic>;
    // datas = list
    //     .map((item) => KLineEntity.fromJson(item as Map<String, dynamic>))
    //     .toList()
    //     .reversed
    //     .toList()
    //     .cast<KLineEntity>();
    var data = result;
    var data2 = Map<String, dynamic>.from(data);

    List keyy = [];
    List valuee = [];
    String y;
    List open = [];
    List close = [];
    List high = [];
    List low = [];
    List volume = [];
    List date = [];

    data2.forEach((k, v) => keyy.add(k));
    y = keyy[1];

    data2.forEach((k, v) => valuee.add(v));

    var tvalue;
    tvalue = valuee[1];

    tvalue.forEach((k, v) => open.add(v['1. open']));
    tvalue.forEach((k, v) => high.add(v['2. high']));
    tvalue.forEach((k, v) => low.add(v['3. low']));
    tvalue.forEach((k, v) => close.add(v['4. close']));
    tvalue.forEach((k, v) => volume.add(v['5. volume']));
//     tvalue.forEach((k,v)=>date.add(DateTime.utc(DateTime.parse(k).year,DateTime.parse(k).month,DateTime.parse(k).hour,DateTime.parse(k).minute,DateTime.parse(k).second)));
    tvalue.forEach((k, v) =>
        date.add(DateTime.parse(k).millisecondsSinceEpoch / (10 * 10 * 10)));

    // print(date);
    var outData = [];
    for (var i = 0; i < open.length; i++) {
      var obj = {
        "id": int.parse(date[i]),
        "open": double.parse(open[i]),
        "close": double.parse(close[i]),
        "low": double.parse(low[i]),
        "high": double.parse(high[i]),
        "amount": 343.8695674524628,
        "vol": double.parse(volume[i]),
        "count": 11881
      };
      // print("before");
      outData.add(obj);
      // print("after");
    }
    // print("fullyformed");
    print(outData);
    // datas = outData;

    print("objects na pela");
    datas = outData
        .map((item) => KLineEntity.fromJson(item as Map<String, dynamic>))
        .toList()
        .reversed
        .toList()
        .cast<KLineEntity>();
    // print("objets na agad");
    print(datas);
    // var datas=jsonEncode(outData);
    DataUtil.calculate(datas!);
    showLoading = false;
    // var data = result;
    // var data2 = Map<String, dynamic>.from(data);
    // List keyy = [];
    // List valuee = [];
    // String y;
    // List open = [];
    // List close = [];
    // List high = [];
    // List low = [];
    // List volume = [];
    // var tvalue;

    // data2.forEach((k, v) => keyy.add(k));
    // y = keyy[1];
    // data2.forEach((k, v) => valuee.add(v));
    // tvalue = valuee[1];
    // tvalue.forEach((k, v) => this.open.add(v['1. open']));
    // tvalue.forEach((k, v) => this.high.add(v['2. high']));
    // tvalue.forEach((k, v) => this.low.add(v['3. low']));
    // tvalue.forEach((k, v) => this.close.add(v['4. close']));
    // tvalue.forEach((k, v) => this.volume.add(v['5. volume']));
    // tvalue.forEach((k, v) => this.date.add(k));

    setState(() {});
  }
}
