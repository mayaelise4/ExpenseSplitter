import '/components/nav_bar_widget.dart';
import '/components/transaction_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'spending_page_model.dart';
export 'spending_page_model.dart';

class SpendingPageWidget extends StatefulWidget {
  const SpendingPageWidget({super.key});

  @override
  State<SpendingPageWidget> createState() => _SpendingPageWidgetState();
}

class _SpendingPageWidgetState extends State<SpendingPageWidget> {
  late SpendingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpendingPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
      )
          ? AppBar(
              backgroundColor: const Color(0xFF4B39EF),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                buttonSize: 46.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Spending',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            )
          : null,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4B39EF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x32171717),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 8.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Text(
                                          'Total Spent',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xB3FFFFFF),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '\$2,502',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 24.0),
                        child: Builder(
                          builder: (context) {
                            final transactions =
                                FFAppState().Transactions.toList();
                            if (transactions.isEmpty) {
                              return Center(
                                child: Image.asset(
                                  'assets/images/noTransactions.png',
                                  width: 200.0,
                                  height: 400.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              );
                            }

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(transactions.length,
                                  (transactionsIndex) {
                                final transactionsItem =
                                    transactions[transactionsIndex];
                                return TransactionWidget(
                                  key: Key(
                                      'Keyjaw_${transactionsIndex}_of_${transactions.length}'),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarWidget(
                    whichInput: () async {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
