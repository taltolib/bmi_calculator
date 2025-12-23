import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  final double height;
  final int weight;
  final int age;

  const ResultsPage({
    super.key,
    required this.height,
    required this.weight,
    required this.age,
  });


  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

Map<String, double> getNormalBmiRangeMale(int age) {
  if (age >= 18 && age <= 25) {
    return {'min': 19, 'max': 24};
  } else if (age >= 26 && age <= 35) {
    return {'min': 20, 'max': 25};
  } else if (age >= 36 && age <= 45) {
    return {'min': 21, 'max': 26};
  } else if (age >= 46) {
    return {'min': 22, 'max': 27};
  }
  return {'min': 19, 'max': 24};
}


double calculateBmi(double height, int weight) {
  return weight / ((height / 100) * (height / 100));
}

String getResultText(double bmi, double min, double max) {
  if (bmi < min) return 'UNDERWEIGHT';
  if (bmi > max) return 'OVERWEIGHT';
  return 'NORMAL';
}

Color getResultColor(String result) {
  switch (result) {
    case 'NORMAL':
      return Colors.green;
    case 'UNDERWEIGHT':
      return Colors.orange;
    case 'OVERWEIGHT':
      return Colors.red;
    default:
      return Colors.white;
  }
}

String getComment(String result) {
  switch (result) {
    case 'NORMAL':
      return 'You have a normal body weight. Good job!';
    case 'UNDERWEIGHT':
      return 'You have a lower than normal body weight.\nTry to eat more.';
    case 'OVERWEIGHT':
      return 'You have a higher than normal body weight.\nTry to exercise more.';
    default:
      return '';
  }
}



class _ResultsPageState extends State<ResultsPage> {
  late double bmi;
  late String result;
  late Color resultColor;
  late String comment;
  late double min;
  late double max;

  @override
  void initState() {
    super.initState();

    bmi = calculateBmi(widget.height, widget.weight);
    final range = getNormalBmiRangeMale(widget.age);
    min = range['min']!;
    max = range['max']!;
    result = getResultText(bmi, min, max);
    resultColor = getResultColor(result);
    comment = getComment(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xFF502173),
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF502173),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF6F2F9F),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.08),
                        blurRadius: 15,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          result,
                          style: TextStyle(
                            color: resultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          bmi.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                          ),
                        ),
                        Text(
                          'Normal BMI range',
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '$min - $max kg/m2',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          comment,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onDoubleTap: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            height: 50,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Color(0xFF814BAA),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'SAVE RESULT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    minimumSize: Size(double.infinity, 60),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "RE - CALCULATE",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}