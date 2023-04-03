import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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
