import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:assignment_customer_app/core/auth_provider.dart';
import 'package:assignment_customer_app/features/atoms/primary_dropdown.dart';

/// Dummy data for Subject dropdown. Key: value stored, value: display label.
const _subjectOptions = {
  'mathematics': 'Mathematics',
  'english': 'English',
  'science': 'Science',
  'history': 'History',
  'computer_science': 'Computer Science',
  'economics': 'Economics',
  'psychology': 'Psychology',
  'other': 'Other',
};

/// Dummy data for Pages dropdown. Key: value stored, value: display label.
const _pagesOptions = {
  '1-2': '1-2',
  '3-5': '3-5',
  '6-10': '6-10',
  '11-15': '11-15',
  '16-20': '16-20',
  '21+': '21+',
};

class OrderForm extends StatefulWidget {
  const OrderForm({super.key});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _notes = TextEditingController();
  String? _subject;
  String? _pages;
  bool _agreed = false;

  @override
  void dispose() {
    _title.dispose();
    _email.dispose();
    _phone.dispose();
    _notes.dispose();
    super.dispose();
  }

  static final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    Future<void> submitOrder() async {
      if (!_formKey.currentState!.validate()) return;

      if (!auth.isLoggedIn) {
        // Hold data in state (no reset); show login-first popup.
        if (!context.mounted) return;
        await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Login required"),
            content: const Text(
              "Please log in first to submit your order. Your form data has been saved.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text("Stay"),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  context.go('/login');
                },
                child: const Text("Go to Login"),
              ),
            ],
          ),
        );
        return;
      }

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Order submitted successfully")),
      );
      context.go('/dashboard');
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _title,
            decoration: const InputDecoration(labelText: "Assignment Title"),
            validator: (v) => v == null || v.isEmpty ? "Required" : null,
          ),
          const SizedBox(height: 12),
          PrimaryDropdown<String>(
            label: "Subject",
            items: _subjectOptions.keys.toList(),
            value: _subject,
            onChanged: (v) => setState(() => _subject = v),
            itemLabel: (k) => _subjectOptions[k]!,
            hint: "Select subject",
            validator: (v) => v == null || v.isEmpty ? "Required" : null,
          ),
          const SizedBox(height: 12),
          PrimaryDropdown<String>(
            label: "Pages",
            items: _pagesOptions.keys.toList(),
            value: _pages,
            onChanged: (v) => setState(() => _pages = v),
            itemLabel: (k) => _pagesOptions[k]!,
            hint: "Select page range",
            validator: (v) => v == null || v.isEmpty ? "Required" : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(labelText: "Email"),
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return "Required";
              if (!_emailRegex.hasMatch(v)) return "Enter a valid email";
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _phone,
            decoration: const InputDecoration(labelText: "Phone number"),
            keyboardType: TextInputType.phone,
            validator: (v) => v == null || v.isEmpty ? "Required" : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _notes,
            decoration: const InputDecoration(
              labelText: "Additional instructions",
              alignLabelWithHint: true,
            ),
            maxLines: 4,
            minLines: 4,
          ),
          const SizedBox(height: 12),
          CheckboxListTile(
            value: _agreed,
            onChanged: (v) => setState(() => _agreed = v ?? false),
            title: const Text("I agree to the terms and conditions"),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _agreed ? submitOrder : null,
            child: const Text("Submit Order"),
          ),
        ],
      ),
    );
  }
}
