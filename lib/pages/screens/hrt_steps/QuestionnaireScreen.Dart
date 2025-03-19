import 'package:flutter/material.dart';
import 'package:balance_app/widgets/CustomTab.dart';
import 'package:balance_app/widgets/QuestionTab.dart';

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "How often have you felt nervous in the past week?",
      "description": "Feeling on edge or anxious",
      "options": [
        {"label": "Not at all", "color": Colors.yellow},
        {"label": "A little", "color": Colors.orange},
        {"label": "Quite a bit", "color": Colors.deepOrange},
        {"label": "Extremely", "color": Colors.red},
      ],
    },
    {
      "question": "How often have you had trouble sleeping?",
      "description": "Difficulty falling asleep or staying asleep",
      "options": [
        {"label": "Never", "color": Colors.green},
        {"label": "Sometimes", "color": Colors.lightGreen},
        {"label": "Often", "color": Colors.orange},
        {"label": "Always", "color": Colors.red},
      ],
    },
    {
      "question": "Do you feel fatigued during the day?",
      "description": "Feeling tired or low on energy",
      "options": [
        {"label": "Not at all", "color": Colors.yellow},
        {"label": "A little", "color": Colors.orange},
        {"label": "Quite a bit", "color": Colors.deepOrange},
        {"label": "Extremely", "color": Colors.red},
      ],
    },
    {
      "question": "How often have you felt down or hopeless?",
      "description": "Persistent sadness or feeling of emptiness",
      "options": [
        {"label": "Never", "color": Colors.green},
        {"label": "Sometimes", "color": Colors.lightGreen},
        {"label": "Often", "color": Colors.orange},
        {"label": "Always", "color": Colors.red},
      ],
    },
    {
      "question": "How is your appetite lately?",
      "description": "Loss of appetite or eating more than usual",
      "options": [
        {"label": "Good", "color": Colors.green},
        {"label": "Average", "color": Colors.lightGreen},
        {"label": "Poor", "color": Colors.orange},
        {"label": "Very Poor", "color": Colors.red},
      ],
    },
    {
      "question": "How often have you felt overwhelmed?",
      "description": "Feeling like you can't handle things",
      "options": [
        {"label": "Not at all", "color": Colors.yellow},
        {"label": "A little", "color": Colors.orange},
        {"label": "Quite a bit", "color": Colors.deepOrange},
        {"label": "Extremely", "color": Colors.red},
      ],
    },
    {
      "question": "Do you feel physically tense or tight?",
      "description": "Muscle tension or stiffness",
      "options": [
        {"label": "Not at all", "color": Colors.green},
        {"label": "A little", "color": Colors.lightGreen},
        {"label": "Quite a bit", "color": Colors.orange},
        {"label": "Extremely", "color": Colors.red},
      ],
    },
    {
      "question": "How often have you felt irritable?",
      "description": "Getting annoyed or frustrated easily",
      "options": [
        {"label": "Never", "color": Colors.green},
        {"label": "Sometimes", "color": Colors.lightGreen},
        {"label": "Often", "color": Colors.orange},
        {"label": "Always", "color": Colors.red},
      ],
    },
    {
      "question": "How often have you had headaches?",
      "description": "Tension or pressure in the head",
      "options": [
        {"label": "Never", "color": Colors.green},
        {"label": "Sometimes", "color": Colors.lightGreen},
        {"label": "Often", "color": Colors.orange},
        {"label": "Always", "color": Colors.red},
      ],
    },
    {
      "question": "Do you feel like you’re lacking motivation?",
      "description": "Struggling to start or finish tasks",
      "options": [
        {"label": "Not at all", "color": Colors.yellow},
        {"label": "A little", "color": Colors.orange},
        {"label": "Quite a bit", "color": Colors.deepOrange},
        {"label": "Extremely", "color": Colors.red},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _questions.length, vsync: this);
  }

  void _onOptionSelected(int index) {
    if (_currentTabIndex < _questions.length - 1) {
      setState(() {
        _currentTabIndex++;
        _tabController.animateTo(_currentTabIndex);
      });
    } else {
      print("Questionnaire completed");
      // TODO: Handle questionnaire completion
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Questionnaire',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        toolbarHeight: 70.0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          CustomTab(
            tabController: _tabController,
            currentTabIndex: _currentTabIndex,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                _questions.length,
                (index) => QuestionTab(
                  question: _questions[index]['question'] as String,
                  description: _questions[index]['description'] as String,
                  options: _questions[index]['options'] as List<Map<String, dynamic>>,
                  onOptionSelected: _onOptionSelected,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
