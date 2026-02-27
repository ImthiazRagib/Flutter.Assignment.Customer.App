import 'package:flutter/material.dart';

/// Primary-styled dropdown for forms. Use for subject, pages, etc.
class PrimaryDropdown<T> extends StatelessWidget {
  const PrimaryDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
    this.itemLabel,
    this.hint,
    this.validator,
  });

  final String label;
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  /// Optional: display string for each item (e.g. from a map value).
  final String Function(T)? itemLabel;
  final String? hint;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF13245A);

    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        labelStyle: TextStyle(color: primaryColor),
      ),
      dropdownColor: Colors.white,
      hint: hint != null ? Text(hint!) : null,
      items: items
          .map((T item) => DropdownMenuItem<T>(
                value: item,
                child: Text(itemLabel != null ? itemLabel!(item) : item.toString()),
              ))
          .toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
