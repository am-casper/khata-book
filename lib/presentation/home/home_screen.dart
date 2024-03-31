import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khata_book/data/core/theme/dimensional/dimensional.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff388B40),
          onPressed: () {},
          shape: const CircleBorder(),
          foregroundColor: Colors.white,
          child: Icon(
            Icons.person_add,
            size: 31.toAutoScaledWidth,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.toAutoScaledWidth),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/money/avatar.jpg',
                          height: 41.toAutoScaledHeight,
                          width: 41.toAutoScaledWidth,
                        ),
                        SizedBox(width: 10.toAutoScaledWidth),
                        Text(
                          "Hi Yashpal",
                          style:
                              GoogleFonts.lexend(fontSize: 18.toAutoScaledFont),
                        ),
                        // SizedBox(width: 6.toAutoScaledWidth),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              //logic for changing account
                            },
                            icon: SvgPicture.asset(
                                'assets/icons/money/down_arrow.svg')),
                      ],
                    ),
                    SvgPicture.asset('assets/icons/home/calender.svg'),
                  ],
                ),
                SizedBox(height: 25.toAutoScaledHeight),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3))
                          ]),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shadowColor: Colors.grey.withOpacity(0.5),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black),
                        onPressed: () {},
                        child: Text(
                          "Customers",
                          style:
                              GoogleFonts.lexend(fontSize: 18.toAutoScaledFont),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          backgroundColor: const Color(0xff388B40),
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: Text(
                        "Suppliers",
                        style: GoogleFonts.lexend(
                          fontSize: 18.toAutoScaledFont,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3))
                      ]),
                  padding: EdgeInsets.fromLTRB(
                      10.toAutoScaledWidth,
                      32.toAutoScaledHeight,
                      10.toAutoScaledWidth,
                      14.toAutoScaledHeight),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "You'll Give",
                                  style: GoogleFonts.lexend(
                                      fontSize: 16.toAutoScaledFont,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "₹ 380",
                                  style: GoogleFonts.anekLatin(
                                      fontSize: 30.toAutoScaledFont,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff8C8C8C)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "You'll Recieve",
                                  style: GoogleFonts.lexend(
                                      fontSize: 16.toAutoScaledFont,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "₹ 1180",
                                  style: GoogleFonts.anekLatin(
                                      fontSize: 30.toAutoScaledFont,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff72CC00)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "A total of ₹ 800 will be recieved.",
                          style: GoogleFonts.anekLatin(
                            fontSize: 14.toAutoScaledFont,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff8C8C8C),
                          ),
                        ),
                        TextButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: const Color(0xff388B40),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "View Report",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lexend(
                                    fontSize: 17.toAutoScaledFont,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15.toAutoScaledHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/home/book.svg'),
                            SizedBox(width: 5.toAutoScaledWidth),
                            Text(
                              "Open Cashbook",
                              style: GoogleFonts.lexend(
                                  fontSize: 17.toAutoScaledFont,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff388B40)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.toAutoScaledHeight),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Search Customer",
                    hintStyle: GoogleFonts.lexendDeca(
                        fontSize: 14.toAutoScaledFont,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff8C8C8C)),
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xff8C8C8C)),
                    suffixIcon: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/home/filter.svg')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/home/pdf.svg')),
                        ),
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
