import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/core/custom_widgets/drawer_button.dart';
import 'package:twitter/user_model.dart';

bool isArrowDown = true; 


class TwitterDrawer extends StatefulWidget {
  const TwitterDrawer({Key? key}) : super(key: key);

  @override
  _TwitterDrawerState createState() => _TwitterDrawerState();
}

class _TwitterDrawerState extends State<TwitterDrawer> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.88,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
              ),
              
              padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.05, width * 0.05, height*0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(selectedUser.userProfilePicture),
                    radius: width * 0.08,
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: height * 0.01,),
                   
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedUser.username,
                          style: TextStyle(
                              fontSize: width * 0.052,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        
                        GestureDetector(
                          onTap: (){
                            if(isArrowDown){
                              isArrowDown = false;
                            }
                            else{
                              isArrowDown = true;
                            }
                            setState(() {});
                          },
                          
                          child: SizedBox(
                            height: height * 0.025,
                            width: height * 0.025,
                            child : isArrowDown 
                              ? SvgPicture.asset("images/downarrow.svg",fit: BoxFit.cover,color: Colors.black) 
                              : SvgPicture.asset("images/uparrow.svg",fit: BoxFit.cover,color: Colors.black) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: height * 0.01),
                    child: Text(
                      selectedUser.userEmail,
                      style: TextStyle(
                          fontSize: width * 0.045,
                          color: const Color(0xFF7B7B7B)),
                    ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: selectedUser.following.length.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: width * 0.04),
                              children: [
                                TextSpan(
                                  text: " Takip edilen",
                                  style: TextStyle(
                                      color: const Color(0xFF7B7B7B),
                                      fontSize: width * 0.04),
                                ),
                              ]),
                        ),
                        Container(
                          width: width * 0.04,
                        ),
                        RichText(
                          text: TextSpan(
                              text: selectedUser.followers.length.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: width * 0.04),
                              children: [
                                TextSpan(
                                  text: " Takipçi",
                                  style: TextStyle(
                                      color: const Color(0xFF7B7B7B),
                                      fontSize: width * 0.04),
                                ),
                              ]),
                        ),
                      
                      ],
                    ),
                  ),
                
                ],
              ),
            ),

            
            
            if(isArrowDown) ...[
              Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: height * 0.02,top:height * 0.02),
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    drawerButtons(
                        text: "Profil",
                        icon: "images/user.svg",
                        width: width,
                        height: height),
                    drawerButtons(
                        text: "Listeler",
                        icon: "images/list.svg",
                        width: width,
                        height: height),
                    drawerButtons(
                        text: "Konular",
                        icon: "images/bubblechat.svg",
                        width: width,
                        height: height),
                    drawerButtons(
                        text: "Yer işaretleri",
                        icon: "images/tag.svg",
                        width: width,
                        height: height),
                    drawerButtons(
                        text: "Anlar",
                        icon: "images/bolt.svg",
                        width: width,
                        height: height),
                    drawerButtons(
                        text: "Gelire dönüştürme",
                        icon: "images/money.svg",
                        width: width,
                        height: height),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: height * 0.02,
                        top: height * 0.02,
                      ),
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    drawerButtons(
                        text: "Twitter for Professionals",
                        icon: "images/rocket.svg",
                        width: width,
                        height: height),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: height * 0.02,
                        top: height * 0.02,
                      ),
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    drawerButtons(
                        text: "Ayarlar ve gizlilik",
                        width: width,
                        height: height),
                    drawerButtons(
                        text: "Yardım Merkezi", width: width, height: height),
                  ],
                ),
              ),
            ),
              
              Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 0.5, color: Colors.grey)),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height * 0.03,
                    width: height * 0.03,
                    child:
                        SvgPicture.asset("images/lamp.svg", fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: height * 0.03,
                    width: height * 0.03,
                    child: SvgPicture.asset("images/qrcode.svg",
                    fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            ]

            else if(!isArrowDown) ...[
              InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: width*0.05),
                  height: height*0.06,
                  alignment: Alignment.centerLeft,
                  child: Text("Yeni hesap oluştur",style: TextStyle(fontSize: width*0.04),),
                ),
              ),
              
              InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: width*0.05,),
                  height: height*0.06,
                  alignment: Alignment.centerLeft,
                  child: Text("Var olan bir hesabı ekle",style: TextStyle(fontSize: width*0.04),),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
