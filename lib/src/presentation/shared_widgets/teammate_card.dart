import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeammateCard extends StatelessWidget {

  const TeammateCard(this.userName, this.userTeamRole, this.userId,
      {super.key});

  final String userName;
  final String userTeamRole;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      margin: EdgeInsets.only(left: 30.sp, right: 30.sp, top: 16.sp),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.sp, bottom: 8.sp),
            child: Row(
                children: <Widget>[
                  Image(image: const AssetImage('assets/images/Group 1740.png'),
                    height: 80.sp,
                    width: 80.sp,),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            userName,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.sp),
                            child: Text.rich(
                              TextSpan(
                                  text: 'Роль: ',
                                  style: Theme.of(context).textTheme.headline6,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: userTeamRole,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2)
                                  ]),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                                text: 'id: ',
                                style: Theme.of(context).textTheme.headline6,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: userId,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2)
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70.sp, right: 5.sp),
                    child: Image(image: const AssetImage('assets/images/coolLogo.png'),
                      height: 45.sp,
                      width: 45.sp,),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
