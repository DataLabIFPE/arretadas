import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/entities/usefulcontact.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/usefulcontacts/presenter/pages/usefulcontact_details.dart';
import 'package:arretadas/app/modules/usefulcontacts/presenter/store/usefulcontacts_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UsefulcontactsPage extends StatefulWidget {
  final String title;
  const UsefulcontactsPage({Key? key, this.title = 'Agenda'}) : super(key: key);
  @override
  UsefulcontactsPageState createState() => UsefulcontactsPageState();
}

class UsefulcontactsPageState extends State<UsefulcontactsPage> {
  final UsefulcontactsStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getUsefulcontacts();
  }

  Widget _buildError(UsefulcontactsStore store, Failure? error) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '${error!.message}',
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 8,
          ),
          Button(
            buttonColor: AppColors.primaryColor,
            onPressed: () => store.getUsefulcontacts(),
            child: Center(child: Text('Tente novamente')),
          ),
        ]),
      ),
    );
  }

  Widget _buildState(BuildContext ctx, List<Usefulcontact> itens) {
    return ListView.builder(
        itemCount: itens.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            child: Card(
              child: ListTile(
                title: Text(
                  itens[index].name,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  itens[index].number,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.phone),
                  iconSize: 30,
                  onPressed: () {
                    launch("tel:${itens[index].number}");
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            onTap: () {
              showBarModalBottomSheet(
                context: context,
                builder: (context) => UsefulcontactDetails(
                  name: itens[index].name,
                  number: itens[index].number,
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ScopedBuilder<UsefulcontactsStore, Failure,
          List<Usefulcontact>>.transition(
        store: store,
        onError: (context, error) => _buildError(store, error),
        onLoading: (context) => Center(child: CircularProgressIndicator()),
        onState: (context, state) => _buildState(context, state),
      ),
    );
  }
}
