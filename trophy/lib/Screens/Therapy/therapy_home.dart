import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Components/custom_app_bar.dart';
import '../../blocs/therapy/category/category_bloc.dart';
import '../../blocs/therapy/category/category_event.dart';
import '../../blocs/therapy/category/category_state.dart';
import '../../themes/color_palette.dart';
import 'Chat.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'THERAPY',
        coinCount: 500,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Choose your Therapist",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CategoryBloc>().add(ChangeCategory());
                  },
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(state.image),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(state.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Chat()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.appOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Start Chat',
                      style: TextStyle(color: Palette.appBlack),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
