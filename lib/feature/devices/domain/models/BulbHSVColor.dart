
class BulbHSVColor {
  final int h;
  final int s;
  final int v;

  BulbHSVColor({required this.h, required this.s, required this.v});

  Map<String, dynamic> toMap() {
    return {
      'h': h,
      's': s,
      'v': v,
    };
  }

  @override
  String toString() {
    return 'BulbHSVColor{h: $h, s: $s, v: $v}';
  }
}
