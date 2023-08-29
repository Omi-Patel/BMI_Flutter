import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'YourBMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Weight(in KG)'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height(in Feet)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text('Enter Your Height(in Inch)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          //BMI calculation

                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iIn = int.parse(inch);

                          var tInch = (iFt * 12) + iIn;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;

                          var bmi = iWt / (tM * tM);

                          var msg = "";

                          if (bmi > 25) {
                            msg = "You're OverWeight..!";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            msg = "You're UnderWeight..!";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You're Healthy..!";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please Fill All The Required Field..!";
                          });
                        }
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
