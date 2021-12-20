import 'package:flutter/material.dart';
import 'package:jsonwithprovider/models/newsdata.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;
    return Scaffold(
        appBar: AppBar(title: const Text('Posts'), actions: [
          IconButton(
              onPressed: () {
                //remove and refetch data
                context.read<NewsData>().initialValues();
                context.read<NewsData>().fetchData;
              },
              icon: const Icon(Icons.refresh))
        ]),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: Center(
            child: Consumer<NewsData>(builder: (context, value, child) {
              //value now acts as instance of NewsData
              return value.map.isEmpty && !value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? Text("OOps something went wrong ${value.errorMsg}")
                      : ListView.builder(
                          itemCount: value.map.length,
                          itemBuilder: (context, index) {
                            return Text("$index" + value.map[index]["body"]);
                          });
            }),
          ),
        ));
  }
}
