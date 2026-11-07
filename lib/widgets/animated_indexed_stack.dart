import "package:flutter/material.dart";

/// An [IndexedStack] that animates between children and keeps each page's
/// state alive (scroll position, text input, etc.), like Instagram's tabs.
///
/// Pages are built lazily: a page is only created the first time it is shown.
class AnimatedIndexedStack extends StatefulWidget {
  const AnimatedIndexedStack({
    super.key,
    required this.index,
    required this.children,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeOutCubic,
    this.slideOffset = 0.06,
  });

  final int index;
  final List<Widget> children;
  final Duration duration;
  final Curve curve;

  /// Horizontal slide distance as a fraction of the page width.
  final double slideOffset;

  @override
  State<AnimatedIndexedStack> createState() => _AnimatedIndexedStackState();
}

class _AnimatedIndexedStackState extends State<AnimatedIndexedStack> {
  late final Set<int> _visited = {widget.index};

  @override
  void didUpdateWidget(AnimatedIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    _visited.add(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        for (var i = 0; i < widget.children.length; i++)
          _buildPage(i),
      ],
    );
  }

  Widget _buildPage(int i) {
    final isActive = i == widget.index;
    // Pages to the left of the active tab rest slightly left, pages to the
    // right rest slightly right, so switching tabs slides in the tap direction.
    final offset = isActive
        ? Offset.zero
        : Offset(i < widget.index ? -widget.slideOffset : widget.slideOffset, 0);

    // TickerMode must sit inside the transitions: it only pauses the page's
    // own animations, otherwise the outgoing page could never fade out.
    return IgnorePointer(
      ignoring: !isActive,
      child: AnimatedSlide(
        offset: offset,
        duration: widget.duration,
        curve: widget.curve,
        child: AnimatedOpacity(
          opacity: isActive ? 1 : 0,
          duration: widget.duration,
          curve: widget.curve,
          child: TickerMode(
            enabled: isActive,
            child: RepaintBoundary(
              child: _visited.contains(i)
                  ? widget.children[i]
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
