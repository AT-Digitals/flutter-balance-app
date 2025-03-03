import 'package:flutter/material.dart';

// Expandable Section Widget
class ExpandableSection extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableSection({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool isExpanded = false; // Tracks the expanded/collapsed state

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      // Background color for the entire section
      color: const Color(0xFFF8EBF7), // Light greyish background color
      // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(16.0), // Add padding inside the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Title and Icon
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Circle with white question mark icon
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0b5369), // Circle color
                      ),
                      padding: const EdgeInsets.all(4), // Padding around the icon
                      child: const Icon(
                        Icons.question_mark,
                        color: Colors.white, // Icon color
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8), // Spacing
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0b5369),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined ,
                  size: 38,
                  color: Color(0xFF0b5369)
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Expandable Content with animation
          // AnimatedCrossFade(
          //   duration: const Duration(milliseconds: 300),
          //   crossFadeState: isExpanded
          //       ? CrossFadeState.showSecond
          //       : CrossFadeState.showFirst,
          //   firstChild: const SizedBox.shrink(), // Collapsed state
          //   secondChild: Text(
          //     widget.content,
          //     style: const TextStyle(
          //       fontSize: 16,
          //       height: 1.5,
          //     ),
          //   ),
          // ),
          // Expandable Content
if (isExpanded)
  Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Text(
      widget.content,
      style: const TextStyle(
        fontSize: 14,
        height: 1.5,
        color: Color(0xFF0b5369)
      ),
    ),
  ),

        ],
      ),
    );
  }
}
