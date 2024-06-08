import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_scan_parser/core/network/network.dart';

final networkInfoProvider = Provider.autoDispose<NetworkInfo>((ref) {
  final connectivity = Connectivity();
  return NetworkInfoImpl(connectivity: connectivity);
});
