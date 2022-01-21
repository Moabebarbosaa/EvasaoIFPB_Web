import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String negativeBtnText;
  final Widget content;

  CustomDialog({
    required this.content,
    required this.negativeBtnText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: 800,// Bottom rectangular box
          margin: EdgeInsets.only(top: 40), // to push the box half way below circle
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.only(top: 20, left: 20, right: 20), // spacing inside the box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              content,
              SizedBox(
                height: 5,
              ),
              ButtonBar(
                buttonMinWidth: 100,
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text(negativeBtnText),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          maxRadius: 40.0,
          child: Icon(Icons.person,color: Colors.white,),
        ),
      ],
    );
  }
}
