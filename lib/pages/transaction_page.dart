import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  bool isExpense = true;
  List <String> list = ['Makan dan Jajan', 'Transportasi', 'Nonton Film'];
  late String dropDownValue = list.first;
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Add Transaction"),),
    body: SingleChildScrollView(
      child: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
            children: [
            Switch(value: isExpense, 
            onChanged: (bool value) {
              setState(() {
                isExpense = value;
              });
            }, 
            inactiveTrackColor: Colors.blue[200], 
            inactiveThumbColor: Colors.blue,
            activeColor: Colors.red,
            ),
            Text(isExpense ? 'Expense' : 'Income', style: GoogleFonts.montserrat(fontSize: 14),)
          ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal : 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: UnderlineInputBorder(), labelText : "Amount"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Category',
              style: GoogleFonts.montserrat(fontSize: 16),
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<String>(
              value: dropDownValue,
              isExpanded: true,
              icon: Icon(Icons.arrow_downward),
              items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value,child: Text(value),);
            }).toList(), 
            onChanged: (String? value) {
          
            }),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(labelText: "Enter Date"), 
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime(2020), 
                  lastDate: DateTime(2099));
          
                if (pickedDate != null) {
                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          
                  dateController.text = formattedDate;
                }
                }
                
              ),
          ),
          SizedBox(height: 25,),
          Center(child: ElevatedButton(onPressed: () {}, child: Text("Save")))
      ],)),
    ),
    );
  }
}