import 'dart:ui';

enum FoxIoTTheme {
  primary,
  secondary,
  primaryContainer,
  tint,
  textPrimary,
  textSecondary,
  third
}

extension ColorExtension on FoxIoTTheme {
  Color get color {
    switch (this) {
      case FoxIoTTheme.primary:
        return const Color(0xFFfcd383);
      case FoxIoTTheme.secondary:
        return const Color(0xFFEFEAD0);
      case FoxIoTTheme.primaryContainer:
        return const Color(0xFFffffff);
      case FoxIoTTheme.tint:
        return const Color(0x30000000);
      case FoxIoTTheme.textPrimary:
        return const Color(0xFF000000);
      case FoxIoTTheme.textSecondary:
        return const Color(0xFF898989);
      case FoxIoTTheme.third:
        return const Color(0xFFDE6640);
    }
  }
}
