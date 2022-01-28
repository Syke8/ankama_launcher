import 'dart:math' as math;

import 'package:flutter/material.dart';

class DropdownOutlinedButton<T> extends StatefulWidget {
  const DropdownOutlinedButton({
    Key? key,
    this.backgroundColor,
    this.elevation = 4.0,
    this.textStyle,
    this.maxMenuHeight,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final Color? backgroundColor;
  final double elevation;
  final TextStyle? textStyle;
  final double? maxMenuHeight;
  final T value;
  final List<DropdownButtonItem<T>> items;
  final void Function(T value) onChanged;

  @override
  State<DropdownOutlinedButton> createState() => _DropdownOutlinedButtonState<T>();
}

class _DropdownOutlinedButtonState<T> extends State<DropdownOutlinedButton<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();

  AnimationController? _menuAnimController;
  CurvedAnimation? _menuAnimation;

  AnimationController? _valueAnimController;
  CurvedAnimation? _valueAnimation;

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

    _menuAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _menuAnimation = CurvedAnimation(
      parent: _menuAnimController!,
      curve: Curves.fastOutSlowIn,
    );

    _valueAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      value: 1.0,
    );

    _valueAnimation = CurvedAnimation(
      parent: _valueAnimController!,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _menuAnimController!.dispose();
    _valueAnimController!.dispose();
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
        onPressed: () {
          if (_menuEntry != null) {
            return;
          } else {
            _openMenu();
          }
        },
        child: widget.items.isNotEmpty
            ? SlideTransition(
                position: _valueAnimation!.drive(Tween(
                  begin: const Offset(.0, 2.0),
                  end: const Offset(.0, .0),
                )),
                child: FittedBox(
                  child: widget.items[currentIndex].child,
                ),
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
                ? ScaleTransition(
                    scale: _menuAnimation!,
                    child: Material(
                      borderRadius: BorderRadius.circular(16.0),
                      color: widget.backgroundColor ?? Theme.of(context).colorScheme.background,
                      elevation: widget.elevation,
                      textStyle: widget.textStyle ??
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onBackground,
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
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });

                              _closeMenu();

                              _valueAnimController!.reset();
                              _valueAnimController!.forward().then((_) {
                                widget.onChanged(widget.items.elementAt(index).value);
                              });
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
        child: child,
      ),
    );
  }
}
