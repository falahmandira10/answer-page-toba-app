import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:audioplayers/audioplayers.dart';

class SongAns2 extends StatefulWidget {
  const SongAns2({super.key});

  @override
  State<SongAns2> createState() => _SongAns2State();
}

class _SongAns2State extends State<SongAns2> {
  double _initial = Get.arguments;

  void updateProgress() {
    setState(() {
      _initial += 0.35;
    });
  }

  String titleMusic = "Thinking Out Loud";
  String singer = "Ed Sheeran";
  String albumCover = "images/thinking_out_loud.jpeg";

  // final player = AudioPlayer();

  // Future<void> playMusic(String url) async {
  //   await player.setSource(AssetSource(url));
  // }

  // final userAnswer = TextEditingController();

  // @override
  // void dispose() {
  //   userAnswer.dispose();
  //   super.dispose();
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
            "Guess The Lyrics 2",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 50,
              padding: const EdgeInsets.all(20),
              color: Colors.red,
              child: LinearProgressIndicator(
                backgroundColor: Colors.brown[50],
                valueColor: AlwaysStoppedAnimation(Colors.blue[400]),
                value: _initial,
                minHeight: 10,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-0.8, 1),
                    child: Text(
                      titleMusic,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(alignment: Alignment(-0.8, -0.5), child: Text(singer))
                ],
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(blurRadius: 5.0, offset: Offset(0, 5)),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(albumCover),
                  ),
                  const Image(
                    image: AssetImage('images/waveform-audio.png'),
                  ),
                  IconButton(
                    onPressed: () {
                      // playMusic(
                      //     'audio/A Super Nice Japanese Song  Anata no Yoru ga Akeru Made Lyrics.mp3');
                    },
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      size: 35,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 370,
              padding: const EdgeInsets.all(30),
              color: Colors.purpleAccent,
              child: const Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your Answer",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextField(
                      // controller: userAnswer,
                      // keyboardType: TextInputType.multiline,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // contentPadding: EdgeInsets.only(top: 230),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 30, right: 30),
              color: Colors.amber,
              child: ElevatedButton(
                onPressed: () {
                  updateProgress();
                  Get.toNamed('/3', arguments: _initial);
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ));
  }
}
