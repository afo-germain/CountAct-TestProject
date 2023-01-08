import 'package:flutter/material.dart';
import 'package:my_app/models/profession.dart';
import 'package:my_app/nav_bar.dart';
import 'package:my_app/services/remote_service.dart';

class ProfessionPage extends StatefulWidget {
  const ProfessionPage({super.key});

  @override
  State<ProfessionPage> createState() => _ProfessionPageState();
}

class _ProfessionPageState extends State<ProfessionPage> {
  Professions? professions;
  var isLoaded = false;

  bool isDescending = false;

  @override
  void initState() {
    super.initState();

    //Fetch data from API
    getData();
  }

  getData() async {
    professions = await RemoteSevice().getProfessions();

    if (professions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Professions'),
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: Column(children: [
            sortButtonWidget(),
            Expanded(
              child: listWidget(),
            )
          ]),
        ));
  }

  TextButton sortButtonWidget() {
    return TextButton.icon(
      onPressed: () => setState(() => isDescending = !isDescending),
      // ignore: prefer_const_constructors
      icon: RotatedBox(
          quarterTurns: 1, child: const Icon(Icons.compare_arrows, size: 28)),

      label: Text(
        'Alphabetical sort : ${isDescending ? 'Descending' : 'Ascending'}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  ListView listWidget() {
    return ListView.builder(
      itemCount: professions?.metiers?.length,
      itemBuilder: (context, index) {
        final items = professions?.metiers;
        final sortedItems = items!
          ..sort((item1, item2) => isDescending
              ? item2!.compareTo(item1!)
              : item1!.compareTo(item2!));

        return ListTile(
          title: Text(sortedItems[index] ?? ""),
        );
      },
    );
  }
}
