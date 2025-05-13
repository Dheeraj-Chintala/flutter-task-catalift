import 'package:catalift_assignment/startingScreens/dreamProfession.dart';
import 'package:catalift_assignment/startingScreens/intrests.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  Widget progressBar(double progress) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,20,30,0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(30),
          
          value: progress,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF000080)),
          minHeight: 10,
        ),
      ),
    );
  }

  forward() {
    if (currentStep < interfaces.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  backward() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  int currentStep = 0;
  List<Widget> interfaces = [
    Intrests(),
    Dreamprofession(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            progressBar(currentStep + 1 / interfaces.length),
            Expanded(child: interfaces[currentStep]),
          
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.9,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF000080)
                  ),
                  
                  onPressed: forward,
                  child: Text("Continue",style: GoogleFonts.poppins(fontSize: 20),),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,

              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,30),
                child: OutlinedButton(
                  
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color.fromARGB(255, 0, 0, 153) ),
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: backward, child: Text("Back",)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
