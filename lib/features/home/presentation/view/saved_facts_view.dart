import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_cat/assets/colors/colors.dart';
import 'package:task_cat/features/home/presentation/controller/bloc/home_bloc.dart';

class SavedFactsView extends StatelessWidget {
  const SavedFactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved facts")),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          if (state.factTitles.isEmpty) {
            return const Center(
                child: Text(
              "no saved facts",
              style: TextStyle(color: dark, fontSize: 18),
            ));
          }

          return ListView.builder(
            itemCount: state.factTitles.length,
            itemBuilder: (context, index) {
              final title = state.factTitles[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  title,
                  style: const TextStyle(color: dark, fontSize: 18),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
