import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trophy/Components/custom_app_bar.dart';
import 'package:trophy/blocs/hackathons/hackathons_bloc.dart';
import 'package:trophy/blocs/hackathons/hackathons_event.dart';
import 'package:trophy/blocs/hackathons/hackathons_state.dart';
import 'package:trophy/Components/hackathon_card.dart';

class Hackathon extends StatelessWidget {
  const Hackathon({super.key});

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
                return const Center(child: CircularProgressIndicator());
              } else if (state is HackathonsLoaded) {
                print(
                    'Hackathons Loaded: ${state.hackathons.length} hackathons');
                return ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Participate in Hackathons to earn coins. You are free to choose hackathons that interest you out of the variety given below.',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: state.hackathons.map((hackathon) {
                        print('Hackathon: ${hackathon.hacktitle}');
                        return GestureDetector(
                          child: CustomHackCard(
                            hacktitle: hackathon.hacktitle,
                            hackdescription: hackathon.hackdescription,
                            hackimageUrl: hackathon.hackimageUrl,
                            hackcoinCount: hackathon.hackcoinCount,
                            hackathondetails: hackathon.hackathondetails,
                            hackathonmainimgUrl: hackathon.hackathonmainimgUrl,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              } else if (state is HackathonsLoadFailure) {
                return const Center(child: Text('Failed to load hackathons'));
              }
              return Container(); // This handles any unexpected states
            },
          ),
        ),
      ),
    );
  }
}
