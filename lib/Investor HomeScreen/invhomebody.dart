import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:now_acquire_app/Investor%20HomeScreen/CompanyImages.dart';
import 'package:now_acquire_app/Investor%20HomeScreen/chartpoint.dart';
import 'package:now_acquire_app/Investor%20HomeScreen/invhomescreen.dart';
import 'package:now_acquire_app/Investor%20HomeScreen/linechart.dart';

class InvHomeBody extends StatefulWidget {
  late var investor;
  InvHomeBody({required this.investor,});

  @override
  State<InvHomeBody> createState() => _InvHomeBodyState();
}

class _InvHomeBodyState extends State<InvHomeBody> {

  @override
  Widget build(BuildContext context) {
    late var InvDetails = widget.investor;
    //print(InvDetails);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 20,),
          Text('Welcome to your DashBoard ' + InvDetails['firstName'] + ' ' +
              InvDetails['lastName']+'!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'DM Sans'),),
          SizedBox(height: 20,),
          Center(child: Text('Your Portfolio Graph', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),)),
          LineChartWidget(ChartPoints),
          SizedBox(height: 20,),
          Center(child: Text('Your Portfolio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),)),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Company \n Name',
                style: TextStyle(color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'Current Market \n Value(Equity)',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.sort, // Replace this with your sorting icon
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: InvDetails['financials']['investments']['companies'].length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(InvDetails['financials']['investments']['companies'][index]['name'], style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                            Spacer(),
                            Column( // Nest a Column here to stack the second and third texts
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '₹' + InvDetails['financials']['investments']['companies'][index]['currMarketValue'].toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  InvDetails['financials']['investments']['companies'][index]['equityOwned'].toString() + '%',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
          ),
          SizedBox(height: 20,),
          Center(child: Text('Other Companies You can invest in', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),)),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            // Disable GridView's scrolling
            children: [
              IconWidget(iconPath: 'https://s3.ap-southeast-1.amazonaws.com/cdn.store-assets.com/s/220087/f/4624480.png'),
              IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/totv58wf5t14al4nqp2s'),
              IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/sfdhykaf0zcn2oavawe5'),
              IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/suu3rbq04luzz6ity1my'),
              IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/7775b203e6535b7a15c0'),
              IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/zzbcmww62bb9fnmkodwp'),
              IconWidget(iconPath: 'https://cms-assets.tutsplus.com/cdn-cgi/image/width=850/uploads/users/988/posts/32707/image/Placeit_2.jpg'),
              IconWidget(iconPath: 'https://venngage-wordpress.s3.amazonaws.com/uploads/2019/01/Horizontal-Tech-Logo-Styles.png'),
              IconWidget(iconPath: 'https://upload.wikimedia.org/wikipedia/commons/8/83/Rivian_company_logo.jpg'),
              IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/kso8obohxvdlgjyx0j76'),
              IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/dwyogvklp0f0xupqkhod'),
              IconWidget(iconPath: 'https://rajafoods.ca/wp-content/uploads/2019/04/3D_logo2.png'),
              // Add more IconWidget for other brands as needed
            ],
          ),
        ],
      ),
    );
  }
}




// class IconWidget extends StatelessWidget {
//   final String iconPath;
//
//   IconWidget({required this.iconPath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Image.network(
//         iconPath,
//         width: 80, // Adjust the size of the icon as needed
//         height: 80,
//       ),
//     );
//   }
// }
