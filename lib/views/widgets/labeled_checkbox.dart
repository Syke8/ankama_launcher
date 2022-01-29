import 'package:flutter/material.dart';

class LabeledCheckbox extends StatefulWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.onChecked,
    required this.onUnchecked,
  }) : super(key: key);

  final String label;
  final void Function() onChecked;
  final void Function() onUnchecked;

  @override
  State<LabeledCheckbox> createState() => _LabeledCheckboxState();
}

class _LabeledCheckboxState extends State<LabeledCheckbox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    // not overriding splash, hover, etc. in theme it messes with other components
    final splashColor = Theme.of(context).colorScheme.primary;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        customBorder: const StadiumBorder(),
        splashColor: splashColor.withOpacity(.2),
        highlightColor: Colors.transparent,
        hoverColor: splashColor.withOpacity(.1),
        onTap: () => checkedState = !checked,
        child: Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IgnorePointer(
                child: Checkbox(
                  value: checked,
                  // onChanged useless mais là au cas où j'enlève le IgnorePointer un jour
                  onChanged: (value) => checkedState = value!,
                ),
              ),
              Text(widget.label),
            ],
          ),
        ),
      ),
    );
  }

  set checkedState(bool value) {
    setState(() => checked = value);

    value ? widget.onChecked() : widget.onUnchecked();
  }
}
