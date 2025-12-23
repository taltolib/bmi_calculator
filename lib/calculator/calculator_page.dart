import 'package:flutter/material.dart';
import 'package:bmi_calculator/calculator/results_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

enum GenderType { male, female }

class _CalculatorPageState extends State<CalculatorPage> {
  GenderType? _genderSelection;
  double _value = 150;
  int _weight = 50;
  int _age = 20;

  void results() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultsPage(height: _value, age: _age, weight: _weight),
      ),
    );
  }

  calculatorAgeRemove() {
    setState(() {
      if (_age > 1) _age--;
    });
  }

  calculatorAgeAdd() {
    setState(() {
      _age++;
    });
  }

  calculatorWeightAdd() {
    setState(() {
      _weight++;
    });
  }

  calculatorWeightRemove() {
    setState(() {
      if (_weight > 1) _weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            spacing: 15,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  spacing: 15,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _genderSelection = GenderType.male;
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: 160,
                        decoration: BoxDecoration(
                          color: _genderSelection == GenderType.male
                              ? Color(0xFF814BAA)
                              : Color(0xFF6F2F9F),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male, color: Colors.blue, size: 50),
                            SizedBox(height: 2),
                            Text(
                              'MALE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _genderSelection = GenderType.female;
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: 160,
                        decoration: BoxDecoration(
                          color: _genderSelection == GenderType.female
                              ? Color(0xFF814BAA)
                              : Color(0xFF6F2F9F),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female, color: Colors.red, size: 50),
                            SizedBox(height: 2),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
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
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'HEIGHT',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _value.round().toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 9),
                                    Text(
                                      'cm',
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTickMarkColor: Colors.white24,
                            thumbColor: Color(0xFFA281B8),
                            overlayColor: Color(0xFFA281B8),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 12.0,
                            ),
                            trackHeight: 4.0,
                          ),
                          child: Slider(
                            min: 0,
                            max: 250,
                            value: _value,
                            onChanged: (val) {
                              setState(() => _value = val);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  spacing: 15,
                  children: [
                    Row(
                      spacing: 15,
                      children: [
                        Container(
                          width: 160,
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
                            padding: EdgeInsets.only(
                              top: 30,
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  _weight.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 40,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 10,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          calculatorWeightRemove();
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA281B8),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          calculatorWeightAdd();
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA281B8),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 15,
                      children: [
                        Container(
                          width: 160,
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
                            padding: EdgeInsets.only(
                              top: 30,
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'AGE',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  _age.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 40,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 10,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          calculatorAgeRemove();
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA281B8),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onLongPress: () {
                                        setState(() {
                                          calculatorAgeAdd();
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA281B8),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    minimumSize: Size(double.infinity, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      results();
                    });
                  },
                  child: Text(
                    "CALCULATE",
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
