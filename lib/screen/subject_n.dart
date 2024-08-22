import 'package:flutter/material.dart';
import 'package:gpa_calculator/screen/gpa_calculator.dart';
import 'package:gpa_calculator/widget/Button_Container.dart';


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
            TextField(
              style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.w200 , fontFamily: 'anticSlab'),
              textAlign: TextAlign.center,
              controller: _subjectCountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number of Subjects' ),
            ),
            const SizedBox(height: 30),
            Button_Container(
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
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:  const Text('Error' ,
                      style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w300 ,fontFamily: 'caveat' ),
                      ),
                      content: const Text('You should enter number of your subjects'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child:
                          const Text('OK',
                              style:   TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300 ,
                                  color: Color(0xffffffff),
                                  fontFamily: 'playball'
                                ),
                              ),
                            ),
                      ],
                    ),
                  );
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