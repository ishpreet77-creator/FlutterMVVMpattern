import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../ViewModel/viewModel.dart';


class loginVC extends StatelessWidget {
  const loginVC({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyLoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => MyLoginPageState();
}

class MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<PersonViewModel>(
        builder: (context, personViewModel, child) {
          return Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "data   ${personViewModel.personModel?.name}",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text("data:-   ${personViewModel.personModel?.birthYear}"),
                    ElevatedButton(
                      onPressed: () {
                        personViewModel.fetchPerson();
                      },
                      child: Text('Fetch Data'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              if (personViewModel.isLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black45,
                    child: Center(
                      child: Lottie.asset(
                        'assets/animations/loader.json',
                        width: 300,
                        height: 200,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}