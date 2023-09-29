
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/Views/Widgets/loadingscreennopop.dart';

import '../darius_mock_models/remote_service_list_objects.dart';
import '../darius_mock_models/remote_service_singular_object.dart';
import 'Classes/User.dart';
import 'Classes/activitydetails.dart';
import 'Styles/Colors.dart';
import 'Widgets/containersearchactivity.dart';
import 'Widgets/loadingscreen.dart';

class OngoingActivities extends StatefulWidget {
  final User? user;

  const OngoingActivities({super.key, required this.user});

  @override
  State<OngoingActivities> createState() => _OngoingActivitiesState();
}

class _OngoingActivitiesState extends State<OngoingActivities> {

  bool isLoaded = false;
  List<ActivityDetails> activitiesCurrent = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final activityData = await fetchEventData();

    setState(() {
      activitiesCurrent = activityFromJson(json.encode(activityData)).where((activity) => widget.user!.activities_enrolled.contains(activity.id)).toList();
      isLoaded = true;
    });
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreenPage()));
  }

  bool _isOnline(ActivityDetails activity){
    return activity.address != "online";
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded ? Scaffold(
      appBar: AppBar(
        title: Text("Ongoing Activities"),
        backgroundColor: Color_Blue,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _onBackPressed();
          },
        ),
      ),
      body: Container(
        color: Color_Gray,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: activitiesCurrent.length ?? 0,
                itemBuilder: (context, index) {
                  final activity = activitiesCurrent[index];
                  return ContainerActivityForSearch(activity, widget.user!, _isOnline(activity));
                },
              ),
            ),
          ],
        ),
      ),
    ): LoadingScreenPageNoPop();
  }
}





