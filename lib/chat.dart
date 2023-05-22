// ignore: depend_on_referenced_packages
// ignore_for_file: library_private_types_in_public_api

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:Login/Messages.dart';
//import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatBot',
      theme: ThemeData(brightness: Brightness.dark),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  double _confidence = 1.0;
  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
        backgroundColor: Colors.indigo[300],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Colors.indigo[200],
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    //inputFormatters: [_text],
                    //obscureText: false,
                    //textInputAction: _text,
                    decoration: InputDecoration(
                        labelText: 'Voice or Text', hintText: ''),

                    controller: _controller,
                    style: TextStyle(color: Colors.black87),
                  )),
                  IconButton(
                      onPressed: () {
                        _listen();
                      },
                      icon: Icon(
                        _isListening ? Icons.mic : Icons.mic_none,
                        color: Colors.deepPurple[700],
                        size: 35,
                      )),
                  IconButton(
                      onPressed: () {
                        //_listen();
                        sendMessage(_text);
                        //messages.reversed;
                        _controller.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.deepPurple[700],
                        size: 35,
                      )),
                  IconButton(
                      onPressed: () {
                        //_listen();
                        sendtext(_controller.text);
                        //messages.reversed;
                        _controller.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.grey[700],
                        size: 35,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [_text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: _text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  sendtext(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
