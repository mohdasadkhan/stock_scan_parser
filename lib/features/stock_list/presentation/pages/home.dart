import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_scan_parser/config/config.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/providers/providers.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final listStockScanState = ref.watch(listStockScanProvider);
    final stockList = listStockScanState.stockScanList;
    final isLoading = listStockScanState.isLoading;
    final errorMessage = listStockScanState.errorMessage;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Stock Scan Parser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (stockList == null && errorMessage != null)
              Center(
                  child: Text(
                'Connect to the internt to fetch a Stock data',
                style: textTheme.bodyLarge,
              )),
            if (stockList != null)
              Expanded(
                child: ListView.builder(
                  itemCount: stockList.length,
                  itemBuilder: (ctx, index) {
                    final stock = stockList[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          stock.name,
                          style: textTheme.headlineSmall,
                        ),
                        subtitle: Text(
                          stock.tag,
                          style: textTheme.labelMedium,
                        ),
                        onTap: () {
                          context.pushNamed(
                            RoutesName.stockDetail,
                            extra: stock,
                          );
                        },
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
}
