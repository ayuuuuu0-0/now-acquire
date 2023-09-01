import 'package:flutter/material.dart';

void main() {
  runApp(ComapanyIcons());
}

class ComapanyIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IconGridScreen(),
    );
  }
}

class IconGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1, // Number of columns in the grid
        children: [
          IconWidget(iconPath: 'https://s3.ap-southeast-1.amazonaws.com/cdn.store-assets.com/s/220087/f/4624480.png'),
          //IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/totv58wf5t14al4nqp2s'),
          //IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/sfdhykaf0zcn2oavawe5'),
          // IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/bn5oofempc3clkdmeokx'),
          // IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/suu3rbq04luzz6ity1my'),
          // IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/7775b203e6535b7a15c0'),
          // IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/zzbcmww62bb9fnmkodwp'),
          // IconWidget(iconPath: 'https://cms-assets.tutsplus.com/cdn-cgi/image/width=850/uploads/users/988/posts/32707/image/Placeit_2.jpg'),
          // IconWidget(iconPath: 'https://venngage-wordpress.s3.amazonaws.com/uploads/2019/01/Horizontal-Tech-Logo-Styles.png'),
          // IconWidget(iconPath: 'https://upload.wikimedia.org/wikipedia/commons/8/83/Rivian_company_logo.jpg'),
          // IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/kso8obohxvdlgjyx0j76'),
          // IconWidget(iconPath: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/dwyogvklp0f0xupqkhod'),
          // IconWidget(iconPath: 'https://rajafoods.ca/wp-content/uploads/2019/04/3D_logo2.png'),
          // Add more IconWidget for other brands as needed
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final String iconPath;

  IconWidget({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Image.network(
        iconPath,
        width: 80, // Adjust the size of the icon as needed
        height: 80,
      ),
    );
  }
}