import 'package:assignment2/widgets/app_bar/appbar_title.dart';
import 'package:assignment2/widgets/app_bar/appbar_trailing_circleimage.dart';
import 'package:assignment2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:assignment2/widgets/custom_text_form_field.dart';
import 'package:assignment2/widgets/custom_outlined_button.dart';
import 'package:assignment2/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment2/core/app_export.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class firstpage extends StatefulWidget {
  firstpage({Key? key})
      : super(
    key: key,
  );

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  final List<String> questions = [
  '1. Have you ever been diagnosed with cancer?',
  '2. Please give us a short description of which cancer you had, when did you have it and what treatment you have taken for it.',
  '3. How often do you exercise?',
  '',
  ];


  bool yes_btn = false;
  bool no_btn=false;
  bool option3=false;
  bool option4 =false;
  TextEditingController answer2 = TextEditingController();
  late double screen_width;
  int _currentPage = 0;
  List<String> _answers = List.filled(4, '');

  @override
  Widget build(BuildContext context) {
    print(_answers[1]);
  screen_width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _buildAppBar(context),
        body: SizedBox(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  //width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                  ),
                ),
                _topText(context),
                Expanded(
                  child: PageView.builder(itemCount:questions.length,
                    physics: NeverScrollableScrollPhysics(),
                    controller: PageController(initialPage: _currentPage),
                    itemBuilder: (context,index){
                    index=_currentPage;
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 14.v,
                          ),
                          decoration: AppDecoration.fillGray,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 3.h,
                                  right: 3.h,
                                ),
                                child: Text(questions[index],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyLargeBlack900,
                                ),
                              ),
                              if(index==0)
                              Column(
                                children:[ Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50.h,
                                  margin: EdgeInsets.only(top: 30.h),
                                  child: FilledButton(
                                      onPressed: () { setState(() {
                                        yes_btn=true;
                                        no_btn=false;
                                        _answers[index]='Yes';
                                      }); },
                                      style: FilledButton.styleFrom(
                                        backgroundColor: yes_btn ? Color.fromRGBO(33, 61, 104, 0.7) : Color.fromRGBO(122, 139, 164, 0.18),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Yes',textAlign: TextAlign.start,
                                            style: TextStyle(color: yes_btn?Color.fromRGBO(242, 246, 250, 1):Color.fromRGBO(52, 52, 52, 1))),
                                      )
                                  ),
                                ),

                              Container(
                                width: screen_width,
                                height: 50.h,
                                margin: EdgeInsets.only(top: 10.h,bottom: 10.h),
                                child: FilledButton(
                                    onPressed: () { setState(() {
                                      yes_btn=false;
                                      no_btn=true;
                                      _answers[index]='No';
                                    }); },
                                    style: FilledButton.styleFrom(
                                      backgroundColor: no_btn ? Color.fromRGBO(33, 61, 104, 0.7) : Color.fromRGBO(122, 139, 164, 0.18),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('No',textAlign: TextAlign.start,
                                          style: TextStyle(color: no_btn?Color.fromRGBO(242, 246, 250, 1):Color.fromRGBO(52, 52, 52, 1))),
                                    )
                                ),
                              ),
                              ]),
                              if(index==1)
                              Container(
                                width: screen_width,
                                height: 106.v,
                                margin: EdgeInsets.only(top: 10.h,bottom: 10.h),
                                child: CustomTextFormField(
                                  controller: answer2,
                                  hintText: "Type in your answer here...",
                                  textInputAction: TextInputAction.done,
                                  maxLines: 3,
                                ),
                              ),
                              if(index==2)
                                Column(
                                    children:[
                                      Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.h,
                                      margin: EdgeInsets.only(top: 30.h),
                                      child: FilledButton(
                                          onPressed: () { setState(() {
                                            yes_btn=true;
                                            no_btn=false;
                                            option3=false;
                                            option4=false;
                                            _answers[index]='Never';
                                          }); },
                                          style: FilledButton.styleFrom(
                                            backgroundColor: yes_btn ? Color.fromRGBO(33, 61, 104, 0.7) : Color.fromRGBO(122, 139, 164, 0.18),
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('Never',textAlign: TextAlign.start,
                                                style: TextStyle(color: yes_btn?Color.fromRGBO(242, 246, 250, 1):Color.fromRGBO(52, 52, 52, 1))),
                                          )
                                      ),
                                    ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50.h,
                                        margin: EdgeInsets.only(top: 10.h),
                                        child: FilledButton(
                                            onPressed: () { setState(() {
                                              yes_btn=false;
                                              no_btn=true;
                                              option3=false;
                                              option4=false;
                                              _answers[index]='Only on weekends';
                                            }); },
                                            style: FilledButton.styleFrom(
                                              backgroundColor: no_btn ? Color.fromRGBO(33, 61, 104, 0.7) : Color.fromRGBO(122, 139, 164, 0.18),
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Only on weekends',textAlign: TextAlign.start,
                                                  style: TextStyle(color: no_btn?Color.fromRGBO(242, 246, 250, 1):Color.fromRGBO(52, 52, 52, 1))),
                                            )
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50.h,
                                        margin: EdgeInsets.only(top: 10.h),
                                        child: FilledButton(
                                            onPressed: () { setState(() {
                                              yes_btn=false;
                                              no_btn=false;
                                              option3=true;
                                              option4=false;
                                              _answers[index]='Moderate (3/week)';
                                            }); },
                                            style: FilledButton.styleFrom(
                                              backgroundColor: option3 ? Color.fromRGBO(33, 61, 104, 0.7) : Color.fromRGBO(122, 139, 164, 0.18),
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Moderate (3/week)',textAlign: TextAlign.start,
                                                  style: TextStyle(color: option3?Color.fromRGBO(242, 246, 250, 1):Color.fromRGBO(52, 52, 52, 1))),
                                            )
                                        ),
                                      ),

                                      Container(
                                        width: screen_width,
                                        height: 50.h,
                                        margin: EdgeInsets.only(top: 10.h,bottom: 10.h),
                                        child: FilledButton(
                                            onPressed: () { setState(() {
                                              yes_btn=false;
                                              no_btn=false;
                                              option3=false;
                                              option4=true;
                                              _answers[index]='Regular (5/week or more)';
                                            }); },
                                            style: FilledButton.styleFrom(
                                              backgroundColor: option4 ? Color.fromRGBO(33, 61, 104, 0.7) : Color.fromRGBO(122, 139, 164, 0.18),
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Regular (5/week or more)',textAlign: TextAlign.start,
                                                  style: TextStyle(color: option4?Color.fromRGBO(242, 246, 250, 1):Color.fromRGBO(52, 52, 52, 1))),
                                            )
                                        ),
                                      ),
                                    ]),

                              if(index==3)
                                Column(
                                  children: [
                                    Container(
                                      width: screen_width,
                                      child: Text('You are at the end of your assessment.',
                                      textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles.titleMediumBlackA700,
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 40.h,left: 30.h,right: 30.h),
                      child: Text(
                      'Thank you for answering all the questions. You will receive a report through your email  within 24 hours.',
                        textAlign: TextAlign.center,
                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 40.h,left: 30.h,right: 30.h),
                                      child: Text(
                                        'If you need any further assistance please contact us via hello@onco-connect.com',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                      ],
                    );

                    },
                  ),
                ),
                 if(_currentPage!=3)
                 _nextPrev(context)
                else
                  Padding(padding: EdgeInsets.only(bottom: 30.h),
                     child:  CustomElevatedButton(text:'Done',
                       margin: EdgeInsets.symmetric(horizontal: 16.h),
                      ),
                  )
              ],
            ),
          ),
        ),
        //bottomNavigationBar: _nextPrev(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 40.h,
      leading: AppbarTrailingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 30.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "My Cancer Risk Assessment",
      ),
      actions: [
        AppbarTrailingCircleimage(
          imagePath: ImageConstant.imgAvatar,
          margin: EdgeInsets.only(left: 20.h),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgImage4,
          margin: EdgeInsets.only(
            left: 17.h,
            right: 20.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _topText(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 5.v,
      ),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: AppDecoration.fillGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h,top: 10.v),
            child: Text(
              "Complete the questionnaire at your own pace",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 3.h,top: 10.h),

              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(int.parse('#DC7D57'.substring(1), radix: 16) + 0xFF000000)),
                    backgroundColor: Colors.grey[300],
                    value: _currentPage/37,
                  ),
                  Padding(padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width-50)*_currentPage/37),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 15.v,
                        width: 16.h,
                        child: AnimatedPositioned(duration: Duration(milliseconds: 200),
                          left: 16.h*0.2,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 5.v,
                                  width: 5.h,
                                  decoration: BoxDecoration(
                                    color: appTheme.red30001,
                                    borderRadius: BorderRadius.circular(
                                      2.h,
                                    ),
                                  ),
                                ),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.h,
                                    vertical: 1.v,
                                  ),
                                  decoration: AppDecoration.fillRed.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder7,
                                  ),
                                  child: Text((_currentPage+1).toString(),
                                    style: theme.textTheme.labelSmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 2.v),
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Text(
              (_currentPage+1).toString()+"/37 questions answered",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _nextPrev(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h,right: 16.h,bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOutlinedButton(
            width: 150.h,text: 'Previous',
            onPressed: _currentPage>0?(){setState(() {
              _currentPage--;
            });
              }:null,
          ),
          CustomElevatedButton(onPressed: _currentPage < questions.length - 1
              ? () {
            setState(() {
              _answers[1]=answer2.text;
              if (_answers[_currentPage].isEmpty) {
                Fluttertoast.showToast(
                  msg: 'Please answer the current question first!',
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                );
                // Prevent navigation if the question is not answered
                Future.delayed(Duration(milliseconds: 100), () {
                  // Delay to avoid multiple toasts in quick succession
                  setState(() {
                    _currentPage = _currentPage; // Stay on the same page
                  });
                });
              } else {
                setState(() {
                  yes_btn=false;
                  no_btn=false;
                  _currentPage++;
                });
              }
            });
          }
              : null,
            width: MediaQuery.of(context).size.width*0.45,
            text: "Next",
          ),
        ],
      ),
    );
  }
}
