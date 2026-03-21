import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  TimeOfDay? _selectedTime;
  String _selectedTimeFormat = '12 hours';
  String _selectedZone = '🇺🇸 America/New_York';
  String _selectedPhoneCountry = '🇺🇸 +1';
  String _updatedPhone = 'Not set';
  String _updatedEmail = 'Not set';
  String _updatedZone = '🇺🇸 America/New_York';
  String _updatedTime = 'Not set';

  final List<String> _timeZones = const [
    '🇺🇸 America/New_York',
    '🇺🇸 America/Chicago',
    '🇺🇸 America/Los_Angeles',
    '🇬🇧 Europe/London',
    '🇩🇪 Europe/Berlin',
    '🇮🇳 Asia/Kolkata',
    '🇦🇪 Asia/Dubai',
    '🇸🇬 Asia/Singapore',
    '🇯🇵 Asia/Tokyo',
    '🇦🇺 Australia/Sydney',
  ];

  final List<String> _phoneCountries = const [
    '🇺🇸 +1',
    '🇬🇧 +44',
    '🇮🇳 +91',
    '🇦🇪 +971',
    '🇸🇬 +65',
    '🇦🇺 +61',
    '🇨🇦 +1',
  ];

  Future<void> _pickTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime == null || !mounted) return;
    setState(() => _selectedTime = pickedTime);
  }

  String _formatTime(BuildContext context) {
    if (_selectedTime == null) return 'Select time';
    if (_selectedTimeFormat == '24 hours') {
      final hour = _selectedTime!.hour.toString().padLeft(2, '0');
      final minute = _selectedTime!.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }
    return _selectedTime!.format(context);
  }

  void _applyPhoneUpdate() {
    final number = _phoneController.text.trim();
    if (number.isEmpty) return;
    setState(() => _updatedPhone = '$_selectedPhoneCountry $number');
  }

  void _applyEmailUpdate() {
    final email = _emailController.text.trim();
    if (email.isEmpty) return;
    setState(() => _updatedEmail = email);
  }

  void _applyAllUpdates() {
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();

    setState(() {
      if (email.isNotEmpty) {
        _updatedEmail = email;
      }
      if (phone.isNotEmpty) {
        _updatedPhone = '$_selectedPhoneCountry $phone';
      }
      _updatedZone = _selectedZone;
      _updatedTime = _formatTime(context);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updates applied'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textColor = themeProvider.textColor;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (_) => _applyEmailUpdate(),
                    decoration: const InputDecoration(
                      hintText: 'Enter email address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Updated email: $_updatedEmail',
                    style: TextStyle(color: textColor, fontSize: 10),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedZone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: _timeZones
                        .map(
                          (zone) => DropdownMenuItem<String>(
                            value: zone,
                            child: Text(zone),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => _selectedZone = value);
                    },
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Current zone: $_selectedZone',
                    style: TextStyle(color: textColor, fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Updated zone: $_updatedZone',
                    style: TextStyle(color: textColor, fontSize: 10),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _selectedTimeFormat,
                    decoration: const InputDecoration(
                      labelText: 'Time format',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: '12 hours',
                        child: Text('12 hours'),
                      ),
                      DropdownMenuItem(
                        value: '24 hours',
                        child: Text('24 hours'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => _selectedTimeFormat = value);
                    },
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: _pickTime,
                    borderRadius: BorderRadius.circular(8),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Time ($_selectedTimeFormat)',
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.access_time),
                      ),
                      child: Text(
                        _formatTime(context),
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Updated time: $_updatedTime',
                    style: TextStyle(color: textColor, fontSize: 10),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Phone number',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 125,
                        child: DropdownButtonFormField<String>(
                          initialValue: _selectedPhoneCountry,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                          items: _phoneCountries
                              .map(
                                (country) => DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() => _selectedPhoneCountry = value);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          onSubmitted: (_) => _applyPhoneUpdate(),
                          decoration: const InputDecoration(
                            hintText: 'Enter phone number',
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Updated phone: $_updatedPhone',
                    style: TextStyle(color: textColor, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _applyAllUpdates,
            style: ElevatedButton.styleFrom(
              backgroundColor: themeProvider.primaryColor,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Update',
              style: TextStyle(color: themeProvider.textColor),
            ),
          ),
        ),
      ],
    );
  }
}