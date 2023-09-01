import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'AllStartups/allstartupsAPI.dart';

class StartupProvider with ChangeNotifier {
  List<Map<String, dynamic>> _startupData = [];

  List<Map<String, dynamic>> get startupData => _startupData;

  Future<void> fetchStartups() async {
    try {
      final response = await http.get(Uri.parse(allstartups)); // Replace with your API URL
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final startupList = List<Map<String, dynamic>>.from(jsonResponse);
        _startupData = startupList;
        notifyListeners();
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      print('An error occurred while fetching startup data: $e');
    }
  }

  void updateStakeAvailableAndSold(String companyName, double newStakeAvailable, double newStakeSold) {
    final startupIndex = _startupData.indexWhere((startup) => startup['name'] == companyName);
    if (startupIndex != -1) {
      _startupData[startupIndex]['financials']['equityAvailableOnNA'] = newStakeAvailable;
      _startupData[startupIndex]['financials']['equitySoldOnNA'] = newStakeSold;
      notifyListeners();
    }
  }
}
