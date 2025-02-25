import 'package:flutter/material.dart';
import 'dart:async';

class HelpButtonDemo extends StatefulWidget {
  @override
  _HelpButtonDemoState createState() => _HelpButtonDemoState();
}

class _HelpButtonDemoState extends State<HelpButtonDemo> with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for one-time shake
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Shake lasts 500ms
    );

    // Define shake animation (moves left and right)
    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 10, end: -5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -5, end: 5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 5, end: 0), weight: 1),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset(); // Stop and reset animation after one shake
      }
    });
  }

  void _startAutoCollapseTimer() {
    Future.delayed(Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          isExpanded = false;
        });
      }
    });
  }

  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward(); // Start the shake animation one time
        _startAutoCollapseTimer(); // Collapse after 2 seconds
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: _toggleExpanded,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: isExpanded ? 200 : 90,
            height: 46,
            decoration: BoxDecoration(
              color: Color(0xFFDDDCF5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(isExpanded ? _shakeAnimation.value : 0, 0),
                  child: Row(
                    mainAxisAlignment: isExpanded
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.start,
                    children: [
                      if (isExpanded)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.help_outline,
                            color: Color(0xFF4C48B7),
                          ),
                        ),
                      if (isExpanded)
                        Expanded(
                          child: Text(
                            "Need some help?",
                            style: TextStyle(
                              color: Color(0xFF4C48B7),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Icon(
                          isExpanded ? Icons.arrow_forward : Icons.help_outline,
                          color: Color(0xFF4C48B7),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
