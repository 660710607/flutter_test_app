import 'package:flutter/material.dart';

class AdditionalFormScreen extends StatefulWidget {
  const AdditionalFormScreen({super.key});

  @override
  State<AdditionalFormScreen> createState() => _AdditionalFormScreen();
}

class _AdditionalFormScreen extends State<AdditionalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedItem;
  bool _isChecked = false;
  bool _isSwitched = false;
  String? _gender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Select an option'),
              value: _selectedItem,
              items: ['Option 1', 'Option 2', 'Option 3']
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (value) {
                _selectedItem = value;
              },
              validator: (value) =>
                  value == null ? 'Please select an option' : null,
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Save'),
            ),
            CheckboxListTile(
              title: const Text('Accept Terms & Conditions'),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Male'),
              value: 'Male',
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('Female'),
              value: 'Female',
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value.toString();
                });
              },
            ),
          ],
        ),
      ), //Column
    );
  }
}
