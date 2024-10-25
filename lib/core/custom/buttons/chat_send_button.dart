import 'package:flutter/material.dart';

class ChatButton extends StatefulWidget {
  final VoidCallback onLongPressStarts;
  final VoidCallback onLongPressEnds;
  final VoidCallback onTap;

  const ChatButton({
    super.key,
    required this.onLongPressStarts,
    required this.onLongPressEnds,
    required this.onTap,
  });

  @override
  _ChatButtonState createState() => _ChatButtonState();
}

class _ChatButtonState extends State<ChatButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _onLongPressStart() {
    _animationController.forward();
    setState(() {
      _isRecording = true;
    });
    widget.onLongPressStarts();
  }

  void _onLongPressEnd() {
    _animationController.reverse();
    setState(() {
      _isRecording = false;
    });
    widget.onLongPressEnds();
  }


  void _onTap() {
    widget.onTap();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _onLongPressStart,

      onLongPressEnd: (details) {
        _onLongPressEnd();
      },


      onTap: () {
        _onTap();
      },

      child: Stack(
        alignment: Alignment.center,
        children: [
          // Send Button (visible by default)
          AnimatedOpacity(
            opacity: _isRecording ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(
              Icons.send,
              size: 40,
              color: Colors.green,
            ),
          ),
          // Animated View with Audio Icon
          ScaleTransition(
            scale: _animationController,
            child: const Icon(
              Icons.mic,
              size: 40,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}