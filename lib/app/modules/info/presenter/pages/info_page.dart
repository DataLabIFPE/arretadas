import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/modules/info/domain/entities/info.dart';
import 'package:arretadas/app/modules/info/domain/errors/erros.dart';
import 'package:arretadas/app/modules/info/presenter/store/info_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'info_details_page.dart';

class InfoPage extends StatefulWidget {
  final String title;
  const InfoPage({Key? key, this.title = 'Informações'}) : super(key: key);
  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  final InfoStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getInfos();
  }

  Widget _buildError(InfoStore store, Failure? error) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '$error',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 8,
          ),
          Button(
            buttonColor: AppColors.primaryColor,
            onPressed: () => store.getInfos(),
            child: const Center(child: Text('Tente novamente')),
          ),
        ]),
      ),
    );
  }

  Widget _buildState(BuildContext context, List<Info> state) {
    return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: state.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          state[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          state[index].title.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        TextButton(
                          child: const TextCustom(
                            text: 'Ver mais',
                            fontFamily: 'Exo',
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            showBarModalBottomSheet(
                              context: context,
                              builder: (context) => InfoDetailsPage(
                                imagePath: state[index].image,
                                title: state[index].title,
                                textos: state[index].details,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ScopedBuilder<InfoStore, Failure, List<Info>>.transition(
        store: store,
        onError: (context, error) => _buildError(store, error),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (context, state) => _buildState(context, state),
      ),
    );
  }
}
