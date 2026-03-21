import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/theme_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _zoneController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  TimeOfDay? _selectedTime;
  String _selectedZone = '🇺🇸 America/New_York';
  String _selectedPhoneCountry = '🇺🇸 +1';
  String _updatedPhone = 'Not set';
  String _updatedEmail = 'Not set';

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
    return _selectedTime!.format(context);
  }

  void _applyPhoneUpdate() {
    final number = _phoneController.text.trim();
    if (number.isEmpty) return;
    setState(() {
      _updatedPhone = '$_selectedPhoneCountry $number';
    });
  }

  void _applyEmailUpdate() {
    final email = _emailController.text.trim();
    if (email.isEmpty) return;
    setState(() => _updatedEmail = email);
  }

  @override
  void dispose() {
    _zoneController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textColor = themeProvider.textColor;
    final accentColor = themeProvider.accentColor;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () => themeProvider.isDarkMode
                ? themeProvider.setThemeMode(ThemeMode.light)
                : themeProvider.setThemeMode(ThemeMode.dark),
            icon: themeProvider.isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                // color: ,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Text(
                                  'IR',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Imthiaz Ragib",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  Text(
                                    "UserId: 100012",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                    ),
                                  ),
                                  Text(
                                    "Rating: 4.5",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.edit,
                                size: 16,
                                color: accentColor,
                                semanticLabel: 'Edit',
                              ),
                              tooltip: 'Edit',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
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
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            onSubmitted: (_) => _applyEmailUpdate(),
                            decoration: InputDecoration(
                              hintText: 'Enter email address',
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.email_outlined),
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Updated email: $_updatedEmail',
                      style: TextStyle(color: textColor, fontSize: 10.0),
                    ),
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 6.0),
                    Text(
                      'Current zone: $_selectedZone',
                      style: TextStyle(color: textColor, fontSize: 10.0),
                    ),

                    const SizedBox(height: 12),
                    InkWell(
                      onTap: _pickTime,
                      borderRadius: BorderRadius.circular(8),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Time',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.access_time),
                        ),
                        child: Text(
                          _formatTime(context),
                          style: TextStyle(color: textColor),
                        ),
                      ),
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
                            decoration: InputDecoration(
                              hintText: 'Enter phone number',
                              border: const OutlineInputBorder(),
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Updated phone: $_updatedPhone',
                      style: TextStyle(color: textColor, fontSize: 10.0),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeProvider.primaryColor,
                  foregroundColor: themeProvider.textColor,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Update'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
