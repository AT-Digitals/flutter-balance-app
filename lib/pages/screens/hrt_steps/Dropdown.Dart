import 'package:flutter/material.dart';


class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _selectedItem;

  // List of items to display in the dropdown
  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  // Function to handle item selection
  void _handleItemSelection(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reusable Dropdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display selected item or default text
            Text(
              _selectedItem != null ? 'Selected: $_selectedItem' : 'No item selected',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Using the reusable DropdownPopup widget
            DropdownPopup(
              items: _dropdownItems,
              onItemSelected: _handleItemSelection,
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Dropdown widget
class DropdownPopup extends StatelessWidget {
  final List<String> items;
  final Function(String) onItemSelected;

  DropdownPopup({required this.items, required this.onItemSelected});

  // Function to show the popup
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow dismiss by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an Item'),
          content: Container(
            height: 200, // Adjust as needed
            width: 300, // Adjust as needed
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    onItemSelected(items[index]); // Send selected item back
                    Navigator.pop(context); // Close the dialog
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cancel the popup
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showPopup(context),
      child: Text('Select an Item'),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF4C48B7), // Button color
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
