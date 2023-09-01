import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../Buy&sellStake/BuySellStakeBody.dart';
import 'allstartupsAPI.dart';

class AllStartupsBody extends StatefulWidget {
  late var investor;
  AllStartupsBody({required this.investor});

  @override
  State<AllStartupsBody> createState() => _AllStartupsBodyState();
}

class _AllStartupsBodyState extends State<AllStartupsBody> {
  late var InvDetails = widget.investor;
  late Future<List<dynamic>> startupData;


  @override
  void initState() {
    super.initState();
    startupData = fetchData(); // Fetch startup data when the widget initializes
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(allstartups)); // Replace with your API URL
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFF7F5FF),
        title: Image.asset('assets/images/namenlogo.png', width: 200,),
        titleSpacing: 5,
        automaticallyImplyLeading: false,),
      body: FutureBuilder<List<dynamic>>(
        future: startupData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      'Company \n Name',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                      Text(
                        'Company \n Valuation',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      final startup = snapshot.data![index];
                      final financials = startup['financials'];

                      String companyName = startup['name'];
                      String companyValuation = financials != null && financials.containsKey('companyValuation')
                          ? '₹' + financials['companyValuation'].toString()
                          : 'Company Financials \n not yet updated';

                      return Card(
                        child: ExpansionTile(
                          title: Text(
                            companyName,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            companyValuation,
                            style: TextStyle(fontSize: 16),
                          ),
                          children: [
                            ListTile(
                              title: Text('Industry: ${startup['industry']}'),
                            ),
                            ListTile(
                              title: Text(
                                  'Equity Available on NowAcquire: ${financials != null && financials.containsKey('equityAvailableOnNA') ? financials['equityAvailableOnNA'].toString() : 'N/A'}'),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => BuySellStakeBody(companyData: startup,
                                    investor: InvDetails),
                                    ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFF9B51B0),
                              ),
                              child: Text('Invest'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
