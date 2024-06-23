import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/blocs/hackathons/hackathons_bloc.dart';
import 'package:trophy/blocs/hackathons/hackathons_event.dart';
import 'package:trophy/blocs/hackathons/hackathons_state.dart';
import 'package:trophy/Components/hackathon_card.dart';

class Hackathon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HackathonsBloc()..add(LoadHackathons()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'HACKATHONS',
          coinCount: 500,
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<HackathonsBloc, HackathonState>(
            builder: (context, state) {
              if (state is HackathonsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HackathonsLoaded) {
                print(
                    'Hackathons Loaded: ${state.hackathons.length} hackathons');
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Participate in Hackathons to earn coins. You are free to choose hackathons that interest  you out of the variety given below.',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: state.hackathons.map((activity) {
                        print('Hackathon: ${activity.hacktitle}');
                        return CustomHackCard(
                          hacktitle: activity.hacktitle,
                          hackdescription: activity.hackdescription,
                          hackimageUrl: activity.hackimageUrl,
                          hackcoinCount: activity.hackcoinCount,
                        );
                      }).toList(),
                    ),
                  ],
                );
              } else if (state is HackathonsError) {
                return Center(child: Text('Failed to load hackathons'));
              }
              return Container(); // This handles any unexpected states
            },
          ),
        ),
      ),
    );
  }
}
