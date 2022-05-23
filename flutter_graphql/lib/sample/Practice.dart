import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PracticeGraphql extends StatelessWidget {
  const PracticeGraphql({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Query(
              options: QueryOptions(document: gql('''
        query {
        forms{
            _id
            name
            description
            formId
        }
        }
        ''')),
              builder: (QueryResult result,
                  {Refetch? refetch, FetchMore? fetchMore}) {
                if (result.isLoading) {
                  return const Text("Loading....");
                }
                if (result.data == null && !result.hasException) {
                  return const Text(
                      "Loading complete, both data and errors are null");
                }
                if (result.hasException) {
                  return const Text(
                      "Loading complete, both data and errors are null");
                }
                List resultList = result.data!['forms'];

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: resultList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${resultList[index]['name']}"),
                      subtitle: Text("${resultList[index]['description']}"),
                      tileColor: Colors.grey[400],
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
