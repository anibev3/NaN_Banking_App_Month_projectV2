import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadMain extends StatelessWidget {
  String mainTitle;
  HeadMain({super.key, required this.mainTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mainTitle,
            style: GoogleFonts.poppins(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey)),
                child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.search_rounded, color: Colors.grey)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey)),
                child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.notifications, color: Colors.grey)),
              ),
              const SizedBox(width: 3),
              Text(
                "Welfare",
                style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
