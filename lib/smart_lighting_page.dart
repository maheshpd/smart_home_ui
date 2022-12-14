import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SmartLightingPage extends StatefulWidget {
  const SmartLightingPage({super.key});

  @override
  State<SmartLightingPage> createState() => _SmartLightingPageState();
}

class _SmartLightingPageState extends State<SmartLightingPage> {
  bool condition = true;
  String _deviceType = "Panasonic Smart Lighting";

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  double _slider = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Column(
          children: const [Text("Smart Ligthing"), Text("Living room")],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Container(
            height: 38,
            // width: 400,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
                borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: DropdownButton<String>(
              underline: Container(),
              onChanged: (value) {
                setState(() {
                  _deviceType = value ?? "";
                });
              },
              value: _deviceType,
              items: const [
                DropdownMenuItem(
                  value: "Panasonic Smart Lighting",
                  child: Text("Panasonic Smart Lighting"),
                ),
                DropdownMenuItem(
                  value: "Panasonic Smart Lighting2",
                  child: Text("Panasonic Smart Lighting2"),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const Text(
                  'Device condition',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(condition ? "On" : "Off"),
                Switch(
                    value: condition,
                    onChanged: (b) {
                      setState(() {
                        condition = b;
                      });
                    })
              ],
            ),
          ),
          ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: (Color value) {
              setState(() {
                pickerColor = value;
              });
            },
            displayThumbColor: false,
            hexInputBar: false,
            enableAlpha: false,
            paletteType: PaletteType.hueWheel,
            portraitOnly: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.sunny),
                Text(
                  "${_slider.toStringAsFixed(0)}%",
                )
              ],
            ),
          ),
          Slider(
            value: _slider,
            min: 0.0,
            max: 100,
            onChanged: (d) {
              setState(() {
                _slider = d;
              });
            },
          ),
          Text("Schedule time")
        ],
      ),
    );
  }
}
