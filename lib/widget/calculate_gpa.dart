import 'package:gpa_calculator/widget/mark_function.dart';


String calculateGPA(subjectCount ,markControllers,creditControllers) {
  double totalGradePoints = 0;
  int totalCredits = 0;

  for (int i = 0; i <subjectCount; i++) {
    double mark = double.tryParse(markControllers[i].text) ?? 0.0;
    int credits = int.tryParse(creditControllers[i].text) ?? 0;
    double grade = markfunction(mark);

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