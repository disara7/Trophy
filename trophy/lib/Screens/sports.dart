import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trophy/blocs/sports/sports_bloc.dart';
import 'package:trophy/blocs/sports/sports_event.dart';
import 'package:trophy/blocs/sports/sports_state.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/Components/sport_card.dart';
import 'sportdetailspage.dart';
import 'package:trophy/blocs/sports/sport.dart';

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
                print('Sports Loaded: ${state.sports.length} sports');
                return ListView(
                  children: [
                    _buildSection(
                      context,
                      'Tournaments and Matches',
                      state.sports
                          .where((sport) => sport.type == 'tournament')
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    _buildSection(
                      context,
                      'Clubs',
                      state.sports
                          .where((sport) => sport.type == 'club')
                          .toList(),
                    ),
                  ],
                );
              } else if (state is SportsError) {
                return Center(child: Text('Failed to load sports'));
              }
              return Container(); // This handles any unexpected states
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String sectionTitle, List<Sport> sports) {
    if (sports.isEmpty) {
      return Container(); // Return an empty container if no sports in this section
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sectionTitle,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: sports.map((sport) {
            print('Sport: ${sport.sporttitle}');
            return GestureDetector(
              onTap: () {
                // Navigate to Sport Details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SportDetailsPage(
                      sportTitle: sport.sporttitle,
                      sportCoinCount: sport.sportcoinCount,
                      sportDescription: sport.sportdescription,
                      sportdetails: sport.sportdetails,
                      sportmainimgUrl: sport.sportmainimgUrl,
                    ),
                  ),
                );
              },
              child: CustomCard(
                sporttitle: sport.sporttitle,
                sportdescription: sport.sportdescription,
                sportimageUrl: sport.sportimageUrl,
                sportcoinCount: sport.sportcoinCount,
                type: sport.type,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
