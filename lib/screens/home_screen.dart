import 'package:flutter/material.dart';
import 'package:github_issues_app/constants/constants.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              title: Text(
                APP_TITLE,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              centerTitle: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                )
              ],
              expandedHeight: 180.0,
              collapsedHeight: 180.0,
              flexibleSpace: Container(
                height: 180.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // search widget
                    SearchWidget(),

                    SizedBox(
                      height: 20.0,
                    ),

                    // bottom row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(DATE_TEXT),
                        Text(FILTER_BY_TEXT),
                        Text(IOS_TEXT),
                        Text(ANDROID_TEXT),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return CustomCard();
                },
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
