import 'package:flutter/material.dart';
import 'package:twitter/constants/color_constants.dart';

import '../../../../main.dart';


//! recent eklenecek
class TwitterSearchPageSearchScreenBodySearchSomething extends StatelessWidget {
  const TwitterSearchPageSearchScreenBodySearchSomething({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: width,
          height: height * 0.1,
          padding: EdgeInsets.symmetric(horizontal: width*0.15),
          child: Text(
            local.twitterSearchPageSearchScreenBodySearchSomething, //! l10n
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorsConstant.darkGrey,
              fontSize: width * 0.034,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
