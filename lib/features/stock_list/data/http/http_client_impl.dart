import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stock_scan_parser/core/core.dart';
import 'package:stock_scan_parser/features/stock_list/data/http/http.dart';
import 'package:stock_scan_parser/features/stock_list/domain/entities/entities.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/utils/types.dart';

class UserHttpClientImpl implements StockScanHttpClient {
  final http.Client client;

  // ignore: non_constant_identifier_names
  UserHttpClientImpl.StockScanHttpClientImpl({required this.client});

  @override
  Future<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final Map<String, String> defaultHeaders =
        headers?.cast<String, String>() ?? {}
          ..addAll({
            'content-type': 'application/json',
            'accept': 'application/json',
          });
    try {
      final response = await client.get(
        Uri.parse(url),
        headers: defaultHeaders,
      );
      return _handleRespose(response);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<dynamic> _handleRespose(
    http.Response response,
  ) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        List<dynamic> jsonData = jsonDecode(response.body);
        ListStockScan listStockScan =
            jsonData.map((e) => StockScan.fromJson(e)).toList();
        return listStockScan;
      } catch (e) {
        throw ParsingJsonException();
      }
    }
  }
}
