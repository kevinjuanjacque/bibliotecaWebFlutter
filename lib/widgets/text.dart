import 'package:app_flutter/widgets/text_fidel_pass.dart';
import 'package:flutter/material.dart';

class TextVisibility extends StatefulWidget {
  TextVisibility({Key key}) : super(key: key);

  @override
  _TextVisibilityState createState() => _TextVisibilityState();
}

class _TextVisibilityState extends State<TextVisibility> {
  final textPass = TextPass();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: textoPassword(context),
    );
  }

  Widget textoPassword(BuildContext context) {
    return AnimatedBuilder(
      animation: textPass,
      builder: (context, _) {
        return TextField(
          obscureText: textPass.candado,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                splashColor: Colors.red,
                icon: textPass.iconCandado,
                color: Colors.blue[700],
                onPressed: () {
                  textPass.changeVisibility();
                },
              ),
              fillColor: Colors.black,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.yellow[700],
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.black)),
        );
      },
    );
  }
}
