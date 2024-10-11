library modern_snackbar;

import 'package:flutter/material.dart';

class ModernSnackbar {
  final Color titleColor;
  final String title;
  final Color backgroundColor;
  final IconData icon;

  const ModernSnackbar({
    required this.titleColor,
    required this.title,
    required this.backgroundColor,
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
              width: 300,
              height: 100,
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
                              color: Colors.black,
                              blurRadius: 8.0,
                              offset: Offset(4, 0),
                            ),
                          ],
                        ),
                      ),
                      ClipPath(
                        clipper: DShapeClipper(),
                        child: Container(
                          width: 80,
                          height: 100,
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
                              color: Colors.white,
                              size: 32.0,
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
                        const Text(
                          'Lorem ipsum dolor sit amet.',
                          style: TextStyle(color: Colors.grey),
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
