import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:budget_tracker/Assets/Constants.dart' as Constants;

class Pinpad extends StatefulWidget {
  final ValueChanged<String> onClick;
  final VoidCallback onClear;
  final VoidCallback onDone;
  final VoidCallback onBackspace;
  final VoidCallback onEqual;
  
  const Pinpad({
    super.key,
    required this.onClick,
    required this.onClear,
    required this.onDone,
    required this.onBackspace,
    required this.onEqual,
  });

  @override
  State<Pinpad> createState() => _PinpadState();
}

class _PinpadState extends State<Pinpad> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Set the desired height for the Pinpad
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              ArithmeticButton('AC', Constants.CLEAR),
              ArithmeticButton('%', "percentage"),
              ArithmeticButton('÷', "divide"),
              ArithmeticButton('×', "multiplication"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumberButton('7'),
              NumberButton('8'),
              NumberButton('9'),
              ArithmeticButton('-', "subtraction"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumberButton('4'),
              NumberButton('5'),
              NumberButton('6'),
              ArithmeticButton('+', "addtion"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumberButton('1'),
              NumberButton('2'),
              NumberButton('3'),
              ArithmeticButton('=', Constants.EQUAL),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumberButton('0'),
              NumberButton('.'),
              ArithmeticButton('⌫', Constants.BACKSPACE),
              ArithmeticButton('✓', Constants.DONE),
            ],
          ),
        ],
      ),
    );
  }

  Widget NumberButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FilledButton.tonal(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
            ),
            onPressed: () {
              HapticFeedback.heavyImpact();
              _addText(text);
            },
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }

  Widget ArithmeticButton(String text, String action) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FilledButton.tonal(
            style: FilledButton.styleFrom(
              backgroundColor: action == Constants.EQUAL
                  ? Theme.of(context).colorScheme.onPrimary
                  : action == Constants.CLEAR
                      ? Theme.of(context).colorScheme.onTertiary
                      : action == Constants.DONE
                          ? Theme.of(context).colorScheme.inversePrimary
                          : Theme.of(context).colorScheme.onSecondary,
            ),
            onPressed: () {
              HapticFeedback.heavyImpact();
              if (action == Constants.CLEAR) {
                _clearText();
              } else if (action == Constants.EQUAL) {
                _onEqual();
              } else if (action == Constants.BACKSPACE) {
                _backspace();
              } else if (action == Constants.DONE) {
                _onDone();
              } else {
                _addText(text);
              }
            },
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }

  void _addText(String text) {
    widget.onClick(text);
  }

  void _clearText() {
    widget.onClear();
  }

  void _onEqual() {
    widget.onEqual();
  }

  void _onDone() {
    widget.onDone();
  }

  void _backspace() {
    widget.onBackspace();
  }
}
