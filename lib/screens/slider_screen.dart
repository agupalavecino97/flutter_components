import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 500;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sliders and Checks'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
                min: 50,
                max: 1000,
                value: _sliderValue,
                activeColor: AppTheme.primary,
                onChanged: _sliderEnabled
                    ? (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      }
                    : null),
            // Checkbox(
            //     value: _sliderEnabled,
            //     onChanged: (value) {
            //       setState(() {
            //         setState(() {
            //           _sliderEnabled = value ?? true;
            //         });
            //       });
            //     }),
            CheckboxListTile.adaptive(
                title: const Text('Habilitar Slider'),
                activeColor: AppTheme.primary,
                value: _sliderEnabled,
                onChanged: (value) {
                  setState(() {
                    setState(() {
                      _sliderEnabled = value ?? true;
                    });
                  });
                }),
            // Switch(
            //     activeColor: AppTheme.primary,
            //     value: _sliderEnabled,
            //     onChanged: (value) {
            //       setState(() {
            //         setState(() {
            //           _sliderEnabled = value ?? true;
            //         });
            //       });
            //     }),
            const AboutListTile(),
            SwitchListTile.adaptive(
                title: const Text('Habilitar Slider'),
                activeColor: AppTheme.primary,
                value: _sliderEnabled,
                onChanged: (value) {
                  setState(() {
                    setState(() {
                      _sliderEnabled = value;
                    });
                  });
                }),
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const AssetImage('assets/batman.png'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
              ),
            ),
          ],
        ));
  }
}
