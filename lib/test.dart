import 'package:flutter/material.dart';

void main() {
  runApp(const ModernVerticalTextApp());
}

class ModernVerticalTextApp extends StatelessWidget {
  const ModernVerticalTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: const Center(
          child: ScrollConfiguration(
            behavior: NoScrollbarBehavior(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: VerticalHoverText(
                text:
                    'HELLOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOORLD',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoScrollbarBehavior extends ScrollBehavior {
  const NoScrollbarBehavior();
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class VerticalHoverText extends StatelessWidget {
  final String text;
  const VerticalHoverText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: text
          .split('')
          .map((char) => HoverColorLetter(letter: char))
          .toList(),
    );
  }
}

class HoverColorLetter extends StatefulWidget {
  final String letter;
  const HoverColorLetter({super.key, required this.letter});

  @override
  State<HoverColorLetter> createState() => _HoverColorLetterState();
}

class _HoverColorLetterState extends State<HoverColorLetter> {
  bool _hovering = false;
  final List<Color> _modernColors = [
    Color(0xFFE63946),
    Color(0xFF457B9D),
    Color(0xFFF1FAEE),
    Color(0xFF1D3557),
    Color(0xFF2A9D8F),
    Color(0xFFF4A261),
    Color(0xFFE9C46A),
  ];

  late final Color _randomColor;

  @override
  void initState() {
    super.initState();
    _randomColor = (_modernColors..shuffle()).first;
  }

  @override
  Widget build(BuildContext context) {
    const double baseFontSize = 640;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: SizedBox(
        width: double.infinity,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          style: TextStyle(
            fontSize: _hovering ? baseFontSize * 1.25 : baseFontSize,
            fontWeight: FontWeight.bold,
            color: _hovering ? _randomColor : Colors.black,
            letterSpacing: 0,
            height: 0.8,
          ),
          textAlign: TextAlign.center,
          child: Text(widget.letter),
        ),
      ),
    );
  }
}
