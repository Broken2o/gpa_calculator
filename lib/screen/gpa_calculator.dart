import 'package:flutter/material.dart';
import 'package:gpa_calculator/widget/dialog.dart';
import '../widget/button_container.dart';
import 'package:gpa_calculator/widget/field.dart';
import 'package:gpa_calculator/widget/calculate_gpa.dart';


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
                          child:
                          Field( controller: markControllers[index],labelText: 'Mark'),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child:
                          Field(
                              controller: creditControllers[index],
                              labelText: 'Credits'
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ButtonContainer(
              onTap: () {
                String gpa = calculateGPA(widget.subjectCount ,markControllers,creditControllers);
                dialog(context, 'GPA', '$gpa\n');
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
