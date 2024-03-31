import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khata_book/data/core/theme/dimensional/dimensional.dart';
import 'package:khata_book/presentation/money/bloc/money_bloc.dart';

@RoutePage()
class MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoneyBloc, MoneyState>(
      builder: (context, state) {
        if (state is MoneyLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MoneyFetched) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.toAutoScaledWidth),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                                style: GoogleFonts.lexend(
                                    fontSize: 18.toAutoScaledFont),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  //logic for adding staff
                                },
                                icon: SvgPicture.asset(
                                    'assets/icons/money/add_person.svg'),
                              ),
                              Text(
                                "Add Staff",
                                style: GoogleFonts.lexend(
                                    fontSize: 18.toAutoScaledFont,
                                    color: const Color(0xff388B40)),
                              ),
                              SizedBox(width: 10.toAutoScaledWidth),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  //logic for navigating to setting screen
                                },
                                icon: SvgPicture.asset(
                                    'assets/icons/money/settings.svg'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 13.toAutoScaledHeight),
                      SvgPicture.asset("assets/icons/money/add_bank.svg"),
                      SizedBox(height: 20.toAutoScaledHeight),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff388B40),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(0, 4),
                              ),
                            ]),
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.toAutoScaledWidth,
                            vertical: 8.toAutoScaledHeight),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "My Balance",
                                  style: GoogleFonts.lexend(
                                      fontSize: 16.toAutoScaledFont,
                                      color: Colors.white),
                                ),
                                Text('₹ ${state.money}',
                                    style: GoogleFonts.anekLatin(
                                      fontSize: 57.27.toAutoScaledFont,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/money/qr.svg',
                                ),
                                SizedBox(height: 3.toAutoScaledHeight),
                                Text(
                                  "View Transactions",
                                  style: GoogleFonts.lexend(
                                      fontSize: 14.toAutoScaledFont,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 17.toAutoScaledHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 27.toAutoScaledWidth,
                                vertical: 11.toAutoScaledHeight),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x1A000000),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/money/req_money.svg"),
                                SizedBox(height: 5.toAutoScaledHeight),
                                Text(
                                  "Request Money",
                                  style: GoogleFonts.lexend(
                                      fontSize: 18.toAutoScaledFont,
                                      color: const Color(0xff388B40)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 27.toAutoScaledWidth,
                                vertical: 11.toAutoScaledHeight),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x1A000000),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/money/rec_money.svg"),
                                SizedBox(height: 5.toAutoScaledHeight),
                                Text(
                                  "Receive Money",
                                  style: GoogleFonts.lexend(
                                      fontSize: 18.toAutoScaledFont,
                                      color: const Color(0xff388B40)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18.toAutoScaledWidth,
                        vertical: 18.toAutoScaledHeight),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1, color: const Color(0xff388B40)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/icons/money/contacts.svg"),
                            SizedBox(width: 10.toAutoScaledWidth),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Collect Pending Money",
                                  style: GoogleFonts.lexend(
                                      fontSize: 18.toAutoScaledFont,
                                      color: const Color(0xff388B40)),
                                ),
                                SizedBox(height: 5.toAutoScaledHeight),
                                Text(
                                  "No Pending Collections",
                                  style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14.toAutoScaledFont,
                                      color: const Color(0xff388B40)),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            color:  Color(0xff388B40))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
      listener: (BuildContext context, MoneyState state) {
        //listener if any error occurs
      },
    );
  }
}
