import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khata_book/data/core/theme/dimensional/dimensional.dart';
import 'package:khata_book/data/services/local/local_storage_service.dart';
import 'package:khata_book/presentation/home/bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget custSuppl(
      bool isCustomersTabActive, double creditBalance, double debitBalance) {
    double totalBalance = creditBalance + debitBalance;
    if (isCustomersTabActive) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "You'll Give",
                      style: GoogleFonts.lexend(
                          fontSize: 16.toAutoScaledFont,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹ ${debitBalance.abs().toStringAsFixed(2)}",
                      style: GoogleFonts.anekLatin(
                          fontSize: 30.toAutoScaledFont,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff8C8C8C)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "You'll Recieve",
                      style: GoogleFonts.lexend(
                          fontSize: 16.toAutoScaledFont,
                          fontWeight: FontWeight.bold),
                    ),
                   Text(
                      "₹ ${creditBalance.toStringAsFixed(2)}",
                      style: GoogleFonts.anekLatin(
                          fontSize: 30.toAutoScaledFont,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff72CC00)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AutoSizeText(
            "A total of ₹ ${totalBalance.toStringAsFixed(2)} ${totalBalance > 0 ? "will be recieved" : "has to be given"}.",
            maxFontSize: 12,
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
          SizedBox(height: 10.toAutoScaledHeight),
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
      );
    } else {
      return const Text("Suppliers");
    }
  }

  @override
  Widget build(BuildContext context) {
    // bool loading = true;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (!state.loading && !state.error) {
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
                                "Hi ${LocalStorageService.getValue("name")}",
                                style: GoogleFonts.lexend(
                                    fontSize: 18.toAutoScaledFont),
                              ),
                              SizedBox(width: 6.toAutoScaledWidth),
                              GestureDetector(
                                onTap: () {
                                  //logic for changing account
                                },
                                child: SvgPicture.asset(
                                    'assets/icons/money/down_arrow.svg'),
                              ),
                            ],
                          ),
                          SvgPicture.asset('assets/icons/home/calender.svg'),
                        ],
                      ),
                      SizedBox(height: 10.toAutoScaledHeight),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.32,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 44,
                              width: 390.toAutoScaledWidth,
                              child: Container(
                                margin: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 0.5,
                                          blurRadius: 5,
                                          offset: const Offset(0, 0))
                                    ]),
                                padding: EdgeInsets.fromLTRB(
                                    10.toAutoScaledWidth,
                                    32.toAutoScaledHeight,
                                    10.toAutoScaledWidth,
                                    14.toAutoScaledHeight),
                                child: Center(
                                  child: custSuppl(state.isCustomersTabActive,
                                      state.creditBalance, state.debitBalance),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 109,
                              width: 120,
                              // height: 32.toAutoScaledHeight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    backgroundColor: state.isCustomersTabActive
                                        ? const Color(0xff388B40)
                                        : Colors.white,
                                    foregroundColor: state.isCustomersTabActive
                                        ? Colors.white
                                        : Colors.black),
                                onPressed: () {
                                  context.read<HomeBloc>().add(
                                      const TabSwitched(
                                          isCustomersTabActive: false));
                                },
                                child: AutoSizeText(
                                  "Suppliers",
                                  maxLines: 1,
                                  minFontSize: 8,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lexend(
                                    fontSize: 18.toAutoScaledFont,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 111,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: -2,
                                      blurRadius: 2,
                                      offset: const Offset(-5, -3))
                                ],
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    backgroundColor: state.isCustomersTabActive
                                        ? Colors.white
                                        : const Color(0xFF388B40),
                                    foregroundColor: state.isCustomersTabActive
                                        ? Colors.black
                                        : Colors.white),
                                onPressed: () {
                                  context.read<HomeBloc>().add(
                                      const TabSwitched(
                                          isCustomersTabActive: true));
                                },
                                child: AutoSizeText(
                                  "Customers",
                                  maxLines: 1,
                                  minFontSize: 8,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lexend(
                                      fontSize: 18.toAutoScaledFont),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 91,
                              top: 4,
                              child: SvgPicture.asset(
                                "assets/icons/home/button.svg",
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.toAutoScaledHeight),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Search Customer",
                          hintStyle: GoogleFonts.lexendDeca(
                              fontSize: 14.toAutoScaledFont,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff8C8C8C)),
                          prefixIcon: const Icon(Icons.search,
                              color: Color(0xff8C8C8C)),
                          suffixIcon: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/icons/home/filter.svg')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/icons/home/pdf.svg')),
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
                      SizedBox(height: 17.toAutoScaledHeight),
                      SizedBox(
                        height: 350.toAutoScaledHeight,
                        child: ListView.builder(
                          itemCount: state.transactions.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                            "assets/icons/money/avatar.jpg",
                                            height: 48.toAutoScaledHeight,
                                            width: 48.toAutoScaledWidth),
                                        SizedBox(width: 15.toAutoScaledWidth),
                                        Container(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.transactions[index].user,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.lexendDeca(
                                                    fontSize: 16.toAutoScaledFont,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                state.transactions[index]
                                                    .transactionDate,
                                                style: GoogleFonts.lexendDeca(
                                                    fontSize: 14.toAutoScaledFont,
                                                    fontWeight: FontWeight.w300,
                                                    color:
                                                        const Color(0xff8C8C8C)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/home/whatsapp.svg'),
                                        SizedBox(width: 13.toAutoScaledWidth),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            AutoSizeText(
                                              "₹ ${state.transactions[index].transactionAmount.abs().toStringAsFixed(2)}",
                                              maxLines: 1,
                                              minFontSize: 8,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.lexendDeca(
                                                  fontSize: 16.toAutoScaledFont,
                                                  fontWeight: FontWeight.w500,
                                                  color: state
                                                              .transactions[
                                                                  index]
                                                              .transactionAmount >
                                                          0
                                                      ? const Color(0xff72CC00)
                                                      : const Color(
                                                          0xFFFF2B2B)),
                                            ),
                                            AutoSizeText(
                                              state.transactions[index]
                                                          .transactionAmount >
                                                      0
                                                  ? "You'll Get"
                                                  : "You'll Give",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.lexendDeca(
                                                fontSize: 14.toAutoScaledFont,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xff8C8C8C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black38,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
