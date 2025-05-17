import 'package:bank_app_practice/views/dashboard/home/widgets/currentBalance.dart';
import 'package:bank_app_practice/views/dashboard/home/widgets/recentTransactions.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurrentBalance(),
              RecentTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
