import 'package:flutter/material.dart';
import '../widget/Button_Container.dart';

class GPA_Calculator extends StatefulWidget {
  final int subjectCount;

  GPA_Calculator({super.key, required this.subjectCount});
  String s="";

  @override
  _GPACalculator createState() => _GPACalculator();
}

class _GPACalculator extends State<GPA_Calculator> {
  late List<TextEditingController> markControllers;
  late List<TextEditingController> creditControllers;

  @override
  void initState() {
    super.initState();
    markControllers = List.generate(widget.subjectCount, (index) => TextEditingController());
    creditControllers = List.generate(widget.subjectCount, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in markControllers) {
      controller.dispose();
    }
    for (var controller in creditControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String calculateGPA() {
    double totalGradePoints = 0;
    int totalCredits = 0;

    for (int i = 0; i < widget.subjectCount; i++) {
      double mark = double.tryParse(markControllers[i].text) ?? 0.0;
      int credits = int.tryParse(creditControllers[i].text) ?? 0;
      double grade=0;

      if (mark<50.00){grade=0;}
      else if (mark<55.00){grade=1;}
      else if (mark<60.00){grade=1.5;}
      else if (mark<64.00){grade=2;}
      else if (mark<68.00){grade=2.2;}
      else if (mark<72.00){grade=2.4;}
      else if (mark<76.00){grade=2.6;}
      else if (mark<80.00){grade=2.8;}
      else if (mark<84.00){grade=3;}
      else if (mark<88.00){grade=3.2;}
      else if (mark<92.00){grade=3.4;}
      else if (mark<96.00){grade=3.7;}
      else{grade=4;}


      totalGradePoints += grade * credits;
      totalCredits += credits;
    }
    double gpa = totalCredits == 0 ? 0 : totalGradePoints / totalCredits;
    String s;

    if (gpa < 2.00) {
      s = "F, NOT good you can do better than that";
    }
    else if (gpa < 2.50) {
      s = "D, Good but you can do better than that";
    }
    else if (gpa < 3.00) {
      s = "C, Good";
    }
    else if (gpa < 3.50) {
      s = "B, Very good";
    }
    else {
      s = "A, Excellent";
    }

    return "Your GPA is ${gpa.toStringAsFixed(2)}\n$s";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color(0xff333244),
    centerTitle: true,
    title:  const Text(
          "GPA Calculator",
          style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w500 ,fontFamily: 'pacifico' ),
          ),

    ),
      body: Container(
    color: const Color(0xff242942),
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.subjectCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: markControllers[index],
                            style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.w300 , fontFamily: 'anticSlab' ),

                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(labelText: 'Mark'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: creditControllers[index],
                            style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.w300 , fontFamily: 'anticSlab' ),

                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(labelText: 'Credits'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Button_Container(
              onTap: () {
                String gpa = calculateGPA();


                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('GPA' ,
                      style:   TextStyle(fontSize: 20, fontWeight: FontWeight.w300  , fontFamily: 'pacifico'),
                    ),
                    content: Text('$gpa\n'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK',
                        style:   TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300 ,
                            color: Color(0xffFFFFFF),
                              fontFamily: 'playball'
                            ),
                        ),
                        ),

                    ],
                  ),
                );
              },
              text:'Calculate GPA',
            ),
          ],
        ),
      ),
    )
    );
  }
}
