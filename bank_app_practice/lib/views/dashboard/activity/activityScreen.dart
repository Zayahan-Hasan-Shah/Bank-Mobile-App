import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/dummyData/activity/incomingActivityData.dart';
import 'package:bank_app_practice/utils/customAppBar.dart';
import 'package:bank_app_practice/utils/customTextField.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/views/dashboard/activity/widgets/overallIncomingChartWidget.dart';
import 'package:bank_app_practice/views/widgets/common/notificationWidget.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> data = transactionData;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallete.backgroundColor,
      appBar: CustomAppBar(
        title: activityTitle,
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          children: [
            searchField(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                    title: overAllIncoming,
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
            OverAllIncomingChart(data: data),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsPallete.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.outer, blurRadius: 1, spreadRadius: 0.5)
        ],
      ),
      child: CustomTextField(
        controller: searchController,
        hintText: search,
        isUnderLine: false,
        hintColor: ColorsPallete.black.withOpacity(0.6),
        fontSize: 18,
      ),
    );
  }
}
