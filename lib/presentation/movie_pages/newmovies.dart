import 'package:flutter/material.dart';
import 'package:task2/constant/images/image.dart';
import 'package:task2/data/block/model/newmovie_details.dart';

class NewMovies extends StatefulWidget {
  const NewMovies({super.key});

  @override
  State<NewMovies> createState() => _NewMoviesState();
}

class _NewMoviesState extends State<NewMovies> {
  // ------------------------------------------------

  List<NewMovieDetails> moviesData = [
    NewMovieDetails(
        moviename: "Surya Singham",
        moviedetails:
            "The film series began in 2010 with the release of Singam, directed by Hari and starring Suriya as the titular character. The film received positive reviews and grossed ₹90–100 crore worldwide.",
        movieimage: Image.asset(
          MovieImages.surya,
          fit: BoxFit.fill,
        )),
    NewMovieDetails(
        moviename: "Avatar",
        moviedetails:
            "Avatar is a science fiction retelling of the history of North and South America in the early colonial period. ",
        movieimage: Image.asset(
          MovieImages.avatar,
          fit: BoxFit.fill,
        )),
    NewMovieDetails(
        moviename: "Fast & Furious",
        moviedetails:
            "Fast & Furious, also known as The Fast and the Furious, is an American media franchise centered on a series of action films that are largely concerned with street racing, heists, spies, and family. ",
        movieimage: Image.asset(
          MovieImages.man,
          fit: BoxFit.fill,
        )),
    NewMovieDetails(
        moviename: "King Kong",
        moviedetails:
            "Filmmaker Carl Denham and his crew encounter a giant ape in Skull Island and imprison it to bring it to New York. However, they land in trouble when the giant ape is set free in the city.",
        movieimage: Image.asset(
          MovieImages.kong,
          fit: BoxFit.fill,
        ))
  ];

  // ================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 17),
          child: Text(
            "Sort",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              "Filter",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: moviesData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 5.0, left: 5, top: 5, bottom: 1),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      color: Colors.white,
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 230,
                            width: 190,
                            child: moviesData[index].movieimage,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SizedBox(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    moviesData[index].moviename,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    moviesData[index].moviedetails,
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 6,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Positioned(
            bottom: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 15,
              ),
              child: SizedBox(
                height: 100,
                //  width: MediaQuery.of(context).size.width,
                width: 400,

                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    hintStyle: const TextStyle(fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
