import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/friendcontacts/presenter/pages/details.dart';
import 'package:arretadas/app/modules/friendcontacts/presenter/store/friendcontacts_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_page.dart';

class FriendcontactsPage extends StatefulWidget {
  final String title;
  const FriendcontactsPage({Key? key, this.title = 'Amigos'}) : super(key: key);
  @override
  FriendcontactsPageState createState() => FriendcontactsPageState();
}

class FriendcontactsPageState extends State<FriendcontactsPage> {
  final FriendcontactsStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getFriendcontacts();
  }

  Widget _buildError(FriendcontactsStore store, Failure? error) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(error!.message),
          const SizedBox(
            height: 8,
          ),
          Button(
            buttonColor: AppColors.primaryColor,
            onPressed: () => store.getFriendcontacts(),
            child: const Text('Tente novamente'),
          ),
        ]),
      ),
    );
  }

  Widget _buildState(BuildContext ctx, List<Friendcontact> itens) {
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
                      fontSize: 24),
                ),
                subtitle: Text(
                  itens[index].number,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.phone),
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
                builder: (context) => FriendcontactDetails(
                  id: itens[index].id,
                  name: itens[index].name,
                  number: itens[index].number,
                  index: index,
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ContactPage()));
        },
      ),
      body: ScopedBuilder<FriendcontactsStore, Failure,
          List<Friendcontact>>.transition(
        store: store,
        onError: (context, error) => _buildError(store, error),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (context, state) => _buildState(context, state),
      ),
    );
  }
}
