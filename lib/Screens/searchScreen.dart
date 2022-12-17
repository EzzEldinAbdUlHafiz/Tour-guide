import 'package:flutter/material.dart';
import 'package:tutguide/Screens/models/musiumModel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static List<MuseumModel> dummyMuseums = [
    MuseumModel(
      "a",
      "alex",
      "https://www.travelandleisure.com/thmb/Om3sth4C6kRWrs2tdci3H0CnuH8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gallery-uffizi-florence-italy-ONLINEMUSE0320-7c5f3904408c4c8aabd2f15cd6d47a4b.jpg",
    ),
    MuseumModel(
      "b",
      "cairo",
      "https://cdn.britannica.com/51/194651-050-747F0C18/Interior-National-Gallery-of-Art-Washington-DC.jpg?w=400&h=300&c=crop",
    ),
    MuseumModel(
      "c",
      "paris",
      "https://lp-cms-production.imgix.net/2020-11/9b367a672ef1c7ee9985fdd6293ee27d-museum-of-islamic-art.jpg?q=40&w=2000&auto=format",
    ),
    MuseumModel(
      "a",
      "alex",
      "https://www.travelandleisure.com/thmb/Om3sth4C6kRWrs2tdci3H0CnuH8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gallery-uffizi-florence-italy-ONLINEMUSE0320-7c5f3904408c4c8aabd2f15cd6d47a4b.jpg",
    ),
    MuseumModel(
      "b",
      "cairo",
      "https://cdn.britannica.com/51/194651-050-747F0C18/Interior-National-Gallery-of-Art-Washington-DC.jpg?w=400&h=300&c=crop",
    ),
    MuseumModel(
      "c",
      "paris",
      "https://lp-cms-production.imgix.net/2020-11/9b367a672ef1c7ee9985fdd6293ee27d-museum-of-islamic-art.jpg?q=40&w=2000&auto=format",
    ),
    MuseumModel(
      "a",
      "alex",
      "https://www.travelandleisure.com/thmb/Om3sth4C6kRWrs2tdci3H0CnuH8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gallery-uffizi-florence-italy-ONLINEMUSE0320-7c5f3904408c4c8aabd2f15cd6d47a4b.jpg",
    ),
    MuseumModel(
      "b",
      "cairo",
      "https://cdn.britannica.com/51/194651-050-747F0C18/Interior-National-Gallery-of-Art-Washington-DC.jpg?w=400&h=300&c=crop",
    ),
    MuseumModel(
      "c",
      "paris",
      "https://lp-cms-production.imgix.net/2020-11/9b367a672ef1c7ee9985fdd6293ee27d-museum-of-islamic-art.jpg?q=40&w=2000&auto=format",
    ),
    MuseumModel(
      "adam",
      "alex",
      "https://www.travelandleisure.com/thmb/Om3sth4C6kRWrs2tdci3H0CnuH8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gallery-uffizi-florence-italy-ONLINEMUSE0320-7c5f3904408c4c8aabd2f15cd6d47a4b.jpg",
    ),
    MuseumModel(
      "b",
      "cairo",
      "https://cdn.britannica.com/51/194651-050-747F0C18/Interior-National-Gallery-of-Art-Washington-DC.jpg?w=400&h=300&c=crop",
    ),
    MuseumModel(
      "c",
      "paris",
      "https://lp-cms-production.imgix.net/2020-11/9b367a672ef1c7ee9985fdd6293ee27d-museum-of-islamic-art.jpg?q=40&w=2000&auto=format",
    ),
    MuseumModel(
      "a",
      "alex",
      "https://www.travelandleisure.com/thmb/Om3sth4C6kRWrs2tdci3H0CnuH8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gallery-uffizi-florence-italy-ONLINEMUSE0320-7c5f3904408c4c8aabd2f15cd6d47a4b.jpg",
    ),
    MuseumModel(
      "b",
      "cairo",
      "https://cdn.britannica.com/51/194651-050-747F0C18/Interior-National-Gallery-of-Art-Washington-DC.jpg?w=400&h=300&c=crop",
    ),
    MuseumModel(
      "c",
      "paris",
      "https://lp-cms-production.imgix.net/2020-11/9b367a672ef1c7ee9985fdd6293ee27d-museum-of-islamic-art.jpg?q=40&w=2000&auto=format",
    ),
    MuseumModel(
      "a",
      "alex",
      "https://www.travelandleisure.com/thmb/Om3sth4C6kRWrs2tdci3H0CnuH8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gallery-uffizi-florence-italy-ONLINEMUSE0320-7c5f3904408c4c8aabd2f15cd6d47a4b.jpg",
    ),
    MuseumModel(
      "b",
      "cairo",
      "https://cdn.britannica.com/51/194651-050-747F0C18/Interior-National-Gallery-of-Art-Washington-DC.jpg?w=400&h=300&c=crop",
    ),
    MuseumModel(
      "c",
      "paris",
      "https://lp-cms-production.imgix.net/2020-11/9b367a672ef1c7ee9985fdd6293ee27d-museum-of-islamic-art.jpg?q=40&w=2000&auto=format",
    ),
    MuseumModel(
      "a",
      "alex",
      "https://www.travelandleisure.com/thmb/Om3sth4C6kRWrs2tdci3H0CnuH8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gallery-uffizi-florence-italy-ONLINEMUSE0320-7c5f3904408c4c8aabd2f15cd6d47a4b.jpg",
    ),
    MuseumModel(
      "b",
      "cairo",
      "https://cdn.britannica.com/51/194651-050-747F0C18/Interior-National-Gallery-of-Art-Washington-DC.jpg?w=400&h=300&c=crop",
    ),
    MuseumModel(
      "c",
      "paris",
      "https://lp-cms-production.imgix.net/2020-11/9b367a672ef1c7ee9985fdd6293ee27d-museum-of-islamic-art.jpg?q=40&w=2000&auto=format",
    ),
    MuseumModel(
      "a",
      "alex",
      "https://www.travelandleisure.com/thmb/Om3sth4C6kRWrs2tdci3H0CnuH8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gallery-uffizi-florence-italy-ONLINEMUSE0320-7c5f3904408c4c8aabd2f15cd6d47a4b.jpg",
    ),
    MuseumModel(
      "b",
      "cairo",
      "https://cdn.britannica.com/51/194651-050-747F0C18/Interior-National-Gallery-of-Art-Washington-DC.jpg?w=400&h=300&c=crop",
    ),
    MuseumModel(
      "c",
      "paris",
      "https://lp-cms-production.imgix.net/2020-11/9b367a672ef1c7ee9985fdd6293ee27d-museum-of-islamic-art.jpg?q=40&w=2000&auto=format",
    ),
  ];

  List<MuseumModel> displayMuseums = List.from(dummyMuseums);

  void updateList(String value) {
    setState(() {
      displayMuseums = dummyMuseums
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Musium",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Grand Egyptian Museum",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: displayMuseums.length == 0
                  ? Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayMuseums.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text(
                          displayMuseums[index].name!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          displayMuseums[index].city!,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        leading: Image.network(
                          displayMuseums[index].imageUrl!,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
