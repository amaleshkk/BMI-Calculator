import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/data_display.dart';
import 'package:bmi_calculator/components/display_content.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calculate_brain.dart';
import '../constants.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = kMinimumHeight;
  int weight = kminWeight;
  int age = kMinAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DataDisplay(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: DisplayContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: DataDisplay(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: DisplayContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DataDisplay(
                colour: kActiveCardColor,
                cardChild: Column(
                  children: [
                    Text('HEIGHT', style: kContentTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.round().toString(), style: kBoldTextStyle),
                        Text('cm'),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 24.0,
                        ),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x1FEB1555),
                        //activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E90),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: kMinimumHeight.toDouble(),
                        max: kMaximumHeight.toDouble(),
                        inactiveColor: Color(0xFF8D8E90),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DataDisplay(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: kContentTextStyle),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toString(), style: kBoldTextStyle),
                              Text('kg'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  if (weight > kminWeight) {
                                    setState(() {
                                      --weight;
                                    });
                                  }
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                buttonIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  if (weight < kMaxWeight) {
                                    setState(() {
                                      ++weight;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DataDisplay(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kContentTextStyle),
                          Text(age.toString(), style: kBoldTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  if (age > kMinAge) {
                                    setState(() {
                                      --age;
                                    });
                                  }
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                buttonIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  if (age < kMaxAge) {
                                    setState(() {
                                      ++age;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE YOUR BMI',
              onTap: () {
                if (selectedGender == null) {
                  return;
                }
                CalculateBrain calc = CalculateBrain(
                  height: height,
                  weight: weight,
                  age: age,
                  gender: selectedGender?.index
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmiResult: calc.calculateBMI(),
                        fatResult: calc.calculateBodyFat(),
                        resultText: calc.getResult(),
                        gender: selectedGender,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
