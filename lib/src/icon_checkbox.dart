import 'package:flutter/material.dart';

class IconCheckbox extends StatefulWidget {
  final IconData checkedIcon;
  final IconData? uncheckedIcon;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? checkColor;
  final Color? unCheckColor;
  final BoxDecoration? boxdecoration;
  final double? iconSize;
  final double? boxHeight;
  final double? boxWidth;

  const IconCheckbox({
    super.key,
    required this.checkedIcon,
    this.uncheckedIcon,
    required this.value,
    required this.onChanged,
    this.checkColor = Colors.blue,
    this.unCheckColor = Colors.grey,
    this.boxdecoration,
    this.iconSize,
    this.boxHeight,
    this.boxWidth,
  }) : assert(uncheckedIcon != null || boxdecoration != null,
            'checkedIcon and boxdecoration cannot be both null');

  @override
  IconCheckboxState createState() => IconCheckboxState();
}

class IconCheckboxState extends State<IconCheckbox> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant IconCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
        });
        widget.onChanged(_value);
      },
      child: Container(
          height: widget.boxHeight,
          width: widget.boxWidth,
          decoration: widget.boxdecoration,
          child: Opacity(
            opacity: !_value && widget.uncheckedIcon == null ? 0 : 1,
            child: Icon(
              _value ? widget.checkedIcon : widget.uncheckedIcon,
              color: _value ? widget.checkColor : widget.unCheckColor,
              size: widget.iconSize,
            ),
          )),
    );
  }
}
