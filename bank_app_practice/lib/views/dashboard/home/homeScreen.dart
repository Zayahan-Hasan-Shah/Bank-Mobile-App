import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/customAppBar.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/views/dashboard/home/widgets/currentBalance.dart';
import 'package:bank_app_practice/views/dashboard/home/widgets/incomingTransaction.dart';
import 'package:bank_app_practice/views/dashboard/home/widgets/outgoingTransaction.dart';
import 'package:bank_app_practice/views/widgets/common/recentTransactions.dart';
import 'package:bank_app_practice/views/widgets/common/notificationWidget.dart';
import 'package:bank_app_practice/views/widgets/common/sideBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: CustomAppBar(
        title: homeTitle,
        backButtonWidget: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actionWidget: NotificationWidget(
          onTap: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentBalance(),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RecentTransactions(),
                    SizedBox(width: 10),
                    RecentTransactions(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                      title: incomingTransaction,
                      fontSize: 18,
                      color: ColorsPallete.black.withOpacity(0.6)),
                  TextButton(
                      onPressed: () {},
                      child: TitleText(
                          title: '$seeAll >',
                          fontSize: 14,
                          color: ColorsPallete.titleColor))
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IncomingTransaction(
                      incomingTransactionPersonImage:
                          ImageAssets.incomingTransactionMale1,
                      incomingTransactionPersonName: johnnyBairstow,
                      incomingTransactionAmount: incomingTransactionMoney1,
                      incomingTransactionDate: incomingTransactionDate1,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IncomingTransaction(
                      incomingTransactionPersonImage:
                          ImageAssets.incomingTransactionMale2,
                      incomingTransactionPersonName: johnsonCharles,
                      incomingTransactionAmount: incomingTransactionMoney2,
                      incomingTransactionDate: incomingTransactionDate2,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IncomingTransaction(
                      incomingTransactionPersonImage:
                          ImageAssets.incomingTransactionWomen1,
                      incomingTransactionPersonName: sanaMir,
                      incomingTransactionAmount: incomingTransactionMoney3,
                      incomingTransactionDate: incomingTransactionDate3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                      title: outgoingTransaction,
                      fontSize: 18,
                      color: ColorsPallete.black.withOpacity(0.6)),
                  TextButton(
                      onPressed: () {},
                      child: TitleText(
                          title: '$seeAll >',
                          fontSize: 14,
                          color: ColorsPallete.titleColor))
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Outgoingtransaction(
                      outgoingTransactionPersonImage:
                          ImageAssets.outgoingTransactionMale1,
                      outgoingTransactionPersonName: kagisoRabada,
                      outgoingTransactionAmount: outgoingtransactionMoney1,
                      outgoingTransactionDate: outgoingTransactionDate1,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Outgoingtransaction(
                      outgoingTransactionPersonImage:
                          ImageAssets.outgoingTransactionMale2,
                      outgoingTransactionPersonName: kaneWilliamson,
                      outgoingTransactionAmount: outgoingTransactionMoney2,
                      outgoingTransactionDate: outgoingTransactionDate2,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Outgoingtransaction(
                      outgoingTransactionPersonImage:
                          ImageAssets.outgoingTransactionWomen2,
                      outgoingTransactionPersonName: anaDeArmas,
                      outgoingTransactionAmount: outgoingTransactionMoney3,
                      outgoingTransactionDate: outgoingTransactionDate3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
