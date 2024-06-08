import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_scan_parser/config/router/router.dart';
import 'package:stock_scan_parser/features/stock_list/domain/entities/entities.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/pages/pages.dart';

final routes = [
  GoRoute(
    path: '/',
    name: RoutesName.home,
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const Home(),
    routes: [
      GoRoute(
        path: 'stock-detail',
        name: RoutesName.stockDetail,
        parentNavigatorKey: RoutesConfig.navigationKey,
        pageBuilder: (context, state) {
          final StockScan stockScan = state.extra as StockScan;
          return CustomTransitionPage(
            key: state.pageKey,
            child: StockDetailScreen(stockScan: stockScan),
            transitionsBuilder: (ctx, animation, animation2, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: 'stock-param',
        name: RoutesName.stockParams,
        parentNavigatorKey: RoutesConfig.navigationKey,
        pageBuilder: (context, state) {
          final VariableDetail variableDetail = state.extra as VariableDetail;
          return CustomTransitionPage(
            key: state.pageKey,
            child: StockParamScreen(variableDetail: variableDetail),
            transitionsBuilder: (ctx, animation, animation2, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      )
    ],
  ),
];
