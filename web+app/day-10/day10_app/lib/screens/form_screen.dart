import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // TODO: Add a GlobalKey to manage form state and validation
  final _formKey = GlobalKey<FormState>();

  // TODO: Add variables to hold your form field values
  String _name = '';
  String _email = '';
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Screen'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // TODO: Add the drawer here
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Form header
            const Text(
              'Contact Form',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Fill in the fields below and tap Save.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // TODO: Wrap all input fields in a Form widget with the _formKey
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Name Field
                  // TODO: Replace the label/hint with your own field name
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                    // TODO: Add validation rules for each field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email Field
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty!';
                      }
                      // TODO: Add more validation (e.g., check for '@' symbol)
                      if (!value.contains('@')) {
                        return 'Please enter a valid email!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Message Field
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      hintText: 'Write your message here...',
                      prefixIcon: Icon(Icons.message_outlined),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 4,
                    onChanged: (value) {
                      setState(() {
                        _message = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Message cannot be empty!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // Save Button
                  // TODO: The button triggers form validation and shows a dialog
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Validate the form before saving
                        if (_formKey.currentState!.validate()) {
                          // TODO: Show a dialog with the submitted data
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: const Row(
                                children: [
                                  Icon(Icons.check_circle, color: Color(0xFF00BFA5)),
                                  SizedBox(width: 8),
                                  Text('Form Submitted!'),
                                ],
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildDialogRow('Name', _name),
                                    const SizedBox(height: 8),
                                    _buildDialogRow('Email', _email),
                                    const SizedBox(height: 8),
                                    // TODO: Display all form field values here
                                    _buildDialogRow('Message', _message),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // TODO: Reset the form after closing the dialog
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _name = '';
                                      _email = '';
                                      _message = '';
                                    });
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.save_outlined),
                      label: const Text('Save'),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Cancel / Back button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back to Home'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(child: Text(value)),
      ],
    );
  }
}
