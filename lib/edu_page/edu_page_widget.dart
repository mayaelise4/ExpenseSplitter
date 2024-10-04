import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'edu_page_model.dart';
export 'edu_page_model.dart';

class EduPageWidget extends StatefulWidget {
  const EduPageWidget({super.key});

  @override
  State<EduPageWidget> createState() => _EduPageWidgetState();
}

class _EduPageWidgetState extends State<EduPageWidget> {
  late EduPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EduPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
        )
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Energy Bundle',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      'Good Morning',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Inter Tight',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ].divide(const SizedBox(height: 4.0)),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 12.0),
                    child: Container(
                      width: 48.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8cHJvZmlsZXxlbnwwfHx8fDE3MDgwMDcyMTR8MA&ixlib=rb-4.0.3&q=80&w=400',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                centerTitle: false,
                toolbarHeight: 72.0,
                elevation: 0.0,
              )
            : null,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Categories',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: FlutterFlowChoiceChips(
                        options: const [
                          ChipData('Chest'),
                          ChipData('Shoulders'),
                          ChipData('Arms'),
                          ChipData('Core'),
                          ChipData('Legs')
                        ],
                        onChanged: (val) => safeSetState(
                            () => _model.choiceChipsValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: FlutterFlowTheme.of(context).accent1,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 1.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        initialized: _model.choiceChipsValue != null,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          ['Chest'],
                        ),
                        wrapped: false,
                      ),
                    ),
                  ]
                      .divide(const SizedBox(width: 8.0))
                      .addToStart(const SizedBox(width: 16.0))
                      .addToEnd(const SizedBox(width: 16.0)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: const BoxDecoration(),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    16.0,
                    0,
                    16.0,
                    0,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
                      child: Container(
                        width: 200.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHx3b3Jrb3V0fGVufDB8fHx8MTcwODAxNTc1MHww&ixlib=rb-4.0.3&q=80&w=1080',
                                    width: 300.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 4.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '# of workouts',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Touch Mudder Full Body',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 4.0)),
                                ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
                      child: Container(
                        width: 200.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1581009137042-c552e485697a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMXx8d29ya291dHxlbnwwfHx8fDE3MDgwMTU3NTB8MA&ixlib=rb-4.0.3&q=80&w=400',
                                    width: 300.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 4.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '# of workouts',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'Core Buster',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 4.0)),
                                ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
                      child: Container(
                        width: 200.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8d29ya291dHxlbnwwfHx8fDE3MDgwMTU3NTB8MA&ixlib=rb-4.0.3&q=80&w=400',
                                    width: 300.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 4.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '# of workouts',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      'High Legs Workout',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 4.0)),
                                ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Top Communities',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: false,
                  textCapitalization: TextCapitalization.sentences,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Search communities...',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    errorStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: (_model.textFieldFocusNode?.hasFocus ?? false)
                        ? FlutterFlowTheme.of(context).accent1
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: (_model.textFieldFocusNode?.hasFocus ?? false)
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),

              // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
              //
              // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    44.0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1588286840104-8957b019727f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHx5b2dhfGVufDB8fHx8MTcwODAxMDkwOHww&ixlib=rb-4.0.3&q=80&w=1080',
                                width: double.infinity,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Austin, Texas',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'Divas of Austin',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'A small description about this card that helps users understand the importance of what makes this so special.',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1564769662533-4f00a87b4056?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8cm9jayUyMGNsaW1iaW5nfGVufDB8fHx8MTcwODAxOTM3OXww&ixlib=rb-4.0.3&q=80&w=1080',
                                width: double.infinity,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phoenix, Arizona',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'Boulderers of Arizona',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'A small description about this card that helps users understand the importance of what makes this so special.',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
            ].addToEnd(const SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
