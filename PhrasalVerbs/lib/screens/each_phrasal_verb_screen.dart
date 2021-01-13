import 'package:flutter/material.dart';
import 'package:trial_4/providers/phrasal_verbs_provider.dart';

class EachPhrasalVerbScreen extends StatelessWidget {
  static const screenName = '/phrasal-verb-screen';

  //TODO: Do responsive.
  @override
  Widget build(BuildContext context) {
    var indexOfExample = 0;
    final singleItem =
        ModalRoute.of(context).settings.arguments as PhrasalVerbItem;
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: mediaQuery.size.height / 3,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage(singleItem.imageUrl),
                fit: BoxFit.cover,
              ),
              title: Text('${singleItem.phrasalVerb}'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: mediaQuery.size.height / 45,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: "Definition: ",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: mediaQuery.size.height / 25,
                          ),
                        ),
                        TextSpan(
                            text: singleItem.definition,
                            style: TextStyle(
                              fontSize: mediaQuery.size.height / 45,
                            )),
                      ],
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: mediaQuery.size.height / 45,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "EXAMPLES",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: mediaQuery.size.height / 25,
                    ),
                  ),
                ),
                ...singleItem.examples.map(
                  (item) => Container(
                    width: double.infinity,
                    height: mediaQuery.size.height/8,
                    child: Card(
                      elevation: 8,
                      child: Text(item + "${indexOfExample++}"),
                    ),
                  )
                ),
                Container(
                  height: mediaQuery.size.height / 4,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: singleItem.examples.length,
                    itemBuilder: (ctx, index) => Card(
                      elevation: 4,
                      margin: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: "${index + 1}. ",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              TextSpan(
                                text: singleItem.examples[index],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
