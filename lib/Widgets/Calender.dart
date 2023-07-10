import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderClass extends StatefulWidget {
  @override
  State<CalenderClass> createState() => CalenderClassState();
}

class CalenderClassState extends State<CalenderClass> {

  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  selectDate(BuildContext context) async {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width,
        screenHeight = MediaQuery
            .of(context)
            .size
            .height;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 222,
      child: TextField(

        controller: dateController, //editing controller of this TextField
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
          labelText: 'Date of Incopration',
          labelStyle: TextStyle(color: Color(0xFF441256)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1, color: Color(0xFF441256),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1, color: Colors.grey,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  //get today's date
                  firstDate: DateTime(2000),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101)
              );

              if (pickedDate != null) {
                print(
                    pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                String formattedDate = DateFormat('yyyy-MM-dd').format(
                    pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                print(
                    formattedDate); //formatted date output using intl package =>  2022-07-04
                //You can format date as per your need

                setState(() {
                  dateController.text =
                      formattedDate; //set formatted date to TextField value.
                });
              } else {
                print("Date is not selected");
              }
            },
            child: Icon(Icons.calendar_today, color: Color(0xFF441256),),
          ), //icon of text field
        ),
        readOnly: true, // when true user cannot edit text
        onTap: () async {
          showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2025),
            initialEntryMode: DatePickerEntryMode.input,
          );
        },
      ),
    );
  }
}