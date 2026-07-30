import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CodeMatrixBackground extends StatefulWidget {
  final Widget child;

  const CodeMatrixBackground({super.key, required this.child});

  @override
  State<CodeMatrixBackground> createState() => _CodeMatrixBackgroundState();
}

class _CodeMatrixBackgroundState extends State<CodeMatrixBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<CodeColumn> _columns = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    // Generate falling streams
    for (int i = 0; i < 25; i++) {
      _columns.add(CodeColumn(
        xRatio: i / 25.0,
        speed: 0.15 + _random.nextDouble() * 0.35,
        length: 6 + _random.nextInt(8),
        offset: _random.nextDouble(),
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          foregroundPainter: CodeMatrixPainter(
            columns: _columns,
            progress: _controller.value,
          ),
          child: widget.child,
        );
      },
    );
  }
}

class CodeColumn {
  final double xRatio;
  final double speed;
  final int length;
  final double offset;

  CodeColumn({
    required this.xRatio,
    required this.speed,
    required this.length,
    required this.offset,
  });
}

class CodeMatrixPainter extends CustomPainter {
  final List<CodeColumn> columns;
  final double progress;

  // Multilingual Code Keywords & Functions
  static const List<String> codeKeywords = [
    'print()',
    '.upper()',
    'console.log()',
    'System.out.println()',
    'std::cout',
    'fmt.Println()',
    'async/await',
    'def',
    'function',
    'class',
    'import',
    'lambda',
    'return',
    'LEAF.hacks()',
    'HerHacks27',
    'uom.ac.uk',
    'setState()',
    'const',
    'val',
    'struct',
    'fn main()',
  ];

  CodeMatrixPainter({required this.columns, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = const TextStyle(
      fontSize: 12,
      fontFamily: 'GeistPixel',
      fontWeight: FontWeight.bold,
    );

    for (var col in columns) {
      final double x = col.xRatio * size.width;
      final double totalTravel = size.height + (col.length * 40);
      final double yHead = ((progress * col.speed * 2.5 + col.offset) % 1.0) * totalTravel - 100;

      for (int i = 0; i < col.length; i++) {
        // Space out words vertically
        final double y = yHead - (i * 26);
        if (y < -20 || y > size.height) continue;

        // Head word glows yellow, trailing words fade in Manchester purple
        final Color wordColor = (i == 0)
            ? AppColors.secondaryYellow.withOpacity(0.17)
            : AppColors.primaryPurple.withOpacity((1.0 - (i / col.length)) * 0.45);

        // Pick keywords based on column and depth
        final wordIndex = (col.xRatio * 100 + i + (progress * 20).toInt()).toInt() % codeKeywords.length;
        final word = codeKeywords[wordIndex];

        final textSpan = TextSpan(
          text: word,
          style: textStyle.copyWith(color: wordColor),
        );

        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout();
        textPainter.paint(canvas, Offset(x, y));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CodeMatrixPainter oldDelegate) => true;
}