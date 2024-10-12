library modern_snackbar;

import 'package:flutter/material.dart';

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

  // Automatically shows the SnackBar when called
  void show(BuildContext context) {
    final snackbar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,  // Makes the Snackbar background transparent
      content: Row(
        children: [
          Expanded(
            child: Container(
              width: width,  // Custom width for the snackbar
              height: height,  // Custom height for the snackbar
              decoration: BoxDecoration(
                color: Colors.white,  // The main background color for the snackbar body
                borderRadius: BorderRadius.circular(16.0),  // Rounded corners for the container
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,  // Light shadow under the snackbar
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 15,  // Fixed width for the small left-side space
                        decoration: const BoxDecoration(
                          color: Colors.white,  // Small left-side space background color
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 67, 66, 66),
                              blurRadius: 5.0,
                              offset: Offset(2, 0),
                            ),
                          ],
                        ),
                      ),
                      ClipPath(
                        clipper: DShapeClipper(),
                        child: Container(
                          width: width / 1.5,  // Width of the left section (icon side)
                          height: height,  // Height of the left section
                          decoration: BoxDecoration(
                            color: backgroundColor,  // Custom background color for the icon section
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.elliptical(20, 20),
                              bottomRight: Radius.elliptical(20, 20),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              icon,  // Icon displayed in the snackbar
                              color: iconColor,  // Custom icon color
                              size: height / 2,  // Icon size is relative to the height of the snackbar
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),  // Space between icon and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 4.0),
                        Text(
                          title,  // The title text of the snackbar
                          style: TextStyle(
                            color: titleColor,  // Customizable title color
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          description,  // Description text of the snackbar
                          style: TextStyle(color: descColor),  // Custom description text color
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),  // The duration the snackbar will be visible
    );

    // Displays the SnackBar using ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(snackbar); 
  }
}

class DShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Custom shape for the snackbar background on the left (where the icon is located)
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
