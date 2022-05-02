import 'package:chuckapp/dio/client.dart';
import 'package:chuckapp/model/joke.dart';
import 'package:chuckapp/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchInitiate = false;

  late DioClient dioClient;
  late Future<List<Joke>> jokes;

  final textInputController = TextEditingController();
  @override
  void initState() {
    super.initState();
    dioClient = DioClient();
  }

  @override
  void dispose() {
    textInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: textInputController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Search...",
                        prefixIcon: Container(
                            padding: const EdgeInsets.all(15),
                            child: const Icon(Icons.search)),
                        contentPadding: const EdgeInsets.all(2)),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    jokes =
                        dioClient.fetchSearchResults(textInputController.text);
                    setState(() {
                      searchInitiate = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
            if (searchInitiate)
              FutureBuilder<List<Joke>>(
                  future: jokes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      debugPrint("${snapshot.data!.length}");
                      return SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(width: 1)),
                                        child: Text(
                                          snapshot.data![index].value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      );
                    } else if (snapshot.hasError) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("No chuck for now :("),
                      );
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ));
                  })
          ],
        ),
      ),
    );
  }
}
