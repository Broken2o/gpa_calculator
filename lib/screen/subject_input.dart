import 'package:flutter/material.dart';
import 'package:gpa_calculator/screen/gpa_calculator.dart';
import 'package:gpa_calculator/widget/Button_Container.dart';
import 'package:gpa_calculator/widget/dialog.dart';
import 'package:gpa_calculator/widget/field.dart';


class SubjectInputScreen extends StatelessWidget {
  final TextEditingController _subjectCountController = TextEditingController();

  SubjectInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff37364e),
        centerTitle: true,
        title: const Text(
          "GPA Calculator",
          style:   TextStyle(fontSize: 20, fontWeight: FontWeight.w500 , fontFamily: 'pacifico' ),
          ),
      ),
      body:Container(
    color: const Color(0xff222942),
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Field(controller: _subjectCountController, labelText: 'Number of Subjects'),
            const SizedBox(height: 30),
            ButtonContainer(
              onTap: () {
                int n = int.tryParse(_subjectCountController.text) ?? 0;
                if (n > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GPA_Calculator(subjectCount: n),
                    ),
                  );
                }
                else{
                  dialog(context, 'Error', 'You should enter number of your subjects');
                }
              },
              text: "Next",
            ),
          ],
        ),
      ),
    )
    );
  }
}