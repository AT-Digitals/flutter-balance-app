import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final TabController tabController;
  final int currentTabIndex;

  const CustomTab({
    Key? key,
    required this.tabController,
    required this.currentTabIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      indicatorColor: Colors.transparent, // Removes default underline
      tabs: List.generate(
        tabController.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1), // Adjust spacing between tabs
          child: Container(
            width: 20, // Width of each tab indicator
            height: 4, // Height of each tab indicator
            decoration: BoxDecoration(
              color: index <= currentTabIndex ? Colors.teal : Colors.grey,
              borderRadius:
                  BorderRadius.circular(2), // Optional rounded corners
            ),
          ),
        ),
      ),
    );

    // TabBar(
    //   controller: tabController,
    //   isScrollable: true,
    //   indicator: const BoxDecoration(), // Remove default indicator
    //   tabs: List.generate(
    //     tabController.length,
    //     (index) => Container(
    //       width: 10,
    //       height: 2,
    //      decoration: BoxDecoration(
    //             color: index <= currentTabIndex ? Colors.teal : Colors.grey,
    //             borderRadius:
    //                 BorderRadius.circular(2), // Optional rounded corners
    //           ),
    //       // margin: EdgeInsets.symmetric(horizontal: 2),
    //     ),
    //   ),
    // );
  }
}
