import 'package:flutter/material.dart';

import 'config/router/router.dart';


class StockScanParser extends StatelessWidget {
  const StockScanParser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Stock Scan Parser',
      routerConfig: RoutesConfig.routeConfig,
    );
  }
}
