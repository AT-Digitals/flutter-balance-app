import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:balance_app/pages/screens/hrt_steps/SmokingPage.Dart';
import 'package:balance_app/pages/screens/OnboardingPage.Dart';

class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  bool isCmSelected = false; // State to track the selected unit

  bool isNextEnabled = false; // To track button state

  // Controllers for text fields
  final TextEditingController ftController = TextEditingController();
  final TextEditingController inController = TextEditingController();
  final TextEditingController cmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add listeners to track text input
    ftController.addListener(_checkIfNextShouldBeEnabled);
    inController.addListener(_checkIfNextShouldBeEnabled);
    cmController.addListener(_checkIfNextShouldBeEnabled);
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    ftController.dispose();
    inController.dispose();
    cmController.dispose();
    super.dispose();
  }

  // Function to check if "Next" button should be enabled
  void _checkIfNextShouldBeEnabled() {
    setState(() {
      if (isCmSelected) {
        // If cm is selected, enable button only if cm field has value
        isNextEnabled = cmController.text.isNotEmpty;
      } else {
        // If ft/in is selected, enable button if either ft or in field has value
        isNextEnabled = ftController.text.isNotEmpty || inController.text.isNotEmpty;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Height Selection",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0b5369),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "How much do you weigh?",
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0b5369),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Show ft & in fields when cm is NOT selected
                      if (!isCmSelected)
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                        controller: ftController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text('st', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                         controller: inController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE5C7FC)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text('lbs', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),

                      // Show cm field when cm is selected
                      if (isCmSelected)
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                     controller: cmController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE5C7FC)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE5C7FC)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE5C7FC)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('kg', style: TextStyle(fontSize: 16)),
                          ],
                        ),

                      const SizedBox(height: 30),

                      // Switch between cm and ft/in
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isCmSelected = !isCmSelected;
                          });
                        },
                        child: Text(
                          isCmSelected ? 'Switch to stones' : 'Switch to kg',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4C48B7),
                          ),
                        ),
                      ),
                       const SizedBox(height: 30),
                      Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isNextEnabled
                      ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SmokingPage()),
                          );
                      } : null,
                      style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Color(0xFF4C48B7).withOpacity(0.5);
                    }
                    return Color(0xFF4C48B7);
                  },
                ),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
              ),
                      child: const Text(
                        'Next: Smoking',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Save and continue later",
                      style: TextStyle(fontSize: 16, color: Color(0xFF4C48B7)),
                    ),
                  ),
                ],
              ),
            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
