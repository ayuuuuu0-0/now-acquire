import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class BuySellStakeBody extends StatefulWidget {
  final Map<String, dynamic> companyData;
  final Map<String, dynamic> investor;

  BuySellStakeBody({required this.companyData, required this.investor});

  @override
  State<BuySellStakeBody> createState() => _BuySellStakeBodyState();
}

class _BuySellStakeBodyState extends State<BuySellStakeBody> {
  TextEditingController _stakeController = TextEditingController();
  double stakePercentage = 0.0; // Add this line
  double rupees = 0.0;
  late var InvDetails;
  Map<String, dynamic> financials = {};// Declare financials here
  double equityAvailableOnNowAcquire = 0.0;
  double equitySoldOnNowAcquire = 0.0;

  @override
  void initState() {
    super.initState();
    financials = widget.companyData['financials'] ?? {};
    InvDetails = widget.investor;
  }

  @override
  Widget build(BuildContext context) {
    final company = widget.companyData;

    String companyName = company['name'];
    String industry = company['industry'];

    String companyValuation = financials.containsKey('companyValuation')
        ? '₹' + financials['companyValuation'].toString()
        : 'Company Financials not yet updated';
    String stakeHeldByPromoters = financials.containsKey('promoterStake')
        ? financials['promoterStake'].toString() + '%'
        : 'N/A';
    String stakeHeldByAngelInvestors = financials.containsKey('angelStake')
        ? financials['angelStake'].toString() + '%'
        : 'N/A';
    String stakeHeldByInstitutionalInvestors =
    financials.containsKey('institutionalStake')
        ? financials['institutionalStake'].toString() + '%'
        : 'N/A';
    String totalStakeDiversified = financials.containsKey('equityOnNA')
        ? financials['equityOnNA'].toString() + '%'
        : 'N/A';
    String stakeAlreadySold = financials.containsKey('equitySoldOnNA')
        ? financials['equitySoldOnNA'].toString() + '%'
        : 'N/A';
    String stakeAvailable = financials.containsKey('equityAvailableOnNA')
        ? financials['equityAvailableOnNA'].toString() + '%'
        : 'N/A';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F5FF),
        title: Image.asset('assets/images/namenlogo.png', width: 200),
        titleSpacing: 5,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company Name: $companyName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Industry: $industry', style: TextStyle(fontSize: 16)),
              SizedBox(height: 12),
              CardItem(
                label: 'Current Company Valuation:',
                value: companyValuation,
              ),
              CardItem(
                label: 'Stake Held by Promoters:',
                value: stakeHeldByPromoters,
              ),
              CardItem(
                label: 'Stake Held by\n Angel Investors:',
                value: stakeHeldByAngelInvestors,
              ),
              CardItem(
                label: 'Stake Held by \nInstitutional Investors:',
                value: stakeHeldByInstitutionalInvestors,
              ),
              CardItem(
                label: 'Total Stake Diversified\n on NowAcquire:',
                value: totalStakeDiversified,
              ),
              CardItem(
                label: 'Stake Already Sold\n on NowAcquire:',
                value: '$stakeAlreadySold%',
              ),
              CardItem(
                label: 'Stake Available\n on NowAcquire:',
                value: '$stakeAvailable%',
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showStakeDialog('Buy',companyName);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),
                    child: Text('Buy Stake'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      _showStakeDialog('Sell', companyName);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red),
                    child: Text('Sell Stake'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showStakeDialog(String transactionType, String CompanyName) async {
    final company = widget.companyData;
    String companyName = company['name'];
    double stakePercentage = 0.0;
    double rupees = 0.0;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('$transactionType Stake'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _stakeController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          stakePercentage = double.tryParse(value) ?? 0.0;

                          if (stakePercentage > 100) {
                            // Display an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(
                                  "You can't buy more than 100% equity")),
                            );
                          } else {
                            // Calculate rupees based on stake percentage and company valuation
                            double companyValuation = financials.containsKey(
                                'companyValuation')
                                ? (financials['companyValuation'] as num)
                                .toDouble()
                                : 0.0;
                            rupees = (companyValuation * stakePercentage) / 100;
                          }
                        }
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Stake Percentage (%)'),
                  ),
                  SizedBox(height: 10),
                  Text('Rupees: ₹$rupees'), // Display calculated rupees here
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    if (_stakeController.text.isNotEmpty) {
                      stakePercentage =
                          double.tryParse(_stakeController.text) ?? 0.0;

                      if (stakePercentage > 100) {
                        // Display an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(
                              "You can't buy more than 100% equity")),
                        );
                      } else {
                        // Calculate rupees based on stake percentage and company valuation
                        double companyValuation = financials.containsKey(
                            'companyValuation')
                            ? (financials['companyValuation'] as num).toDouble()
                            : 0.0;
                        rupees = (companyValuation * stakePercentage) / 100;
                        String formattedPercentage = stakePercentage.toStringAsFixed(2);

                        if (transactionType == 'Buy') {
                          buyStake(stakePercentage, rupees, formattedPercentage, companyName);
                          setState(() {
                            equityAvailableOnNowAcquire -= stakePercentage; // Update with the correct logic
                            equitySoldOnNowAcquire += stakePercentage; // Update with the correct logic
                          });
                        } else {
                          sellStake(stakePercentage, rupees, companyName, formattedPercentage);
                          setState(() {
                            equityAvailableOnNowAcquire += stakePercentage; // Update with the correct logic
                            equitySoldOnNowAcquire -= stakePercentage; // Update with the correct logic
                          });
                        }

                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }


  Future<void> buyStake(
      double percentage,
      double rupees,
      String formattedPercentage,
      String CompanyName,
      ) async {
    String userName = widget.investor['userName'] ?? ""; // Replace with the actual user name
    String transactionType = "BUY";
    double amount = rupees;
    String formattedPercentage = (percentage).toStringAsFixed(2);
    String company = widget.companyData['userName'] ?? ""; // Replace with the actual company name

    Map<String, dynamic> payload = {
      "userName": userName,
      "transactionType": transactionType,
      "amount": amount,
      "percentage": formattedPercentage,
      "company": company,
    };

    final response = await http.post(
      Uri.parse('https://now-acquire-backend.vercel.app/investor/transaction'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );

    print(response.body);
    print(payload);

    if (response.statusCode == 200) {
      print('Successfully bought stake. ${response.body}');
    } else {
      print('Failed to buy stake. Status code: ${response.statusCode}');
    }
  }


  Future<void> sellStake(
      double percentage,
      double rupees,
      String formattedPercentage,
      String CompanyName
      ) async {
    String userName = widget.investor['userName'] ?? ""; // Replace with the actual user name
    String transactionType = "SELL";
    double amount = rupees;
    String formattedPercentage = (percentage).toStringAsFixed(2);
    String company = widget.companyData['userName'] ?? ""; // Replace with the actual company name

    Map<String, dynamic> payload = {
      "userName": userName,
      "transactionType": transactionType,
      "amount": amount,
      "percentage": formattedPercentage,
      "company": company,
    };

    final response = await http.post(
      Uri.parse('https://now-acquire-backend.vercel.app/investor/transaction'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );

    print(response.body);
    print(payload);

    if (response.statusCode == 200) {
      print('Successfully sold stake. ${response.body}');
    } else {
      print('Failed to sell stake. Status code: ${response.statusCode}');
    }
  }
}

class CardItem extends StatelessWidget {
  final String label;
  final String value;

  CardItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: 16)),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}