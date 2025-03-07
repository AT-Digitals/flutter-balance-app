import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final String errorText;
  final Color activeColor;
  final Color borderColor;
  final bool validate;
  final Color labelColor;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.activeColor = Colors.purple,
    this.labelColor = Colors.purple,
    this.borderColor = Colors.white,
    this.errorText = "Error",
    this.validate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: activeColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: !validate ? const Color(0xFFDCDCF6) : Colors.red,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.transparent,
                ),
                child: Checkbox(
                  value: value,
                  onChanged: onChanged,
                  activeColor: activeColor,
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return activeColor;
                    }
                    return Colors.white;
                  }),
                  side: BorderSide(
                    color: borderColor,
                    width: 2,
                  ),
                ),
              ),
              // const SizedBox(width: 5),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 16, color: labelColor,  fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
       Column(
  children: [
    validate
        ? Text(
            errorText,
            // textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.red,
              // fontWeight: FontWeight.bold,
            ),
          )
        : const SizedBox.shrink(),
    // Other widgets here
  ],
)

      ],
    );
  }
}
