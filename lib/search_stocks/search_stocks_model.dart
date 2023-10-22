import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'search_stocks_widget.dart' show SearchStocksWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class SearchStocksModel extends FlutterFlowModel<SearchStocksWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for search widget.
  final searchKey = GlobalKey();
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? searchSelectedOption;
  String? Function(BuildContext, String?)? searchControllerValidator;
  // Stores action output result for [Backend Call - API (NASDAQ STOCKS)] action in Icon widget.
  ApiCallResponse? nasdaqapiResul;
  Record? audioRecorder;
  String? audiopath;
  // Stores action output result for [Backend Call - API (DG)] action in micIcon widget.
  ApiCallResponse? trancripttext;
  // Stores action output result for [Backend Call - API (NASDAQ STOCKS)] action in micIcon widget.
  ApiCallResponse? nasdaqapiResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
