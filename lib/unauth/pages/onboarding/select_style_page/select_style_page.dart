import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mewtwo/constants.dart';
import 'package:mewtwo/unauth/pages/onboarding/select_style_page/select_style_page_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectStylePage extends StatelessWidget {
  SelectStylePage({Key? key}) : super(key: key);
  final store = SelectStylePageStore();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Text("Skip", style: TextStyle(fontSize: 12, color: Color(0xFF7D7878))),
            SizedBox(
              width: 28,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Which of these styles do you like?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 44,
              ),
              Expanded(child: stylesGrid),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FilledButton(
                  style: const ButtonStyle(elevation: MaterialStatePropertyAll(0)),
                  onPressed: () async {
                    final sp = await SharedPreferences.getInstance();
                      sp.setString(Constants.kKeyStyles, store.selectedStyles.join(","));
                      if (context.mounted) {
                        // push new route
                      }
                  }, child: const Text("Next", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),),
              ),
                
            ],
          ),
        ),
      ),
    );
  }

  Widget get stylesGrid {
    return GridView.builder(
      itemCount: Constants.kStyles.length,
      itemBuilder: (context, index) {
        final style = Constants.kStyles[index];
        return GestureDetector(
          onTap: () {
            if (store.selectedStyles.contains(style)) {
              store.selectedStyles.remove(style);
              return;  
            }
            store.selectedStyles.add(style);
            },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(6),
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.all(Radius.circular(6)),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Observer(
                      builder: (context) {
                        return AspectRatio(
                          aspectRatio: 100 / 143,
                          child: Image.asset(
                            'assets/images/styles/$style.jpg',
                            fit: BoxFit.cover,
                            color: store.selectedStyles.contains(style) ? Theme.of(context).primaryColor.withOpacity(0.5): null,
                            colorBlendMode: BlendMode.srcOver,
                          ),
                        );
                      }
                    ),
                    Text(
                      style,
                      style: const TextStyle(fontSize: 16, color: Color(0xFF7D7878)),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 24, crossAxisSpacing: 24, childAspectRatio: 100 / 166),
    );
  }
}
