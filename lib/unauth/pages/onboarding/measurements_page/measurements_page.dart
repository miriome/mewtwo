import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mewtwo/routes/routes.dart';

class MeasurementsPage extends StatelessWidget {
  const MeasurementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Your Measurements",
          ),
          actions: [
            TextButton(
                onPressed: () {
                  HomePageRoute().go(context);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Color(0xFF7D7878)),
                ))
          ],
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Providing miromie with your measurements will allow us to recommend you people that match your body shape, enhancing your browsing and shopping experience. By default, your measurements are visible to everyone.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF7D7878),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Height",
                        suffixText: "cm",
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Bust",
                        suffixText: "in",
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Waist",
                        suffixText: "in",
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Hips",
                        suffixText: "in",
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    howToMeasureYourBody(),
                    const SizedBox(
                      height: 24,
                    ),
                    
                  ]),
                ),
              ),
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: FilledButton(onPressed: () {
                    
                    }, child: const Text("Enter Miromie!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                  )
            ],
          ),
        ),
      ),
    );
  }
  Widget howToMeasureYourBody() {
    return Row(
      
      children: [
        const Expanded(
          child: Text.rich(
            TextSpan(
              style: TextStyle(color: Color(0xFF7D7878)),
            children: [
              TextSpan(text: "How to measure your body?\n\n", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "1. Bust\n",style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "Measure the circumference over the fullest part of your bust.\n\n", ),
              TextSpan(text: "2. Waist\n",style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "Measure your waist at the thinnest place.\n\n"),
              TextSpan(text: "3. Hips\n",style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "Hips Measure the fullest part of your hips."),
              
            ]
          ),
          maxLines: 20,
          style: TextStyle(height: 1),
          ),
        ),
        Image.asset('assets/images/measurements/measurements.webp', height: 192, width: 85,)
      ],
    );
  }
}
