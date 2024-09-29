import 'package:first/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int weight = 75;
  int height = 180;
  double bmiValue = 22.25;
  String gender = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = "M";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 150,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: gender == "M"
                              ? const Color.fromARGB(255, 202, 186, 98)
                              : const Color.fromARGB(50, 202, 186, 98),
                        ),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.man,
                              size: 100,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = "F";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: gender == 'F'
                                ? const Color.fromARGB(255, 202, 186, 98)
                                : const Color.fromARGB(50, 202, 186, 98)),
                        padding: const EdgeInsets.all(10),
                        height: 150,
                        width: 115,
                        child: const Column(
                          children: [
                            Icon(
                              Icons.woman,
                              size: 100,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Text(
                          "$weight",
                          style: const TextStyle(
                              color: kTextColor,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Weight",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5)),
                        Row(
                          children: [
                            FloatingActionButton(
                              shape: const CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) {
                                    weight--;
                                    updateBMIValue();
                                  }
                                });
                              },
                              backgroundColor: Colors.blue,
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                              height: 20,
                            ),
                            FloatingActionButton(
                              shape: const CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  if (weight < 100) {
                                    weight++;
                                    updateBMIValue();
                                  }
                                });
                              },
                              backgroundColor: Colors.blue,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "$height",
                        style: const TextStyle(
                            color: kTextColor,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Height",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Row(
                        children: [
                          FloatingActionButton(
                            shape: const CircleBorder(),
                            onPressed: () {
                              setState(() {
                                if (height > 100) {
                                  height--;
                                  updateBMIValue();
                                }
                              });
                            },
                            backgroundColor: Colors.blue,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          FloatingActionButton(
                            shape: const CircleBorder(),
                            onPressed: () {
                              setState(() {
                                if (height < 200) {
                                  height++;
                                  updateBMIValue();
                                }
                              });
                            },
                            backgroundColor: Colors.blue,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Text(
                      bmiValue.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 80,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text("BMI",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateBMIValue() {
    bmiValue = weight / (height * height) * 10000;
  }
}
