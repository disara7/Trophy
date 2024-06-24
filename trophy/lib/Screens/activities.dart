import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/blocs/activities/activities_bloc.dart';
import 'package:trophy/blocs/activities/activities_event.dart';
import 'package:trophy/blocs/activities/activities_state.dart';
import 'package:trophy/Components/activity_card.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivitiesBloc()..add(LoadActivities()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'ACTIVITIES',
          coinCount: 500,
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
            builder: (context, state) {
              if (state is ActivitiesLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ActivitiesLoaded) {
                print(
                    'Activities Loaded: ${state.activities.length} activities');
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Engage in the following extracurricular activities to earn coins and climb the Trophy ladder like a champ!',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: state.activities.map((activity) {
                        print('Activity: ${activity.title}');
                        return CustomCard(
                          title: activity.title,
                          description: activity.description,
                          imageUrl: activity.imageUrl,
                          coinCount: activity.coinCount,
                        );
                      }).toList(),
                    ),
                  ],
                );
              } else if (state is ActivitiesError) {
                return Center(child: Text('Failed to load activities'));
              }
              return Container(); // This handles any unexpected states
            },
          ),
        ),
      ),
    );
  }
}
