import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 170;
  int weight = 70;
  int age = 30;
  int exercise = 2;
  String? selectedGender; // "female" or "male"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LIFE EXPECTANCY',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Weight and Height
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    color: Colors.orange.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.monitor_weight, size: 40),
                        const SizedBox(height: 10),
                        const Text('Weight'),
                        Text('$weight kg', style: const TextStyle(fontSize: 18)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    color: Colors.green.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.height, size: 40),
                        const SizedBox(height: 10),
                        const Text('Height'),
                        Text('${height.toInt()} cm', style: const TextStyle(fontSize: 18)),
                        Slider(
                          value: height,
                          min: 100,
                          max: 220,
                          divisions: 120,
                          onChanged: (double value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Age and Exercise
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    color: Colors.cyan.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.cake, size: 40),
                        const Text('Age'),
                        Text('$age', style: const TextStyle(fontSize: 18)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    color: Colors.teal.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.fitness_center, size: 40),
                        const Text('Exercise (days/week)'),
                        Text('$exercise', style: const TextStyle(fontSize: 18)),
                        Slider(
                          value: exercise.toDouble(),
                          min: 0,
                          max: 7,
                          divisions: 7,
                          onChanged: (value) {
                            setState(() {
                              exercise = value.toInt();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Gender
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = "female";
                      });
                    },
                    child: MyContainer(
                      color: selectedGender == "female" ? Colors.pinkAccent : Colors.pink.shade100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.female, size: 40, color: Colors.white),
                          SizedBox(height: 10),
                          Text('Female', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = "male";
                      });
                    },
                    child: MyContainer(
                      color: selectedGender == "male" ? Colors.blueAccent : Colors.blue.shade100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.male, size: 40, color: Colors.white),
                          SizedBox(height: 10),
                          Text('Male', style: TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Calculate Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              double idealWeight = height - 100;
              double result = 80.0;

              result += (exercise * 0.8);
              result -= ((weight - idealWeight).abs() * 0.3);
              result -= (age * 0.2);

              if (selectedGender == "female") {
                result += 4;
              }

              int finalResult = result.round();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(sonuc: finalResult),
                ),
              );
            },
            child: const Text("CALCULATE", style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Custom Container Widget
class MyContainer extends StatelessWidget {
  final Color? color;
  final Widget? child;

  const MyContainer({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color ?? Colors.white,
      ),
      child: child,
    );
  }
}
