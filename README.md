

# Introduction

This package provides simple, customizable icon checkboxes

# Usage

It can be used similar to a normal checkbox.
```
IconCheckbox(
    checkedIcon: Icons.lightbulb_outline,
    uncheckedIcon: Icons.lightbulb_outline_rounded,
    value: isChecked,
    onChanged: (value) {
        setState(() {
          isChecked = value;
        });
    },
)
```

That will generate this:

![enter image description here](https://github.com/taiseiiiii/icon_checkbox/blob/main/assets/base_action.gif?raw=true)

# Customize

It can be customized and implemented as follows

![enter image description here](https://github.com/taiseiiiii/icon_checkbox/blob/main/assets/customize_actions.gif?raw=true)

# Properties

| Properties                        | Description                                                            | 
| --------------------------------- | ---------------------------------------------------------------------- | 
| checkedIcon → IconData           | The Icon to use for the check icon when this checkbox is checked.      | 
| uncheckedIcon → IconData?        | The Icon to use for the uncheck icon when this checkbox is unchecked.  | 
| value → bool                     | Whether this checkbox is checked.<br><br>                              | 
| onChanged → ValueChanged<bool?>? | Called when the value of the checkbox should change.                   | 
| checkColor → Color?              | The color to use for the check icon when this checkbox is checked.     | 
| unCheckColor → Color?            | The color to use for the uncheck icon when this checkbox is unchecked. | 
| boxdecoration → BoxDecoration?   | If you implement a frame for a checkbox,Customize that frame.<br><br>   | 
| iconSize → double?               | size of the icon.                                                       | 
| boxHeight → double?              | height of the frame.                                                    | 
| boxWidth → double?               | width of the frame.                                                     | 