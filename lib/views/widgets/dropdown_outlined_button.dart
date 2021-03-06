import 'dart:math' as math;

import 'package:ankama_launcher/views/widgets/animations/animated_pop_in.dart';
import 'package:ankama_launcher/views/widgets/animations/animated_top_slide_in.dart';
import 'package:flutter/material.dart';

class DropdownOutlinedButton<T> extends StatefulWidget {
  const DropdownOutlinedButton({
    Key? key,
    this.backgroundColor,
    this.elevation = 4.0,
    this.textStyle,
    this.maxMenuHeight,
    this.buttonStyle,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final Color? backgroundColor;
  final double elevation;
  final TextStyle? textStyle;
  final double? maxMenuHeight;
  final ButtonStyle? buttonStyle;
  final T value;
  final List<DropdownButtonItem<T>> items;
  final void Function(T value) onChanged;

  @override
  State<DropdownOutlinedButton> createState() => _DropdownOutlinedButtonState<T>();
}

class _DropdownOutlinedButtonState<T> extends State<DropdownOutlinedButton<T>>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();

  AnimationController? _menuAnimController;

  late final _closeOverlay = OverlayEntry(
    builder: (context) => GestureDetector(
      onTap: _closeMenu,
    ),
  );

  OverlayEntry? _menuEntry;

  late int currentIndex = widget.items.indexWhere((element) => element.value == widget.value);

  @override
  void initState() {
    super.initState();

    _menuAnimController = TopSlideIn.defaultController(this);
  }

  @override
  void dispose() {
    super.dispose();
    _menuAnimController!.dispose();
  }

  void _openMenu() {
    _menuEntry = _buildMenu(context);

    Overlay.of(context)!.insert(_closeOverlay);
    Overlay.of(context)!.insert(
      _menuEntry!,
      above: _closeOverlay,
    );
    _menuAnimController!.forward();
  }

  void _closeMenu() {
    _menuAnimController!.reverse().then((_) {
      _closeOverlay.remove();
      _menuEntry!.remove();
      _menuEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: OutlinedButton(
        style: widget.buttonStyle,
        onPressed: () {
          if (_menuEntry != null) {
            return;
          } else {
            _openMenu();
          }
        },
        child: widget.items.isNotEmpty
            ? FittedBox(
                key: ValueKey(widget.items[currentIndex].value),
                child: AnimatedPopIn(child: widget.items[currentIndex].child),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  OverlayEntry _buildMenu(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        const itemHeight = kMinInteractiveDimension;
        const menuOffsetY = 4.0;

        final desiredHeight = widget.items.length * itemHeight;
        final maxAvailableHeight = MediaQuery.of(context).size.height -
            renderBox.localToGlobal(Offset.zero).dy -
            size.height -
            menuOffsetY;

        return Positioned(
          width: size.width,
          height: math.min(widget.maxMenuHeight ?? desiredHeight, maxAvailableHeight),
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            targetAnchor: Alignment.bottomLeft,
            offset: const Offset(.0, menuOffsetY),
            child: widget.items.isNotEmpty
                ? TopSlideIn(
                    controller: _menuAnimController!,
                    child: Material(
                      borderRadius: BorderRadius.circular(16.0),
                      color: widget.backgroundColor ?? Theme.of(context).colorScheme.secondary,
                      elevation: widget.elevation,
                      textStyle: widget.textStyle ??
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                      child: ListView.builder(
                        primary: true,
                        itemBuilder: (context, index) {
                          final element = widget.items.elementAt(index);

                          return InkWell(
                            borderRadius: BorderRadius.only(
                              topLeft: index == 0 ? const Radius.circular(16.0) : Radius.zero,
                              topRight: index == 0 ? const Radius.circular(16.0) : Radius.zero,
                              bottomLeft: index == widget.items.length - 1
                                  ? const Radius.circular(16.0)
                                  : Radius.zero,
                              bottomRight: index == widget.items.length - 1
                                  ? const Radius.circular(16.0)
                                  : Radius.zero,
                            ),
                            hoverColor:
                                Theme.of(context).colorScheme.secondaryContainer.withOpacity(.2),
                            splashColor:
                                Theme.of(context).colorScheme.secondaryContainer.withOpacity(.1),
                            highlightColor: Colors.transparent,
                            onTap: () {
                              if (currentIndex != index) {
                                widget.onChanged(element.value);

                                setState(() {
                                  currentIndex = index;
                                });
                              }
                              _closeMenu();
                            },
                            child: element,
                          );
                        },
                        itemCount: widget.items.length,
                      ),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}

class DropdownButtonItem<T> extends StatelessWidget {
  const DropdownButtonItem({
    Key? key,
    this.alignment = Alignment.center,
    required this.value,
    required this.child,
  }) : super(key: key);

  final Alignment alignment;
  final T value;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(kMinInteractiveDimension),
      child: Align(
        alignment: alignment,
        child: FittedBox(
          child: child,
        ),
      ),
    );
  }
}
