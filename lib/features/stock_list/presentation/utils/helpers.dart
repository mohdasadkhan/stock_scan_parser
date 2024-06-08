import 'package:flutter/material.dart';
import 'package:stock_scan_parser/core/core.dart';
import 'package:stock_scan_parser/features/stock_list/presentation/utils/utils.dart';

class Helpers {
  static int stringToInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      return 0;
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static String failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.kServerFailureMessage;
      case ParsingJsonFailure:
        return Constants.kParsingJsonFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}