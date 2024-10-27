import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_commerce/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_commerce/presentation/auth/bloc/ages_display_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is Agesloading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is Agesloaded) {
            return _ages(state.ages);
          }
          if (state is AgesloadFailure) {
            return Container(
                alignment: Alignment.center, child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                context
                    .read<AgeSelectionCubit>()
                    .selectAge(ages[index].data()['value']);
              },
              child: Text(
                ages[index].data()['value'],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(),
        itemCount: ages.length);
  }
}
