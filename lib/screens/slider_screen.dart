import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sliders and Checks'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Slider.adaptive(
                  min: 50,
                  max: 1000,
                  value: _sliderValue,
                  activeColor: AppTheme.primary,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  }),
              Image(
                image: const AssetImage('assets/batman.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
              const SizedBox(height: 50)
            ],
          ),
        ));
  }
}
