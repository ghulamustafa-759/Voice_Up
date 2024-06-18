import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:video_player/video_player.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'dart:io';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voiceup',

      theme: ThemeData(
        fontFamily: 'Jomhuria', //
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {    //Homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF164863), // Background color #427D9D
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Voice',
                    style: TextStyle(
                      fontFamily: 'Jomhuria',
                      fontWeight: FontWeight.w400,
                      fontSize: 120.0, // Adjust the size as needed
                      height: 1.0,
                      color: Color(0xFFFFFFFF), // Text color #FFFFFF
                    ),
                  ),
                  Text(
                    'Up',
                    style: TextStyle(
                      fontFamily: 'Jomhuria',
                      fontWeight: FontWeight.w400,
                      fontSize: 120.0, // Adjust the size as needed
                      height: 1.0,
                      color: Color(0xFFFFFFFF), // Text color #FFFFFF
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LanguagePage('American Sign Language')),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color(0xFF427D9D),
                      ),
                      child: Center(
                        child: Text(
                          'American Sign Language',
                          style: TextStyle(
                            fontFamily: 'Jomhuria',
                            fontWeight: FontWeight.w400,
                            fontSize: 50.0,
                            height: 1.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 0.5,
                  color: Colors.black,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LanguagePage('Pakistan Sign Language')),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color(0xFF90B0B9),
                      ),
                      child: Center(
                        child: Text(
                          'Pakistan Sign Language',
                          style: TextStyle(
                            fontFamily: 'Jomhuria',
                            fontWeight: FontWeight.w400,
                            fontSize: 50.0,
                            height: 1.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
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



class LanguagePage extends StatelessWidget {    //Language
  final String language;

  LanguagePage(this.language);

  @override
  Widget build(BuildContext context) {  //constructs the UI for the widget.
    return Scaffold(   //framework to implement the basic material design
      appBar: AppBar(    // top app bar that displays the language as its title.
        title: Text(language,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Color(0xFF164863),
              ),
              alignment: Alignment.center,
              child: Text(
                language,
                style: TextStyle(
                  fontFamily: 'Jomhuria',
                  fontWeight: FontWeight.w400,
                  fontSize: 90.0,
                  height: 1.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DictionaryPage(language)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color(0xFF427D9D),
                      ),
                      child: Center(
                        child: Text(
                          'Dictionary',
                          style: TextStyle(
                            fontFamily: 'Jomhuria',
                            fontWeight: FontWeight.w400,
                            fontSize: 50.0,
                            height: 1.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.black,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TranslatorPage(language)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color(0xFF90B0B9),
                      ),
                      child: Center(
                        child: Text(
                          'Translator',
                          style: TextStyle(
                            fontFamily: 'Jomhuria',
                            fontWeight: FontWeight.w400,
                            fontSize: 50.0,
                            height: 1.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
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


class DictionaryPage extends StatelessWidget {
  final String language;

  DictionaryPage(this.language);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dictionary',
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 50,
          ),
        ),
        backgroundColor: Color(0xFF427D9D),
      ),
      body: ListView.builder(
        itemCount: (language == 'Pakistan Sign Language') ? 36 : 26,
        itemBuilder: (BuildContext context, int index) {
          String alphabet;
          if (language == 'Pakistan Sign Language') {
            alphabet = [
              'ا', 'ب', 'پ', 'ت', 'ٹ', 'ث', 'ج', 'چ', 'ح', 'خ',
              'د', 'ڈ', 'ذ', 'ر', 'ڑ', 'ز', 'ژ', 'س', 'ش', 'ص',
              'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق', 'ک', 'گ', 'ل',
              'م', 'ن', 'و', 'ہ', 'ی', 'ے'
            ][index];
          } else {
            // Use the correct English alphabet sequence
            alphabet = String.fromCharCode('A'.codeUnitAt(0) + index);
          }
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlphabetPage(alphabet),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: (index % 2 == 0)
                    ? Color(0xFF427D9D)
                    : Color(0xFF90B0B9),
              ),
              child: Center(
                child: Text(
                  alphabet,
                  style: TextStyle(
                    fontFamily: 'Jomhuria',
                    fontWeight: FontWeight.w400,
                    fontSize: 90.0,
                    height: 1.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class AlphabetPage extends StatefulWidget {
  final String alphabet;

  AlphabetPage(this.alphabet);

  @override
  _AlphabetPageState createState() => _AlphabetPageState();
}

class _AlphabetPageState extends State<AlphabetPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;


  @override
  void initState() {
    super.initState();
    // Load different videos based on the alphabet pressed
    if (widget.alphabet == 'A') {
      _controller = VideoPlayerController.network(
          'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FA%20(1).mov?alt=media&token=4be0e096-ba53-4168-8856-f618b193776a'
      );
    }
    else if (widget.alphabet == 'B') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FB%20(1).mov?alt=media&token=699c6f81-54ea-4dd1-92e9-af9e5f05fa19',
      );
    }
    else if (widget.alphabet == 'C') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FC%20(1).mov?alt=media&token=fa43f68e-4b8e-4fce-a792-aa6120fc856a',
      );
    }
    else if (widget.alphabet == 'D') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FD%20(1).mov?alt=media&token=adebaacb-409a-4b50-be33-9cdf7e91e7b3',
      );
    }
    else if (widget.alphabet == 'E') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FE%20(1).mov?alt=media&token=f8142328-2729-4f5b-bb06-29dfe16d4a9d',
      );
    }
    else if (widget.alphabet == 'F') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FF%20(1).mov?alt=media&token=f68ce9b1-bbbd-4803-ba79-3b5fcf8b37b9',
      );
    }
    else if (widget.alphabet == 'G') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FG%20(1).mov?alt=media&token=75f2dee6-76a6-40e3-b721-67d69054bb7d',
      );
    }
    else if (widget.alphabet == 'H') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FH%20(1).mov?alt=media&token=78b4140b-ed73-48a3-9ec7-b93fc741b651',
      );
    }
    else if (widget.alphabet == 'I') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FI%20(1).mov?alt=media&token=a978056d-6ed7-4ede-a3a1-41a6c834b778',
      );
    }
    else if (widget.alphabet == 'J') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FJ%20(1).mov?alt=media&token=da76b88f-82e2-4137-8e00-84cac452ab61',
      );
    }
    else if (widget.alphabet == 'K') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FK%20(1).mov?alt=media&token=80c1cf4c-ca9d-422d-a1b8-7f50b1e47851',
      );
    }
    if (widget.alphabet == 'L') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FL%20(1).mov?alt=media&token=aa80635c-82e7-46e3-a342-4a565b2ae4bb',
      );
    }
    else if (widget.alphabet == 'M') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FM%20(1).mov?alt=media&token=5396b6d1-7454-4195-845a-d19712dfdfcb',
      );
    }
    else if (widget.alphabet == 'N') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FN%20(1).mov?alt=media&token=f3d02c5b-c7c4-4c14-ad49-8e01f0145a72',
      );
    }
    else if (widget.alphabet == 'O') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FO%20(1).mov?alt=media&token=dedb995c-fca0-46db-b749-29b3a3e84a53',
      );
    }
    else if (widget.alphabet == 'P') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FP%20(1).mov?alt=media&token=3dee6cda-33d6-4056-81a8-0b2ce249030e',
      );
    }
    else if (widget.alphabet == 'Q') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FQ%20(1).mov?alt=media&token=d86ad165-aea1-4b4c-ad29-42830ff3cd8a',
      );
    }
    else if (widget.alphabet == 'R') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FR%20(1).mov?alt=media&token=ec3ba397-842e-4def-8f96-af5004d34d17',
      );
    }
    else if (widget.alphabet == 'S') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FS%20(1).mov?alt=media&token=1d8d00a3-e1ed-446a-91f5-da4aafbccee2',
      );
    }
    else if (widget.alphabet == 'T') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FT%20(1).mov?alt=media&token=f7a2d92d-0ebe-4eec-b575-1a44cd747e35',
      );
    }
    else if (widget.alphabet == 'U') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FU%20(1).mov?alt=media&token=bdda9e15-f95a-4069-9e31-d47b728ef0a6',
      );
    }
    else if (widget.alphabet == 'V') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FV%20(1).mov?alt=media&token=d89c626f-1bee-467a-b181-7812ce3c7ab9',
      );
    }
    else if (widget.alphabet == 'W') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FW%20(1).mov?alt=media&token=24a68491-9aee-4a23-a256-56a7e325045f',
      );
    }
    else if (widget.alphabet == 'X') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FX%20(1).mov?alt=media&token=dee86da9-3153-4f50-aca3-92dbf78fb0c3',
      );
    }
    else if (widget.alphabet == 'Y') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FY%20(1).mov?alt=media&token=5c67c58e-e6be-4349-b513-fc9dddefb81e',
      );
    }
    else if (widget.alphabet == 'Z') {
      _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/voiceup-44d0e.appspot.com/o/ASL%2FVideos%20without%20bordee%2FZ%20(1).mov?alt=media&token=910a01ea-cafd-4fbe-a41d-9c659e00eb5d',
      );
    }

    else {
      // Default case
      _controller = VideoPlayerController.asset('assets/videos/A.mp4');
    }
    _initializeVideoPlayerFuture = _controller.initialize().catchError((error) {
      print('Error initializing video player: $error');
    });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' ${widget.alphabet}',
          style: TextStyle(
            fontSize: 45,
            color: Color(0xFFD9D9D9),
          ),
        ),
        backgroundColor: Color(0xFF164863),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error initializing video player');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Text(
                _controller.value.isPlaying ? 'Pause Video' : 'Play Video',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class TranslatorPage extends StatefulWidget {
  final String language;

  TranslatorPage(this.language);

  @override
  _TranslatorPageState createState() => _TranslatorPageState();
}


