import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intrests extends StatefulWidget {
  const Intrests({super.key});

  @override
  State<Intrests> createState() => _IntrestsState();
}

class _IntrestsState extends State<Intrests> {
  String intrest =
      "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
  Set<String> selectedInterests = {};
  @override
  Widget build(BuildContext context) {
    List intrests = intrest.split(" ");

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
             Text(
               "Your Interests"
               ,style: GoogleFonts.ptSans(
                 fontSize: 35,
                 color: Color(0xFF000080)
               )
             ),
          Text(intrest,style: GoogleFonts.ptSans(),),
          SizedBox(height: 20),
          Container(
            height: 45,
            child: TextField(
              
              decoration: InputDecoration(
                maintainHintHeight: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',

                border: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 158, 158, 158)),
                  borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    intrests.map((interest) {
                      bool isSelected = selectedInterests.contains(interest);
                      return ChoiceChip(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                        showCheckmark: false,
                        label: Text(interest),
                        backgroundColor: Colors.white,
                        selected: isSelected,
                        selectedColor: Color(0xFF000080),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Color(0xFF000080),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.grey),
                        ),
                        onSelected: (_) {
                          setState(() {
                            if (isSelected) {
                              selectedInterests.remove(interest);
                            } else {
                              selectedInterests.add(interest);
                            }
                          });
                        },
                      );
                    }).toList(),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
