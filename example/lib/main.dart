import 'package:flutter/material.dart';
import 'package:modern_snackbar/modern_snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Snackbar Package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Modern Snackbar Package',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ModernSnackbar(
                    description: 'Modern Snackbar Custom',
                    descColor: Colors.black,
                    titleColor: Colors.purple,
                    title: 'Snackbar Custom',
                    icon: Icons.person,
                    backgroundColor: Colors.purple,
                  ).show(context); // Automatically shows the snackbar
                },
                child: const Text('Show Modern Snackbar'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  ModernSnackbar(
                    description: 'Modern Snacbar Error',
                    titleColor: Colors.red,
                    title: 'Error',
                    icon: Icons.error,
                    backgroundColor: Colors.red,
                  ).show(context); // Automatically shows the snackbar
                },
                child: const Text('Error Snackbar'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  ModernSnackbar(
                    description: 'Modern Cnackbar Success',
                    titleColor: Colors.green,
                    title: 'Success',
                    icon: Icons.check,
                    backgroundColor: Colors.green,
                  ).show(context); // Automatically shows the snackbar
                },
                child: const Text('Success Snackbar'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  ModernSnackbar(
                    description: 'Modern Snackbar Warning',
                    titleColor: Colors.yellow,
                    title: 'Waring',
                    icon: Icons.error_rounded,
                    backgroundColor: Colors.yellow,
                  ).show(context); // Automatically shows the snackbar
                },
                child: const Text('Warning Snackbar'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  ModernSnackbar(
                    description: 'Modern Snackbar Well Done',
                    titleColor: Colors.orange,
                    title: 'Well Done',
                    icon: Icons.check,
                    backgroundColor: Colors.orange,
                  ).show(context); // Automatically shows the snackbar
                },
                child: const Text('Well Done Snackbar'),
              ),
            ]),
      ),
    );
  }
}
