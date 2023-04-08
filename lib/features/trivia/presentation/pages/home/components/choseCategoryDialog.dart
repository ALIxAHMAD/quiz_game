import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/home/home_cubit.dart';

class ChoseCategoryDialog extends StatelessWidget {
  const ChoseCategoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Dialog(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cubit.state.categories.categories.length,
        itemBuilder: (context, index) {
          final category = cubit.state.categories.categories[index];
          return ListTile(
            onTap: () {
              cubit.choseCategory(category);
              Navigator.of(context).pop();
            },
            title: Text(category.name),
          );
        },
      ),
    );
  }
}
