
import 'package:example/demos/section/section_demo2.dart';
import 'package:example/iconfont/iconfont.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:base/base.dart';

class SectionDemo extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return BasePage(
			appBar: BaseNavBar(
				backgroundColor: Colors.white,
        border: null,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          BaseIcon(icon: IconFont.camera, size: 20)
        ],
			),
			body: Container(
				child: ListView.builder(
					itemCount: 1,
					itemBuilder: (context, index) {
						return Column(
							children: <Widget>[
								BaseSection(
									margin: EdgeInsets.only(top: 0.0, bottom: 10.0),
                  divider: null,
									children: <Widget>[
										BaseTile(
											useInkWell: true,
											isThreeLine: false,
											title: Text('张三', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
											subtitle: Text('WeChat ID: Flutter', style: TextStyle(color: Colors.grey)),
											contentPadding: EdgeInsets.only(
                        top: 10.0,
                        right: 10.0,
                        bottom: 30.0,
                        left: 10.0
                      ),
											leading: FlutterLogo(
                        size: 65.0,
                      ),
											trailing: Row(
												children: <Widget>[
													Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(IconFont.qrcode, size: 15, color: Colors.grey)
                          ),
													Icon(CupertinoIcons.right_chevron, color: Colors.grey)
												],
											)
										)
									]
								),
								BaseSection(
									children: <Widget>[
										BaseTile(
											contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
											leading: Padding(
												padding: EdgeInsets.only(right: 20.0, left: 10.0),
												child: BaseIcon(
													icon: IconFont.pay,
													color: Colors.lightBlue
												)
											),
											title: Text('支付'),
											trailing: Icon(CupertinoIcons.right_chevron, color: Colors.grey)
										)
									]
								),
								BaseSection(
									margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
									children: <Widget>[
										BaseTile(
											contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
											leading: Padding(
												padding: EdgeInsets.only(right: 20.0, left: 10.0),
												child: Icon(
													IconFont.collection,
													color: Colors.redAccent
												)
											),
											title: Text('收藏'),
											trailing: Icon(CupertinoIcons.right_chevron, color: Colors.grey)
										),
										BaseTile(
											contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
											leading: Padding(
												padding: EdgeInsets.only(right: 20.0, left: 10.0),
												child: Icon(
													IconFont.photo,
													color: Colors.blueAccent
												)
											),
											title: Text('相册'),
											trailing: Icon(CupertinoIcons.right_chevron, color: Colors.grey)
										),
										BaseTile(
											contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
											leading: Padding(
												padding: EdgeInsets.only(right: 20.0, left: 10.0),
												child: Icon(
													IconFont.card,
													color: Colors.green
												)
											),
											title: Text('卡包'),
											trailing: Icon(CupertinoIcons.right_chevron, color: Colors.grey)
										),
										BaseTile(
											contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
											leading: Padding(
												padding: EdgeInsets.only(right: 20.0, left: 10.0),
												child: Icon(
													IconFont.emotion,
													color: Colors.orangeAccent
												)
											),
											title: Text('表情'),
											trailing: Icon(
												CupertinoIcons.right_chevron, color: Colors.grey)
										)
									]
								),
								BaseSection(
									children: <Widget>[
										BaseTile(
											contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
											leading: Padding(
												padding: EdgeInsets.only(right: 20.0, left: 10.0),
												child: Icon(
													IconFont.settings,
													color: Colors.blueGrey
												)
											),
											title: Text('设置'),
											trailing: Row(
                        children: <Widget>[
                          Text('点我', style: TextStyle(color: Colors.grey)),
                          Icon(CupertinoIcons.right_chevron, color: Colors.grey)
                        ],
                      ),
                      onTap: () {
                        BaseRoute(
                          SectionDemo2(),
                        ).push(context, rootNavigator: true);
                      }
										)
									]
								)
							]
						);
					}
				)
			)
		);
	}

}
