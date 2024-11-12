import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'help_page_model.dart';
export 'help_page_model.dart';

class HelpPageWidget extends StatefulWidget {
  /// page designed for teaching users how to use Splitter
  const HelpPageWidget({super.key});

  @override
  State<HelpPageWidget> createState() => _HelpPageWidgetState();
}

class _HelpPageWidgetState extends State<HelpPageWidget> {
  late HelpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpPageModel());

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController6 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController7 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController8 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController9 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController10 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController11 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController12 =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Text(
                  'Help/How To',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
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
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController1,
                      child: ExpandablePanel(
                        header: Text(
                          'What is Splitter?',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Splitter is a personal finance app designed to simplify budgeting and financial management for students and young individuals in particular. With an intuitive interface and powerful features, Splitter helps you seamlessly manage your income, track upcoming bills, analyze spending, set achievable savings goals, and more. The app is tailored to meet any of your unique financial situations. By making budgeting straightforward and accessible, Splitter hopes to assist you in taking control of your finances and build healthy money habits for your future.\n',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController2,
                      child: ExpandablePanel(
                        header: Text(
                          'What is the \"Pocket\"?',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'The “Pocket” is a feature on the homepage that represents your net available capital. True to its name, it symbolizes the amount of money you currently have at your disposal. The Pocket dynamically accounts for all assets, such as income and manually added funds, while deducting outflows like bills, spending, and contributions toward financial goals. Although the Pocket is not directly linked to a real bank account, it serves as a reliable and accurate tracker that provides an up-to-date view of your financial status at your discretion.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController3,
                      child: ExpandablePanel(
                        header: Text(
                          'What is \"Splitter Education\"?',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Splitter’s mission is to transform novice budgeters into confident, skilled financial planners, and we aim to achieve this through Splitter Education. This section of the app offers you various topics related to budgeting, conveniently organized across the top of the screen for easy navigation. Each topic provides detailed yet intuitive information designed to help users build their financial knowledge step by step. Additionally, Splitter Education includes “Ask Splitter”, an AI-powered financial assistant driven by Gemini AI. Tailored to respond to any financial or budgeting questions, “Ask Splitter” ensures you receive personalized, insightful guidance whenever needed.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController4,
                      child: ExpandablePanel(
                        header: Text(
                          'Bills Page',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'The Bills Page in Splitter provides users with a clear, organized view of all upcoming and past expenses. This page displays a list of your bills, showing essential details such as due dates, amounts, and payment frequency. Users can easily add new bills, edit existing ones, and view their status. With its straightforward layout, the Bills Page helps you keep track of your financial obligations, ensuring that you stay informed and on top of your payments.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController5,
                      child: ExpandablePanel(
                        header: Text(
                          'Income Page',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'The Income Page in Splitter provides an organized overview of your income sources, including their amounts, frequencies, and dates. This page makes it easy to add new income entries, edit existing ones, and review past inflows, giving you a comprehensive view of your earnings. The Income Page helps you manage and track your finances effectively, ensuring that you have a clear understanding of your income and cash flow.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController6,
                      child: ExpandablePanel(
                        header: Text(
                          'Spending Page',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'The Spending Page in Splitter offers you a detailed log of your every day expenses, helping you to monitor all your outflows effectively. This page displays your spending activities, organized by date, with clear details such as amounts and descriptions. Users can easily add new spending entries, modify existing ones, and view past expenditures. The Spending Page provides a straightforward and comprehensive view of your spending habits, enabling you to better understand where your money goes and make informed budgeting decisions.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController7,
                      child: ExpandablePanel(
                        header: Text(
                          'Goals Page',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'The Goals Page in Splitter helps you set, track, and achieve their financial goals. Whether saving for a big purchase, an emergency fund, or a specific event, this page allows you to create and monitor your savings targets with ease. Each goal entry displays essential details such as the target amount, progress made, and timeframes. Users can add new goals, update their progress, and see an overview of how close they are to reaching their objectives. The Goals Page empowers users to stay motivated and disciplined in their savings journey, making it easier to build healthy financial habits.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController8,
                      child: ExpandablePanel(
                        header: Text(
                          'History Page',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'The History page is a list of all the main actions the user takes. It is used to see what’s been done throughout the app since account creation. The actions it tracks includes:\n\n- Adding Transactions\n- Deleting Transactions\n- Creating Goals\n- Deleting Goals\n- Adding to Goals\n- Adding to Pocket (adding money)\n- Creating Bills\n- Deleting Bills\n- Task Completion\n- Income Creation\n- Income Deletion',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController9,
                      child: ExpandablePanel(
                        header: Text(
                          'Tasks Page',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'The Tasks page houses two lists; Incomplete Tasks and Complete Tasks. These two lists track tasks that are generated from certain actions being done in the app. These tasks are things that the user must do outside of our app, because it cannot be done by the app itself.  The two actions this is focused on are paying bills, and purchasing goals. Whenever a bill due date arrives, a task relating to the bill will be created, and when a goal is reached a task relating to the goal is created. Each incomplete task can be marked as complete and vice versa.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController10,
                      child: ExpandablePanel(
                        header: Text(
                          'How to reset my password?',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Click the three bars in the top left corner of the Home Page and then navigate to “My Account”. Under “My Account” should be a button for “Reset Password”. This will take you to the reset password page.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController11,
                      child: ExpandablePanel(
                        header: Text(
                          'How to see my notifications?',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Click the three bars in the top left corner of the Home Page and then navigate to “Notifications”. This will take you to the notification center.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0x00000000),
                    child: ExpandableNotifier(
                      controller: _model.expandableExpandableController12,
                      child: ExpandablePanel(
                        header: Text(
                          'Contact us',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        expanded: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'We have a few different avenues for us to assist you at any time! These include:\n\nEmail: splitterService@gmail.com\nPhone: 123-456-7890\nAddress: 1111 makeupAddress avenue, Arlington, TX',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0x8A000000),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        theme: const ExpandableThemeData(
                          tapHeaderToExpand: true,
                          tapBodyToExpand: false,
                          tapBodyToCollapse: false,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: true,
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
    );
  }
}
