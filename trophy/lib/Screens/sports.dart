import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/blocs/sports/sports_bloc.dart';
import 'package:trophy/blocs/sports/sports_event.dart';
import 'package:trophy/blocs/sports/sports_state.dart';
import 'package:trophy/Components/sport_card.dart';

class Sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SportsBloc()..add(LoadSports()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'SPORTS',
          coinCount: 500,
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<SportsBloc, SportsState>(
            builder: (context, state) {
              if (state is SportsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SportsLoaded) {
                print('Activities Loaded: ${state.sports.length} activities');
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Tournaments and Matches:',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: state.sports.map((sport) {
                        print('Activity: ${sport.sporttitle}');
                        return CustomCard(
                          sporttitle: sport.sporttitle,
                          sportdescription: sport.sportdescription,
                          sportimageUrl: sport.sportimageUrl,
                          sportcoinCount: sport.sportcoinCount,
                        );
                      }).toList(),
                    ),
                  ],
                );
              } else if (state is SportsError) {
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
