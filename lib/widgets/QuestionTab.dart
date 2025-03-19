import 'package:flutter/material.dart';

class QuestionTab extends StatelessWidget {
  final String question;
  final String description;
  final List<Map<String, dynamic>> options;
  final void Function(int) onOptionSelected;

  const QuestionTab({
    Key? key,
    required this.question,
    required this.description,
    required this.options,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0b5369),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 24, color: Color(0xFF0b5369)),
              // textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;

              return GestureDetector(
                onTap: () => onOptionSelected(index),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF0b5369),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: option["color"] as Color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          option["label"] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0b5369),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
