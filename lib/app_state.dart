import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _searchtext = '';
  String get searchtext => _searchtext;
  set searchtext(String _value) {
    _searchtext = _value;
  }

  String _searchprice = '';
  String get searchprice => _searchprice;
  set searchprice(String _value) {
    _searchprice = _value;
  }

  String _searchchangepercentage = '';
  String get searchchangepercentage => _searchchangepercentage;
  set searchchangepercentage(String _value) {
    _searchchangepercentage = _value;
  }

  String _searchttotalvolume = '';
  String get searchttotalvolume => _searchttotalvolume;
  set searchttotalvolume(String _value) {
    _searchttotalvolume = _value;
  }

  String _searchchangepoint = '';
  String get searchchangepoint => _searchchangepoint;
  set searchchangepoint(String _value) {
    _searchchangepoint = _value;
  }

  bool _ifsearchtextnull = true;
  bool get ifsearchtextnull => _ifsearchtextnull;
  set ifsearchtextnull(bool _value) {
    _ifsearchtextnull = _value;
  }

  List<String> _watchlistt = [];
  List<String> get watchlistt => _watchlistt;
  set watchlistt(List<String> _value) {
    _watchlistt = _value;
  }

  void addToWatchlistt(String _value) {
    _watchlistt.add(_value);
  }

  void removeFromWatchlistt(String _value) {
    _watchlistt.remove(_value);
  }

  void removeAtIndexFromWatchlistt(int _index) {
    _watchlistt.removeAt(_index);
  }

  void updateWatchlisttAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _watchlistt[_index] = updateFn(_watchlistt[_index]);
  }

  void insertAtIndexInWatchlistt(int _index, String _value) {
    _watchlistt.insert(_index, _value);
  }

  String _lastwatchlistprice = '';
  String get lastwatchlistprice => _lastwatchlistprice;
  set lastwatchlistprice(String _value) {
    _lastwatchlistprice = _value;
  }

  String _firstwatchlistprice = '';
  String get firstwatchlistprice => _firstwatchlistprice;
  set firstwatchlistprice(String _value) {
    _firstwatchlistprice = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
