import 'package:flutter/material.dart';

class PrimaryBannerBar extends StatelessWidget {
  final String text;
  final String ctaText;
  final VoidCallback onTap;
  /// Optional image URL for the banner background. Paste any image URL here.
  final String? backgroundImageUrl;

  const PrimaryBannerBar({
    super.key,
    required this.text,
    required this.ctaText,
    required this.onTap,
    this.backgroundImageUrl,
  });

  static const _primaryColor = Color(0xFF13245A);

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 13.5, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 28,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: _primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: Text(ctaText),
            ),
          ),
        ],
      ),
    );

    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          if (backgroundImageUrl != null && backgroundImageUrl!.isNotEmpty) ...[
            Positioned.fill(
              child: Image.network(
                backgroundImageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: _primaryColor),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: _primaryColor,
                    child: child,
                  );
                },
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: _primaryColor.withValues(alpha: 0.65),
                ),
              ),
            ),
          ],
          content,
        ],
      ),
    );
  }
}