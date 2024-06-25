import 'package:flutter/material.dart';


class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    print('Parent on build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChildWidget(
            isChecked: _isChecked,
            onChanged: (newValue) {
              // setState(() {
              //   _isChecked = newValue;
              // });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            setState(() {

            });
          }, child: Text('Set state check ')),
          Text('Parent Widget State: $_isChecked'),
        ],
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const ChildWidget({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    print('child on build');
    return CheckboxListTile(
      title: Text('Child Widget Checkbox'),
      value: _isChecked,
      onChanged: (newValue) {
        setState(() {
          _isChecked = newValue!;
        });
        widget.onChanged(newValue!);
      },
    );
  }
}
