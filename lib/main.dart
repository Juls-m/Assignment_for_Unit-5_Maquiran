import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Manage the state
  int sum = 0;
  int difference = 0;
  int quotient = 0;
  int product = 0;
  int firstAddNum = 0;
  int secondAddNum = 0;

  // Text controllers
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController sub1Controller = TextEditingController();
  TextEditingController sub2Controller = TextEditingController();
  TextEditingController mul1Controller = TextEditingController();
  TextEditingController mul2Controller = TextEditingController();
  TextEditingController div1Controller = TextEditingController();
  TextEditingController div2Controller = TextEditingController();

  // Functions for performing calculations
  void performAddition() {
    setState(() {
      sum = firstAddNum + secondAddNum;
    });
  }

  void performSubtraction() {
    setState(() {
      difference = firstAddNum - secondAddNum;
    });
  }

  void performMultiplication() {
    setState(() {
      product = firstAddNum * secondAddNum;
    });
  }

  void performDivision() {
    setState(() {
      if (secondAddNum != 0) {
        quotient = firstAddNum ~/ secondAddNum; // Integer division
      } else {
        quotient = 0; // Prevent division by zero
      }
    });
  }

  // Clear inputs for each operation
  void clearAdditionInputs() {
    setState(() {
      add1Controller.clear();
      add2Controller.clear();
      sum = 0;
    });
  }

  void clearSubtractionInputs() {
    setState(() {
      sub1Controller.clear();
      sub2Controller.clear();
      difference = 0;
    });
  }

  void clearMultiplicationInputs() {
    setState(() {
      mul1Controller.clear();
      mul2Controller.clear();
      product = 0;
    });
  }

  void clearDivisionInputs() {
    setState(() {
      div1Controller.clear();
      div2Controller.clear();
      quotient = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Addition Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $sum'),
              IconButton(
                icon: Icon(Icons.calculate),
                onPressed: performAddition,
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: clearAdditionInputs,
              ),
            ],
          ),
          // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: sub1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: sub2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $difference'),
              IconButton(
                icon: Icon(Icons.calculate),
                onPressed: performSubtraction,
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: clearSubtractionInputs,
              ),
            ],
          ),
          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: mul1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" * "),
              Expanded(
                child: TextField(
                  controller: mul2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $product'),
              IconButton(
                icon: Icon(Icons.calculate),
                onPressed: performMultiplication,
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: clearMultiplicationInputs,
              ),
            ],
          ),
          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: div1Controller,
                  decoration: InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" ÷ "),
              Expanded(
                child: TextField(
                  controller: div2Controller,
                  decoration: InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $quotient'),
              IconButton(
                icon: Icon(Icons.calculate),
                onPressed: performDivision,
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: clearDivisionInputs,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
