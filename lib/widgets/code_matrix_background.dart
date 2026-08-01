import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CodeMatrixBackground extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;

  const CodeMatrixBackground({
    super.key,
    required this.child,
    required this.scrollController,
  });

  @override
  State<CodeMatrixBackground> createState() => _CodeMatrixBackgroundState();
}

class _CodeMatrixBackgroundState extends State<CodeMatrixBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _ticker;
  final List<CodeRowData> _rows = [];
  final Random _random = Random();

  double _lastScrollOffset = 0.0;
  double _scrollVelocity = 0.0;
  double _accumulatedOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _ticker = AnimationController(
      vsync: this,
      duration: const Duration(days: 365),
    )..addListener(_onTick)..forward();

    widget.scrollController.addListener(_onScroll);

    // Populate rows with exact CodeRowData model
    for (int i = 0; i < 35; i++) {
      _rows.add(
        CodeRowData(
          rowyRatio: i / 35.0,
          baseSpeed: 0.3 + _random.nextDouble() * 0.4,
          direction: i % 2 == 0 ? 1 : -1,
          seedOffset: _random.nextDouble() * 2000,
          wordCount: 8,
        ),
      );
    }
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) return;
    final currentOffset = widget.scrollController.offset;
    final delta = (currentOffset - _lastScrollOffset).abs();
    _scrollVelocity = delta * 0.15;
    _lastScrollOffset = currentOffset;
  }



  void _onTick() {
    if (!mounted) return;
    setState(() {
      _scrollVelocity *= 0.92;
      _accumulatedOffset += 0.8 + _scrollVelocity;
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: OptimizedMatrixPainter(
        rows: _rows,
        offset: _accumulatedOffset,
      ),
      child: widget.child,
    );
  }
}

class CodeRowData {
  final double rowyRatio;
  final double baseSpeed;
  final int direction;
  final double seedOffset;
  final int wordCount;

  CodeRowData({
    required this.rowyRatio,
    required this.baseSpeed,
    required this.direction,
    required this.seedOffset,
    required this.wordCount,
  });
}

class OptimizedMatrixPainter extends CustomPainter {
  final List<CodeRowData> rows;
  final double offset;

  static const List<String> keywords = [
    'print("Hello, HerHacks!");',
    'String name = text.toUpperCase();',
    'console.log("Welcome to HerHacks");',
    'System.out.println("Building the future");',
    'std::cout << "HerHacks 2027" << std::endl;',
    'fmt.Println("Empowering Women in STEM")',
    'const data = await fetchData();',
    'def main(): pass',
    'function buildProject() {}',
    'class Participant { final String name; }',
    'import package:flutter/material.dart;',
    'auto calculate = [](int x) { return x * 2; };',
    'return Future.value(true);',
    'LEAF.hacks(year: 2027);',
    'HerHacks27 app = new HerHacks27();',
    'final Uri url = Uri.parse("https://uom.ac.uk");',
    'setState(() { isLoading = false; });',
    'const double pi = 3.14159;',
    'val title: String = "HerHacks"',
    'struct Team { name: String, id: u32 }',
    'fn main() { println!("Ready, set, hack!"); }',
  ];

  static final Map<String, TextPainter> _textCache = {};

  OptimizedMatrixPainter({required this.rows, required this.offset});

  TextPainter _getTextPainter(String text, Color color) {
    final key = '$text-${color.value}';
    return _textCache.putIfAbsent(key, () {
      final painter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'GeistPixel',
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      painter.layout();
      return painter;
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var r = 0; r < rows.length; r++) {
      final row = rows[r];
      final y = row.rowyRatio * size.height;
      final rowTravel = size.width + 400;

      final rowMovement = offset * row.baseSpeed * row.direction;

      for (int i = 0; i < row.wordCount; i++) {
        final rawX = ((rowMovement + row.seedOffset + (i * 220)) % rowTravel) - 200;
        final x = row.direction == 1 ? rawX : size.width - rawX - 100;

        if (x < -150 || x > size.width + 100) continue;

        final color = (i == 0)
            ? AppColors.secondaryYellow.withOpacity(0.18)
            : AppColors.primaryPurple.withOpacity((1.0 - (i / row.wordCount)) * 0.4);

        final word = keywords[(r + i) % keywords.length];
        final painter = _getTextPainter(word, color);
        painter.paint(canvas, Offset(x, y));
      }
    }
  }

  @override
  bool shouldRepaint(covariant OptimizedMatrixPainter oldDelegate) {
    return oldDelegate.offset != offset;
  }

}