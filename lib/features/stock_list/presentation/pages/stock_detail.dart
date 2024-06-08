import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_scan_parser/config/config.dart';
import 'package:stock_scan_parser/features/stock_list/domain/entities/entities.dart';

class StockDetailScreen extends StatelessWidget {
  final StockScan stockScan;
  const StockDetailScreen({super.key, required this.stockScan});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              tileColor: Theme.of(context).primaryColor,
              title: Text(
                stockScan.name,
                style: textTheme.headlineSmall!.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                stockScan.tag,
                style: textTheme.titleLarge!.copyWith(color: Colors.black45),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: stockScan.criteria.length,
                itemBuilder: (ctx, i) {
                  final Criteria criteria = stockScan.criteria[i];
                  // if (criteria.type.name == CriteriaType.plainText.name) {
                  //   return ListTile(
                  //     title: Text(criteria.text),
                  //   );
                  // }
                  return ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: _parseText(criteria.text, (String variable) {
                          if (criteria.variable!.containsKey(variable)) {
                            context.pushNamed(RoutesName.stockParams,
                                extra: criteria.variable![variable]);
                          }
                        }),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _parseText(String text, Function callback) {
    final regex = RegExp(r'\$\d+');
    final matches = regex.allMatches(text);
    final List<TextSpan> spans = [];
    int start = 0;

    for (final match in matches) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      final clickableText = text.substring(match.start, match.end);
      spans.add(
        TextSpan(
          text: clickableText,
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              callback(clickableText);
            },
        ),
      );
      start = match.end;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return spans;
  }
}
