import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'money_info_card_model.dart';
export 'money_info_card_model.dart';

class MoneyInfoCardWidget extends StatefulWidget {
  const MoneyInfoCardWidget({
    super.key,
    this.moneyText,
    double? moneyAmount,
  }) : moneyAmount = moneyAmount ?? 0.00;

  final String? moneyText;
  final double moneyAmount;

  @override
  State<MoneyInfoCardWidget> createState() => _MoneyInfoCardWidgetState();
}

class _MoneyInfoCardWidgetState extends State<MoneyInfoCardWidget> {
  late MoneyInfoCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoneyInfoCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 2.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x34000000),
              offset: Offset(
                -2.0,
                5.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 4.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF4B39EF),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.moneyText,
                          'No Desc',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF4B39EF),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 4.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  widget.moneyAmount,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                  currency: '\$',
                                ),
                                '0.00',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFF14181B),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
