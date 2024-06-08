import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:stock_scan_parser/core/core.dart';
import 'package:stock_scan_parser/features/stock_list/data/data.dart';
import 'package:stock_scan_parser/features/stock_list/domain/entities/entities.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late StockScanHttpClient stockScanHttpClient;
  late MockHttpClient mockHttpClient;
  late StockScanDataSource stockScanDataSource;
  late String url;

  setUpAll(() async {
    url = ApiUrls.stockScanParserBaseUrl; // Replace with your actual API URL
    registerFallbackValue(Uri.parse(url));
    mockHttpClient = MockHttpClient();
    stockScanHttpClient =
        UserHttpClientImpl.StockScanHttpClientImpl(client: mockHttpClient);
    stockScanDataSource = StockScanDataSourceImpl(
      httpClient: stockScanHttpClient,
    );

    final response = await http.get(Uri.parse(url), headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
    });
    final jsonResponse = response.body;

    // Mock the HTTP client to return the actual API response
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(jsonResponse, 200));
  });

  group('Stock scan data source ...', () {
    test('Should return list of Stock Scan', () async {
      // Act
      final result = await stockScanDataSource.getListOfStockScan();

      // Assert
      expect(result, isA<List<StockScan>>());
      expect(result.isNotEmpty, true);
    });
  });
}
