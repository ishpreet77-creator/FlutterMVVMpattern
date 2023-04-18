import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'ProfileModel/PersonModel.dart';
import 'ViewModel/viewModel.dart';

import 'package:provider/provider.dart';

// void main() {
//   ChangeNotifierProvider(
//     create: (context) => PersonViewModel(),
//     child: MyApp(),
//   );
// }
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PersonViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => PersonViewModel(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("MVVM Demo")),
//       body: Consumer<PersonViewModel>(
//         builder: (context, personViewModel, child) {
//           return Column(
//             children: [
//               personViewModel.isLoading
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Container(),
//               Text(
//                 "data   ${personViewModel.personModel?.name}",
//                 style: TextStyle(fontSize: 30),
//               ),
//               Text("data:-   ${personViewModel.personModel?.birthYear}"),
//               ElevatedButton(
//                 onPressed: () {
//                   personViewModel.fetchPerson();
//                 },
//                 child: Text('Fetch Data'),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
