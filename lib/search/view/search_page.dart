import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersaurus/search/search.dart';
import 'package:thesaurus_repository/thesaurus_repository.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: const Alignment(0, -3 / 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/fluttersaurus.png', width: 48),
                      const SizedBox(width: 8),
                      Text(
                        'Fluttersaurus',
                        style: textTheme.headline4.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Flexible(
                  fit: FlexFit.loose,
                  child: BlocProvider(
                    create: (context) => SearchBloc(
                      context.repository<ThesaurusRepository>(),
                    ),
                    child: SearchForm(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}