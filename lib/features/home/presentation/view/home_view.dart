import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:task_cat/assets/colors/colors.dart';
import 'package:task_cat/features/common/controllers/show_pop_up/show_pop_up_bloc.dart';
import 'package:task_cat/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:task_cat/features/home/presentation/controller/home_controller.dart';
import 'package:task_cat/features/home/presentation/view/saved_facts_view.dart';
import 'package:task_cat/features/home/presentation/widget/dialogs/w_random_fact_dialog.dart';
import 'package:task_cat/features/home/presentation/widget/w_shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final vmController = HomeController();

  @override
  void initState() {
    context.read<HomeBloc>().add(GetFactsApiEvent(onError: () {
      context.read<ShowPopUpBloc>().add(ShowPopUp(
            message: "something went wrong!",
            status: PopStatus.error,
          ));
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Tooltip(
              message: "saved facts",
              child: IconButton(
                icon: const Icon(Icons.list),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SavedFactsView())),
              ),
            ),
            title: const Text("FACTS ABOUT CATS"),
            actions: [
              TextButton.icon(
                onPressed: () {
                  context.read<HomeBloc>().add(AddFactTitlesEvent(state.factsModel.map((e) => e.text).toList()));
                },
                label: const Text("save all"),
                icon: const Icon(Icons.all_inbox),
              )
            ],
          ),
          body: state.statusFacts.isInitial || state.statusFacts.isInProgress
              ? ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const SizedBox(height: 72, child: WShimmer());
                  },
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: state.factsModel.length,
                  itemBuilder: (context, index) {
                    final item = state.factsModel[index];

                    return ListTile(
                      title: Text("Source: ${item.source}"),
                      subtitle: Text(item.text),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => WRandomFactDialog(imageProvider: vmController.imageProvider),
              ).then((value) => vmController.clearImageCache());
            },
            backgroundColor: blue,
            foregroundColor: white,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
