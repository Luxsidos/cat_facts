import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:task_cat/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:task_cat/features/home/presentation/widget/w_shimmer.dart';

class WRandomFactDialog extends StatefulWidget {
  const WRandomFactDialog({super.key});

  @override
  State<WRandomFactDialog> createState() => _WRandomFactDialogState();
}

class _WRandomFactDialogState extends State<WRandomFactDialog> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const GetFactApiEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "https://cataas.com/cat",
                    key: ValueKey(DateTime.now()),
                  ),
                ),
                const SizedBox(height: 16),
                state.statusFact.isSuccess
                    ? Text(
                        state.factModel.text,
                        style: const TextStyle(fontSize: 18),
                      )
                    : const SizedBox(height: 120, child: WShimmer()),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () => context.read<HomeBloc>().add(AddFactTitleEvent(state.factModel.text)),
                    icon: const Icon(Icons.add),
                    label: const Text("add new"),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
