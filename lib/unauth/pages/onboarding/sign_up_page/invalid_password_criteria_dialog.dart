import 'package:flutter/material.dart';

class InvalidPasswordCriteriaDialog extends StatelessWidget {
  static Future<void> show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: InvalidPasswordCriteriaDialog(),
          

          );
        });
  }

  const InvalidPasswordCriteriaDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 22,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Password Criteria:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 22,),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check, size: 28, color: Color(0xFFDDE6A5),),
                    SizedBox(width: 12,),
                    Text("Minimum 8 characters", style: TextStyle(fontSize: 16),)
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check, size: 28, color: Color(0xFFDDE6A5),),
                    SizedBox(width: 12,),
                    Text("At least 1 number", style: TextStyle(fontSize: 16),)
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check, size: 28, color: Color(0xFFDDE6A5),),
                    SizedBox(width: 12,),
                    Text("At least 1 special character", style: TextStyle(fontSize: 16),)
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check, size: 28, color: Color(0xFFDDE6A5),),
                    SizedBox(width: 12,),
                    Flexible(
                      child: Text("Incudes both upper & lower case characters",
                      maxLines: 2,
                       style: TextStyle(fontSize: 16),),
                    )
                  ],
                )
                  ],
                ),
              )
              
            ],
          ),
        ),
        PositionedDirectional(
          top: 0,
          end: 4,
          child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close, size: 24,),
        ))
      ],
    );
  }
}
