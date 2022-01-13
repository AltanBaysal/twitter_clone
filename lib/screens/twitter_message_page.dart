import 'package:flutter/material.dart';
import 'package:twitter/ui/widgets/appbar/appbar.dart';
import 'package:twitter/ui/widgets/appbar/message_page_appbar.dart';
import 'package:twitter/ui/widgets/chat.dart';


class MessagePage extends StatefulWidget {
  const MessagePage({ Key? key }) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) => [
        const AppbarUI(appbaritems: MessagePageAppBar()),
      ],
      

      //? yukarı çekme olayını yapamadım
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: ListView.builder(          
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) => Chat(),
        ),
      ),
    );
  }

    Future _refresh() {
    setState(() {});
    return Future.value(true);
  }
}


