import 'dart:math' as math;

import 'package:flutter/material.dart';

class DropdownOutlinedButton<T> extends StatefulWidget {
  const DropdownOutlinedButton({
    Key? key,
    this.value,
    this.backgroundColor,
    this.elevation = 2.0,
    this.textStyle,
    this.alignment = Alignment.center,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final T? value;
  final Color? backgroundColor;
  final double elevation;
  final TextStyle? textStyle;
  final Alignment alignment;
  final List<DropdownButtonItem<T>> items;
  final void Function(T) onChanged;

  @override
  State<DropdownOutlinedButton> createState() => _DropdownOutlinedButtonState<T>();
}

class _DropdownOutlinedButtonState<T> extends State<DropdownOutlinedButton>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();

  late final _menuAnimController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );

  late final CurvedAnimation _menuAnimation = CurvedAnimation(
    parent: _menuAnimController,
    curve: Curves.fastOutSlowIn,
  );

  late final _valueAnimController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 150),
    value: 1.0,
  );

  late final CurvedAnimation _valueAnimation = CurvedAnimation(
    parent: _valueAnimController,
    curve: Curves.fastOutSlowIn,
  );

  late final _closeOverlay = OverlayEntry(
    builder: (context) => GestureDetector(
      onTap: _closeMenu,
    ),
  );

  OverlayEntry? _menuEntry;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.items.indexWhere((element) => element.value == widget.value);

    if (mounted && currentIndex != 0) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _menuAnimController.dispose();
  }

  void _openMenu() {
    _menuEntry = _buildMenu(context);

    Overlay.of(context)!.insert(_closeOverlay);
    Overlay.of(context)!.insert(
      _menuEntry!,
      above: _closeOverlay,
    );

    _menuAnimController.forward();
  }

  void _closeMenu() {
    _menuAnimController.reverse().then((_) {
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
        onPressed: () {
          if (_menuEntry != null) {
            return;
          } else {
            _openMenu();
          }
        },
        child: widget.items.isNotEmpty
            ? SlideTransition(
                position: _valueAnimation.drive(Tween(
                  begin: const Offset(.0, 2.0),
                  end: const Offset(.0, .0),
                )),
                child: FittedBox(
                  child: widget.items[currentIndex].child,
                ),
              )
            : const SizedBox(),
      ),
    );
  }

  OverlayEntry _buildMenu(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        const itemHeight = 36.0;
        const menuOffsetY = 4.0;

        final desiredHeight = widget.items.length * itemHeight;
        final maxHeight = renderBox.constraints.maxHeight -
            renderBox.localToGlobal(Offset.zero).dy -
            size.height -
            menuOffsetY;

        return Positioned(
          width: size.width,
          height: math.min(desiredHeight, maxHeight),
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            targetAnchor: Alignment.bottomLeft,
            offset: const Offset(.0, menuOffsetY),
            child: widget.items.isNotEmpty
                ? ScaleTransition(
                    scale: _menuAnimation,
                    child: Material(
                      borderRadius: BorderRadius.circular(16.0),
                      color: widget.backgroundColor ?? Theme.of(context).colorScheme.background,
                      elevation: widget.elevation,
                      textStyle: widget.textStyle ??
                          TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                      child: ListView.builder(
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
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });

                              _closeMenu();

                              _valueAnimController.reset();
                              _valueAnimController.forward().then((_) {
                                widget.onChanged(widget.items.elementAt(currentIndex).value);
                              });
                            },
                            child: SizedBox.fromSize(
                              size: const Size.fromHeight(itemHeight),
                              child: Align(
                                alignment: widget.alignment,
                                child: element.child,
                              ),
                            ),
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

class DropdownButtonItem<T> {
  DropdownButtonItem({
    this.value,
    required this.child,
  });

  final T? value;
  final Widget child;
}
