import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'charts_model.dart';
export 'charts_model.dart';

class ChartsWidget extends StatefulWidget {
  const ChartsWidget({Key? key}) : super(key: key);

  @override
  _ChartsWidgetState createState() => _ChartsWidgetState();
}

class _ChartsWidgetState extends State<ChartsWidget> {
  late ChartsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: HistoricDataYahooCall.call(
        name: FFAppState().searchtext,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final chartsHistoricDataYahooResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).accent1,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Analysis',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Lexend',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFAppState().searchtext,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context)
                          .headlineSmall
                          .override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 25.0,
                          ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 360.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: MediaQuery.sizeOf(context).height * 0.9,
                              child: FlutterFlowLineChart(
                                data: [
                                  FFLineChartData(
                                    xData: HistoricDataYahooCall.dateutc(
                                      chartsHistoricDataYahooResponse.jsonBody,
                                    )!,
                                    yData: HistoricDataYahooCall.close(
                                      chartsHistoricDataYahooResponse.jsonBody,
                                    )!,
                                    settings: LineChartBarData(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      barWidth: 2.0,
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                      ),
                                    ),
                                  )
                                ],
                                chartStylingInfo: ChartStylingInfo(
                                  enableTooltip: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  showGrid: true,
                                  borderWidth: 1.0,
                                ),
                                axisBounds: AxisBounds(),
                                xAxisLabelInfo: AxisLabelInfo(
                                  title: 'Date',
                                  titleTextStyle: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                  ),
                                ),
                                yAxisLabelInfo: AxisLabelInfo(
                                  title: 'Close Price (USD)',
                                  titleTextStyle: GoogleFonts.getFont(
                                    'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                  ),
                                  showLabels: true,
                                  labelTextStyle: GoogleFonts.getFont(
                                    'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 8.0,
                                  ),
                                  labelInterval: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Summary ',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price (USD - \$)',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        Text(
                          FFAppState().searchprice,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 25.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Open (USD - \$)',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        Text(
                          (HistoricDataYahooCall.open(
                            chartsHistoricDataYahooResponse.jsonBody,
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList()
                              .first
                              .toString(),
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 25.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Close (USD - \$)',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        Text(
                          (HistoricDataYahooCall.close(
                            chartsHistoricDataYahooResponse.jsonBody,
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList()
                              .first
                              .toString(),
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 25.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Volume',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        Text(
                          FFAppState().searchttotalvolume,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 25.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Change Percentage (in %)',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        Flexible(
                          child: Text(
                            FFAppState().searchchangepercentage,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).customColor4,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 25.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Change Point',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                        Text(
                          FFAppState().searchchangepoint,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Lexend',
                                color:
                                    FlutterFlowTheme.of(context).customColor4,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 5.0, 16.0, 4.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'Charts2',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.leftToRight,
                                  ),
                                },
                              );
                            },
                            text: 'Detailed Ananlysis',
                            options: FFButtonOptions(
                              width: 207.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
