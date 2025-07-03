import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 120,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("앱 아이콘 위치"),
          ),
          SizedBox(height: 16),

          Text(
            "직장인을 위한 스마트 쇼핑몰",
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              letterSpacing: 0.5,
            )
          ),
          SizedBox(height: 56),
        ],
      ),
    );
  }
}
