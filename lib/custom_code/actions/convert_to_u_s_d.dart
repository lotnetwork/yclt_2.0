// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> convertToUSD(
  double amount,
  String fromCurrency,
) async {
  // Add your function code here!
  final response = await http
      .get(Uri.parse('https://api.exchangerate-api.com/v4/latest/USD'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    // Ensure that all values are cast to double
    final rates = Map<String, double>.from(data['rates']
        .map((key, value) => MapEntry(key, (value as num).toDouble())));

    // Get the exchange rate for the fromCurrency
    final exchangeRate = rates[fromCurrency];

    if (exchangeRate != null) {
      // Convert to USD
      FFAppState().usdLivePrice = amount / exchangeRate;
      return amount / exchangeRate;
    } else {
      throw Exception('Exchange rate not found for $fromCurrency');
    }
  } else {
    throw Exception('Failed to load exchange rates');
  }
}
