import 'package:flutter/material.dart';
import 'package:flutter_bundang/components/i_margin.dart';
import 'package:flutter_bundang/components/i_press_button.dart';
import 'package:flutter_bundang/theme/i_set_color.dart';
import 'package:flutter_bundang/theme/i_set_contract.dart';
import 'package:flutter_bundang/theme/i_set_text.dart';

class SignUpContract extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              iHeightMedium,
              Text(
                '이용약관',
                style: ISetText.headline,
              ),
              iHeightMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: pressButton(
                      Center(child: Text('회원이용약관', style: ISetText.body,)),
                      selected: true
                    ),
                  ),
                  iWidthMedium,
                  Expanded(
                    child: pressButton(
                      Center(child: Text('개인정보정책', style: ISetText.body,)),
                    ),
                  ),
                  iWidthMedium,
                  Expanded(
                    child: pressButton(
                      Center(child: Text('환불정책', style: ISetText.body,)),
                    ),
                  ),
                ],
              ),
              iHeightLarge,
              Text(user_contract, style: ISetText.textSection,),
            ],
          ),
        ),
      ),
    );
  }
}
