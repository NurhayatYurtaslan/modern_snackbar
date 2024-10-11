library modern_snackbar;

import 'package:flutter/material.dart';

class ModernSnackbar {
  final IconData icon;
  final String title;
  final String description;
  double width;
  double height;
  Color descColor;
  Color iconColor;
  Color backgroundColor;
  Color titleColor;

  ModernSnackbar(
    {required this.description, 
    this.height = 100,
    this.width = 100,
    this.titleColor = Colors.green,
    this.iconColor = Colors.white,
    this.descColor = Colors.grey,
    this.backgroundColor = Colors.green,
    required this.title,
    required this.icon,
  });

  // Automatically shows the SnackBar when created
  void show(BuildContext context) {
    final snackbar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: Row(
        children: [
          Expanded(
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
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
                        width: 15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
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
                          width: width / 1.5,
                          height: height,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.elliptical(20, 20),
                              bottomRight: Radius.elliptical(20, 20),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              icon,
                              color: iconColor,
                              size: height / 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 4.0),
                        Text(
                          title,
                          style: TextStyle(
                            color: titleColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          description,
                          style: TextStyle(color: descColor),
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
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar); // Show SnackBar
  }
}

class DShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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