class _TranslatorPageState extends State<TranslatorPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFrontCamera = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _switchCamera() {
    setState(() {
      _isFrontCamera = !_isFrontCamera;
      _controller = CameraController(
        _isFrontCamera ? cameras[1] : cameras[0],
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  void _onSubmit() async {
    try {
      final XFile image = await _controller.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CapturedImagePage(image: image, controller: _controller, isFrontCamera: _isFrontCamera),
        ),
      );
    } catch (e) {
      print('Error capturing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Translator',
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 50,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF164863),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: 3 / 4,
              child: CameraPreview(_controller),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      backgroundColor: Color(0xFF164863),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleIconButton(
              icon: Icons.switch_camera,
              onPressed: _switchCamera,
            ),
            CircleIconButton(
              icon: Icons.camera,
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CircleIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 1.0), // Adjust the top margin as needed

        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF90B0B9),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}




class CapturedImagePage extends StatefulWidget {
  final XFile image;
  final CameraController controller;
  final bool isFrontCamera;

  CapturedImagePage({required this.image, required this.controller, required this.isFrontCamera});

  @override
  _CapturedImagePageState createState() => _CapturedImagePageState();
}

class _CapturedImagePageState extends State<CapturedImagePage> {
  bool _isLoading = true;
  String _result = '';

  get tflite => null;

  @override
  void initState() {
    super.initState();
    _loadModel();
    _processImage();
  }

  Future<void> _loadModel() async {
    try {
      String? res = await tflite.loadModel(
        model: "assets/models/ASL-model-tf.tflite",
      );
      print(res);
    } catch (e) {
      print("Failed to load the model: $e");
    }
  }

  Future<void> _processImage() async {
    try {
      var recognitions = await tflite.runModelOnImage(
        path: widget.image.path, // Path to the image
        numResults: 1, // Number of results to return
        threshold: 0.5, // Confidence threshold
      );

      setState(() {
        _isLoading = false;
        if (recognitions != null && recognitions.isNotEmpty) {
          _result = recognitions.first["label"];
        } else {
          _result = "No sign detected";
        }
      });
    } catch (e) {
      print("Error running the model: $e");
      setState(() {
        _isLoading = false;
        _result = "Error running the model";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Captured Image',
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 50,
          ),
        ),
        backgroundColor: Color(0xFF164863),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        color: Color(0xFF164863),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.file(
                File(widget.image.path),
                fit: BoxFit.cover,
                alignment: widget.isFrontCamera ? Alignment(-1.0, 0.0) : Alignment(1.0, 0.0),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(
                fontFamily: 'Jomhuria',
                fontSize: 43,
                color: Color(0xFFD9D9D9),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleIconButton(
                  icon: Icons.replay,
                  onPressed: () {
                    Navigator.pop(context);
                    widget.controller.initialize().then((_) {
                      widget.controller.startImageStream((CameraImage img) {});
                    });
                  },
                ),
                CircleIconButton(
                  icon: Icons.check,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(image: widget.image, result: _result),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final XFile image;
  final String result;

  ResultPage({required this.image, required this.result});

  // Create an instance of FlutterTts
  final FlutterTts flutterTts = FlutterTts();

  // Function to speak the translated text
  Future<void> speakText(String text) async {
    await flutterTts.setLanguage("en-US"); // Set the language (you can change this to the desired language code)
    await flutterTts.setSpeechRate(0.5); // Set the speed to 0.5x
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(
            color: Color(0xFFD9D9D9),
            fontSize: 50,
          ),
        ),
        backgroundColor: Color(0xFF164863),
      ),
      body: Container(
        color: Color(0xFF164863),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.file(
                File(image.path),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                result,
                style: TextStyle(
                  fontFamily: 'Jomhuria',
                  fontSize: 43,
                  color: Color(0xFFD9D9D9),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.volume_up, size: 36, color: Color(0xFFD9D9D9)),
              onPressed: () async {
                await speakText(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
