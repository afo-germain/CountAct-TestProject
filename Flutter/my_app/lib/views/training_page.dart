import 'package:flutter/material.dart';
import 'package:my_app/models/training.dart';
import 'package:my_app/nav_bar.dart';
import 'package:my_app/services/remote_service.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  Training? trainings;
  var isLoaded = false;

  bool isSortingByRegion = false;

  @override
  void initState() {
    super.initState();

    //Fetch data from API
    getData();
  }

  getData() async {
    trainings = await RemoteSevice().getTrainings();

    if (trainings != null) {
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
          title: const Text('Trainings'),
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: Column(children: [
            Row(
              // ignore: sort_child_properties_last
              children: [
                sortButtonWidget(),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Expanded(
              child: listWidget(),
            )
          ]),
        ));
  }

  TextButton sortButtonWidget() {
    return TextButton.icon(
      onPressed: () => setState(() => isSortingByRegion = !isSortingByRegion),
      // ignore: prefer_const_constructors
      icon: RotatedBox(
          quarterTurns: 1, child: const Icon(Icons.compare_arrows, size: 28)),

      label: Text(
        'Region sort ${isSortingByRegion ? 'Descending' : 'Ascending'}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  ListView listWidget() {
    return ListView.builder(
      itemCount: trainings?.results!.length,
      itemBuilder: (context, index) {
        final items = trainings?.results;

        var sortedItems = items!
          ..sort((item1, item2) => isSortingByRegion
              ? item2!.place!['region']!.compareTo(item1!.place!['region']!)
              : item1!.place!['region']!.compareTo(item2!.place!['region']!));

        return ListTile(
          title: Text(sortedItems[index]!.rncpLabel ?? ""),
          subtitle: Text(sortedItems[index]!.place!['region'] ?? ""),
          trailing: Text(sortedItems[index]!.place!['departementNumber'] ?? ""),
        );
      },
    );
  }
}
