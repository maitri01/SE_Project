import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_settings_model.dart';
export 'notifications_settings_model.dart';

class NotificationsSettingsWidget extends StatefulWidget {
  const NotificationsSettingsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsSettingsWidgetState createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> {
  late NotificationsSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsSettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).grayLight,
            size: 32.0,
          ),
        ),
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/login_bg@2x.png',
            ).image,
          ),
        ),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: SpinKitSquareCircle(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 40.0,
                  ),
                ),
              );
            }
            final columnUsersRecord = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Choose what notifcations you want to recieve below and we will update the settings.',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: SwitchListTile.adaptive(
                    value: _model.switchListTileValue1 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue1 = newValue!);
                    },
                    title: Text(
                      'Push Notifications',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      'Receive Push notifications from our application on a semi regular basis.',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).tertiaryColor,
                    activeTrackColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                  ),
                ),
                SwitchListTile.adaptive(
                  value: _model.switchListTileValue2 ??= true,
                  onChanged: (newValue) async {
                    setState(() => _model.switchListTileValue2 = newValue!);
                  },
                  title: Text(
                    'Email Notifications',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  subtitle: Text(
                    'Receive email notifications from our marketing team about new features.',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  activeColor: FlutterFlowTheme.of(context).tertiaryColor,
                  activeTrackColor: FlutterFlowTheme.of(context).primaryColor,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                ),
                SwitchListTile.adaptive(
                  value: _model.switchListTileValue3 ??= true,
                  onChanged: (newValue) async {
                    setState(() => _model.switchListTileValue3 = newValue!);
                  },
                  title: Text(
                    'Location Services',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  subtitle: Text(
                    'Allow us to track your location, this helps keep track of spending and keeps you safe.',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  activeColor: FlutterFlowTheme.of(context).tertiaryColor,
                  activeTrackColor: FlutterFlowTheme.of(context).primaryColor,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pop();
                    },
                    text: 'Save Changes',
                    options: FFButtonOptions(
                      width: 190.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).textColor,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
