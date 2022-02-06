import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/controllers/twitter_search_page_search_state.dart';
import 'package:twitter/screens/twitter_search_page_search_conclusion.dart';
import 'package:twitter/ui/helper/custom_slide_page_route.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController =TextEditingController(); //? cursor sıkıntı çıkarıdı :(
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      height: height * 0.08,
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 0.5, color: ColorsConstant.lightGrey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          InkWell(
            borderRadius: BorderRadius.circular(height),
            onTap: () {
              Navigator.of(context).pop();
            },
            
            child: Container(
              padding: EdgeInsets.all(height * 0.01),
              child: Icon(
                Icons.arrow_back,
                size: width * 0.08,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: width * 0.06, right: width * 0.015),
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<TwitterSearchPageSearchState>(
                      builder: (_, value, __) => TextField(
                        //? key vermeden textini nasıl değiştirebilirim bulamadım
                        controller: _textController,
                        textInputAction: TextInputAction.search,
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: "Twitter'da Ara",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ), //!l10
                        style: const TextStyle(color: Colors.blue),
                    
                        onSubmitted: (value) {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            CustomSlidePageRoute(
                              direction: AxisDirection.up,
                              child: const TwitterSearchPageSearchConclusion(),
                            ),
                          );
                    
                        },
                        
                        onChanged: (String input) => value.searchBarOnChangeText(text: input),
                      ),
                    ),
                  ),

                  Consumer<TwitterSearchPageSearchState>(
                    builder: (_, value,__) => Visibility(
                      visible: !value.isSearchBarTextEmpty(),
                      child: Container(
                        margin: EdgeInsets.only(left: width * 0.03),
                        child: InkWell(
                          onTap: () {
                            _textController.text = ""; //? bu yapıyı hiç beğenmedim
                            value.searchBarOnChangeText(text: "");
                          },
                          child: Icon(
                            Icons.close,
                            size: width * 0.08,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}