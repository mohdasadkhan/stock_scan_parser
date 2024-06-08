import 'package:flutter/material.dart';
import 'package:stock_scan_parser/features/stock_list/domain/entities/entities.dart';

class StockParamScreen extends StatefulWidget {
  final VariableDetail variableDetail;
  const StockParamScreen({super.key, required this.variableDetail});

  @override
  State<StockParamScreen> createState() => _StockParamScreenState();
}

class _StockParamScreenState extends State<StockParamScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.variableDetail.type == 'indicator') {
      controller.text = widget.variableDetail.defaultValue.toString();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        title: Text(widget.variableDetail.studyType ?? ''),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: widget.variableDetail.type == 'value'
              ? ListView.builder(
                  itemCount: widget.variableDetail.values!.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            widget.variableDetail.values![index].toString(),
                            style: textTheme.headlineSmall,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider()
                      ],
                    );
                  })
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Set Parameters', style: textTheme.headlineSmall),
                    TextField(
                      autofocus: true,
                      controller: controller,
                    ),
                  ],
                )),
    );
  }
}
