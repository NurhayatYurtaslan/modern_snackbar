# Modern Snackbar ®️
<p>
  ModernSnackbar elevates your user experience by providing sleek, customizable snack bars that seamlessly integrate into any Flutter application. With a focus on flexibility, you can effortlessly adjust colors, icons, and layouts to fit your app’s unique style. Whether you need to notify users of success, warnings, or errors, ModernSnackbar delivers engaging and dynamic feedback without compromising performance. Enhance your app with modern, responsive snack bars that do more than just notify — they impress.
</p>

<img src="https://github.com/NurhayatYurtaslan/modern_snackbar/blob/main/assets/Modern_Snackbar.png?raw=true" />

## 🛠 Attributes
- `title`: The main title text displayed inside the body of the Snackbar.
- `description`: The secondary message providing additional information or context in the Snackbar.
- `icon`: An icon that visually represents the content of the Snackbar (e.g., checkmark for success, warning sign for error).
- `backgroundColor`: Defines the background color of the icon's section in the Snackbar.
- `titleColor`: Specifies the color of the title text.
- `descColor`: Defines the color of the description text.
- `iconColor`: Sets the color of the icon displayed in the Snackbar.
- `width`: Customizable width of the Snackbar.
- `height`: Customizable height of the Snackbar, affecting both the icon and text areas.

## 🔆 Overall Look'n Feel 
https://github.com/user-attachments/assets/2e71172c-3207-4933-8fc1-dee16a3a49b8


## 📱 Usage
To use the package:
- add the dependency to your pubspec.yaml file

```yaml
dependencies:
  flutter:
      sdk: flutter

  modern_snackbar: <latest-package>
```
Then import it in your flutter project:
```
import 'package:modern_snackbar/modern_snackbar.dart';
```
## 👀 SnackBar Looks
Below are the looks of various types in package used as Snackbar

Custom Snackbar               | Error Snackbar        |   Success Snackbar     
:-------------------------:|:-------------------------:|:-------------------------: 
![](https://github.com/NurhayatYurtaslan/modern_snackbar/blob/main/assets/images/snackbar_custom.png?raw=true) |![](https://github.com/NurhayatYurtaslan/modern_snackbar/blob/main/assets/images/error_snackbar.png?raw=true) | ![](https://github.com/NurhayatYurtaslan/modern_snackbar/blob/main/assets/images/success_snackbar.png?raw=true) |![]

## Versions

|Versions Name | Version |  
|--------------|---------|
| Flutter      | 3.13.0  |
| Dart         | 3.1.0   |

## Support

| Support Name | Version |  
|--------------|---------|
| Android      | SDK 16+ |
| iOS          | 11.0+   |
| Web          | Any*    | 


### ❇️ Constructor
```dart
class ModernSnackbar {
  // The icon that will be displayed in the snackbar
  final IconData icon;
  
  // The title text of the snackbar
  final String title;
  
  // The description text of the snackbar, providing more details
  final String description;
  
  // The width of the snackbar container, which can be adjusted for different screen sizes
  double width;
  
  // The height of the snackbar container
  double height;
  
  // Color of the description text
  Color descColor;
  
  // Color of the icon in the snackbar
  Color iconColor;
  
  // Background color of the snackbar container on the left side (icon background)
  Color backgroundColor;
  
  // Color of the title text
  Color titleColor;

  // Constructor allows you to pass all customizable properties
  ModernSnackbar(
    {required this.description, 
    this.height = 100,  // Default height is set to 100
    this.width = 100,   // Default width is set to 100
    this.titleColor = Colors.green,  // Default color for title text
    this.iconColor = Colors.white,   // Default color for the icon
    this.descColor = Colors.grey,    // Default color for description text
    this.backgroundColor = Colors.green,  // Default background color for the icon's container
    required this.title,  // The title must be provided
    required this.icon,   // The icon must be provided
  });
```

### 💻 Example
Below is a basic example usage of the `modern_snackbar`

```dart
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
              SizedBox(
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

```

### 👩🏻‍💻 Contributors
- [Nurhayat Yurtaslan](https://github.com/NurhayatYurtaslan)

## 😇 Supporting
- [Gürkan Fikret Günak](https://github.com/gurkanfikretgunak)

## 📝 License

Copyright © 2024 [Nurhayat Yurtaslan]([https://github.com/NurhayatYurtaslan](https://github.com/NurhayatYurtaslan/modern_snackbar/blob/main/LICENSE)).<br />

