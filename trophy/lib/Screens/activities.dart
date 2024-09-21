import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trophy/blocs/activities/activities_bloc.dart';
import 'package:trophy/blocs/activities/activities_event.dart';
import 'package:trophy/blocs/activities/activities_state.dart';
import 'package:trophy/Components/activity_card.dart';
import 'package:trophy/Components/custom_app_bar.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivitiesBloc()..add(LoadActivities()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'ACTIVITIES',
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
            builder: (context, state) {
              if (state is ActivitiesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ActivitiesLoaded) {
                return ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Engage in the following extracurricular activities to earn coins and climb the Trophy ladder like a champ!',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: state.activities.map((activity) {
                        return CustomCard(
                          title: activity.title,
                          description: activity.description,
                          imageUrl: activity.imageUrl,
                          coinCount: activity.coinCount,
                          activitiesdetails: activity.activitiesdetails,
                          activitiesmainimgUrl: activity.activitiesmainimgUrl,
                          activitydate: activity.activitydate,
                          activitytime: activity.activitytime,
                          activityvenue: activity.activityvenue,
                        );
                      }).toList(),
                    ),
                  ],
                );
              } else if (state is ActivitiesLoadFailure) {
                return Center(child: Text(state.error));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
