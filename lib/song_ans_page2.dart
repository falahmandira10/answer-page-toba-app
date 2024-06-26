import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final player = AudioPlayer();

  Future<void> playMusic(String url) async {
    await player.play(AssetSource(url));
  }

  Future<void> stopMusic() async {
    await player.stop();
  }

  final userAnswer = TextEditingController();

  @override
  void dispose() {
    userAnswer.dispose();
    super.dispose();
  }

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
              fontSize: 24,
            ),
          ),
          backgroundColor: const Color(0xffE9E9E9),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xffE9E9E9),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                height: 50,
                padding: const EdgeInsets.all(20),
                color: const Color(0xffE9E9E9),
                child: LinearProgressIndicator(
                  backgroundColor: const Color(0xffFFFFFF),
                  valueColor: const AlwaysStoppedAnimation(Color(0xff15CAD7)),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          titleMusic,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text(singer)),
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
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
                      // hoverColor: Colors.red,
                      onPressed: () {
                        playMusic(
                            "Ed_Sheeran_Thinking_Out_Loud_Official_Audio.mp3");
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
                // color: Colors.purpleAccent,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Answer",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: userAnswer,
                        expands: true,
                        maxLines: null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0xffFFFFFF),
                          // contentPadding: EdgeInsets.only(bottom: 230),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 30, right: 30),
                // color: Colors.amber,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff527EE7)),
                    foregroundColor:
                        MaterialStateProperty.all(const Color(0xffFFFFFF)),
                  ),
                  onPressed: () {
                    updateProgress();
                    stopMusic();
                    Get.toNamed('/3', arguments: _initial);
                  },
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ));
  }
}
