import 'package:flutter/material.dart';

class SimpleFormScreen extends StatefulWidget {
  const SimpleFormScreen({super.key});

  @override
  State<SimpleFormScreen> createState() => _SimpleFormScreen();
}

class _SimpleFormScreen extends State<SimpleFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String strInput = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Text Form")),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Display $strInput'),

            /// Name Field
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Name',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the Name";
                }
                return null;
              },
            ),

            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                }
                return null;
              },
              // onChanged: (String value) {
              //   strInput = value;
              // },
            ),

            const SizedBox(height: 20),

            /// Login Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    strInput =
                        "\nUsername : ${_usernameController.text}\n"
                        "Password : ${_passwordController.text}";
                  });
                } else {
                  setState(() {
                    strInput = "Invalid";
                  });
                }
              },
              child: const Text("Login"),
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                _usernameController.clear();
                _passwordController.clear();
              });
            }, child: Text("Clear")),
            ElevatedButton(onPressed: () {
              setState(() {
                _usernameController.text = "Nigga";
              });
            }, child: Text("Auto"))
          ],
        ),
      ),
    );
  }
}
