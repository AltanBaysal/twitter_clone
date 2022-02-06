import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/controllers/twitter_search_page_search_state.dart';
import 'package:twitter/ui/widgets/common/basic_list_profile_view.dart';
import 'package:twitter/ui/widgets/common/simple_inkwell_text_button.dart';

class TwitterSearchPageSearchScreenBodyConclusion extends StatelessWidget {
  const TwitterSearchPageSearchScreenBodyConclusion({Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: height * 0.01),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
          ),
          child: Consumer<TwitterSearchPageSearchState>(
            builder: (_, value, __) => SimpleInkwellTextButton(
              func: () {},
              text: value.searchForText,
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: height * 0.01),
          child: Consumer<TwitterSearchPageSearchState>(
            builder: (_, value, __) => Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.filteredUserListBySearchBarText.length,
                  itemBuilder: (context, index) => BasicProfileListTile(user: value.filteredUserListBySearchBarText[index],),
                ),
                
                SimpleInkwellTextButton(
                  func: () {},
                  text: value.goToText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


