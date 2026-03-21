import 'package:assignment_customer_app/features/profile/profile_edit.dart';
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
  final TextEditingController _nameController = TextEditingController(
    text: 'Imthiaz Ragib',
  );
  final FocusNode _nameFocusNode = FocusNode();
  bool _isNameEditing = false;

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  void _startEditingName() {
    setState(() => _isNameEditing = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _nameFocusNode.requestFocus();
    });
  }

  void _finishEditingName() {
    setState(() => _isNameEditing = false);
    _nameFocusNode.unfocus();
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                                    _isNameEditing
                                        ? SizedBox(
                                            width:
                                                MediaQuery.sizeOf(
                                                  context,
                                                ).width *
                                                0.5,
                                            child: TextField(
                                              controller: _nameController,
                                              focusNode: _nameFocusNode,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: textColor,
                                              ),
                                              decoration: const InputDecoration(
                                                isDense: true,
                                                contentPadding: EdgeInsets.zero,
                                                border: UnderlineInputBorder(),
                                              ),
                                              textInputAction:
                                                  TextInputAction.done,
                                              onSubmitted: (_) =>
                                                  _finishEditingName(),
                                            ),
                                          )
                                        : Text(
                                            _nameController.text,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: textColor,
                                            ),
                                          ),
                                    SizedBox(height: _isNameEditing ? 6 : 0),
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
                                onPressed: _isNameEditing
                                    ? _finishEditingName
                                    : _startEditingName,
                                icon: Icon(
                                  _isNameEditing ? Icons.check : Icons.edit,
                                  size: 16,
                                  color: accentColor,
                                  semanticLabel: _isNameEditing
                                      ? 'Done'
                                      : 'Edit',
                                ),
                                tooltip: _isNameEditing ? 'Done' : 'Edit',
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

              const ProfileEditPage(),
            ],
          ),
        ),
      ),
    );
  }
}
