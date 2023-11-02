import 'package:flutter/material.dart';

class SongAns extends StatefulWidget {
  const SongAns({super.key});

  @override
  State<SongAns> createState() => _SongAnsState();
}

class _SongAnsState extends State<SongAns> {
  double _initial = 0;

  void updateProgress() {
    setState(() {
      _initial += 0.35;
    });
  }

  // final player = AudioPlayer();

  // Future<void> playAudioFromUrl(String url) async {
  //   await player.play(UrlSource(url));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            "Guess The Lyrics",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.red,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.brown[50],
                      valueColor: AlwaysStoppedAnimation(Colors.blue[400]),
                      value: _initial,
                      minHeight: 10,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ))),
            Flexible(
                flex: 2,
                child: Column(children: <Widget>[
                  const Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment(-0.85, 1),
                        child: Text(
                          "Title lagu",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                  const Flexible(
                      flex: 1,
                      child: Align(
                          alignment: Alignment(-0.85, -0.5),
                          child: Text("Nama penyanyi"))),
                  Flexible(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, offset: Offset(0, 5)),
                            ]),
                        child: Row(
                          children: [
                            const Flexible(
                                flex: 1,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: CircleAvatar(
                                      radius: double.infinity,
                                      backgroundImage:
                                          AssetImage('images/g1.jpeg'),
                                    ))),
                            Flexible(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    color: Colors.tealAccent,
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.play_arrow_rounded,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  label: widget,
                                ))
                          ],
                        ),
                      )),
                ])),
            Flexible(
              flex: 4,
              child: Column(
                children: <Widget>[
                  const Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment(-0.85, 0.4),
                      child: Text(
                        "Your Answer",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: const TextField(
                        expands: true,
                        maxLines: null,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.lightBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: Colors.amber,
                  child: ElevatedButton(
                    onPressed: updateProgress,
                    child: const Text("Next"),
                  ),
                )),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
