import 'package:flutter/material.dart';
import 'package:flutter_graphql/util/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = new FlutterSecureStorage();
    return FutureBuilder<String?>(
        future: storage.read(key: 'jwt'),
        builder: (context, snapshot) {
          Widget children = Text('Something went wrong!');
          if (snapshot.hasError) {
            children = Text("$snapshot.error");
          }
          return Column(
            children: [
              Expanded(
                child: Query(
                    options: QueryOptions(
                        document: gql('''
                       query{
              me{
                _id
                name
                email
              }
                        }
                        '''),
                        fetchPolicy: FetchPolicy.noCache,
                        cacheRereadPolicy: CacheRereadPolicy.ignoreAll),
                    builder: (QueryResult result,
                        {Refetch? refetch, FetchMore? fetchMore}) {
                      if (result.isLoading) {
                        return const SafeArea(
                            child: Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ));
                      }
                      if (result.data == null && !result.hasException) {
                        return const SafeArea(
                            child: Scaffold(
                          body: Center(
                              child: Text(
                                  "Loading complete, both data and errors are null")),
                        ));
                      }
                      if (result.hasException) {
                        return const SafeArea(
                            child: Scaffold(
                          body: Center(
                              child: Text(
                                  "Loading complete, both data and errors are null")),
                        ));
                      }                  
                      String? name = result.data?['me']?['name'];
                      String? email = result.data?['me']?['email'];

                      if (name != null && email != null) {
                        return SafeArea(
                          child: Scaffold(
                            body: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(name),
                                  Text(email),
                                  IconButton(
                                    icon: Icon(Icons.exit_to_app),
                                    onPressed: () async {
                                      await storage.delete(key: 'jwt');
                               
                                      await Config.clearToken();
                                      await Config.logoutPref();

                                      Navigator.pushReplacementNamed(
                                          context, "/login");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Text("No token found");
                      }
                    }),
              ),
            ],
          );
        });
  }
}
