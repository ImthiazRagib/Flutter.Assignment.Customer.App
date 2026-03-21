import 'package:flutter/material.dart';

String emailOrPhoneKey = 'emailOrPhone';

/// Horizontal padding for shell / scroll content.
const double kScreenPaddingH = 16;

/// Top padding for shell / scroll content.
const double kScreenPaddingTop = 10;

/// Bottom padding for shell / scroll content (before floating nav reserve).
const double kScreenPaddingBottom = 10;

/// Approximate height of the floating nav pill (icons + padding).
const double kFloatingNavBarContentHeight = 74;

/// `Positioned(bottom: …)` offset in `FloatingNavBar`.
const double kFloatingNavBarBottomOffset = 24;

/// Total bottom inset reserved so content clears the floating nav overlay.
const double kFloatingNavBarReserve =
    kScreenPaddingBottom +
    kFloatingNavBarContentHeight +
    kFloatingNavBarBottomOffset;

// Fix: I used wrong name - user had 10 + 74 + 24. Let me fix the constant name.

const double kFloatingNavBarReserve2 =
    kScreenPaddingBottom + kFloatingNavBarContentHeight + kFloatingNavBarBottomOffset;

/// Use this where you had:
/// `EdgeInsets.fromLTRB(16, 10, 16, 10 + 74 + 24)`
const EdgeInsets kScreenPaddingWithFloatingNav = EdgeInsets.fromLTRB(
  kScreenPaddingH,
  kScreenPaddingTop,
  kScreenPaddingH,
  kFloatingNavBarReserve,
);