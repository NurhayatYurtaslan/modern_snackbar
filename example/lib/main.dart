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
      title: 'Modern Snackbar Example',
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
          'Modern Snackbar Example',
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
                  const ModernSnackbar(
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
                  const ModernSnackbar(
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
                  const ModernSnackbar(
                    titleColor: Colors.green,
                    title: 'Success',
                    icon: Icons.check,
                    
                    backgroundColor: Colors.green,
                  ).show(context); // Automatically shows the snackbar
                },
                child: const Text('Success Snackbar'),
              ),
            ]),
      ),
    );
  }
}
