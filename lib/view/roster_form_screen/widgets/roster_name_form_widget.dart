import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/roster_cubit/roster_cubit.dart';

class RosterNameFormWidget extends StatelessWidget {
  const RosterNameFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        textCapitalization: TextCapitalization.sentences,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.w500, fontSize: 24),
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Назва',
          hintStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Theme.of(context).hintColor, fontSize: 24),
        ),
        onChanged: (value) => context.read<RosterCubit>().rosterName = value,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
          //context.read<RosterCubit>().saveRoster();
          //Navigator.pop(context);
        });
  }
}
