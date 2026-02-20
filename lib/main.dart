import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

// ---------------------------------------------------------------------------
// Configuration
// ---------------------------------------------------------------------------

/// Replace this with your own Gemini API key.
/// IMPORTANT: Do not commit a real API key to source control.
/// Consider reading it from a secure environment variable or a secrets manager.
const String _kApiKey = 'YOUR_GEMINI_API_KEY';

const String _kApiUrl =
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';

// ---------------------------------------------------------------------------
// Models
// ---------------------------------------------------------------------------

class Message {
  final String text;
  final bool isUser;

  const Message({required this.text, required this.isUser});
}

// ---------------------------------------------------------------------------
// App root
// ---------------------------------------------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff121212),
      ),
      home: const MyHomePage(title: 'Emo'),
    );
  }
}

// ---------------------------------------------------------------------------
// Home page
// ---------------------------------------------------------------------------

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Message> _messages = [];
  bool _isLoading = false;

  /// Keeps track of conversation context for follow-up prompts.
  String _lastUserInput = '';
  String _lastBotResponse = '';

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _addMessage(String text, bool isUser) {
    setState(() {
      _messages.add(Message(text: text, isUser: isUser));
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final String inputText = _inputController.text.trim();
    if (inputText.isEmpty) return;

    final String promptText =
        "Give a brief uplifting and caring reply that sounds like emotional support from a friend for the following text message (use appropriate emojis too, don't repeat the response): '$inputText', in the context of my previous input: '$_lastUserInput', and your previous response: '$_lastBotResponse'";

    final Map<String, dynamic> requestBody = {
      'contents': [
        {
          'parts': [
            {'text': promptText}
          ]
        }
      ],
      'generationConfig': {
        'temperature': 0.9,
        'candidateCount': 1,
      },
    };

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('$_kApiUrl?key=$_kApiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> candidates = responseData['candidates'] as List<dynamic>;

        if (candidates.isNotEmpty) {
          final String completionText =
              candidates[0]['content']['parts'][0]['text'] as String;

          _addMessage(inputText, true);
          _addMessage(completionText, false);
          _inputController.clear();

          _lastUserInput = inputText;
          _lastBotResponse = completionText;

          await _saveMessage(completionText);
        }
      } else {
        _addMessage('Failed to get a response (${response.statusCode}). Please try again.', false);
      }
    } catch (error) {
      _addMessage('Something went wrong. Please check your connection and try again.', false);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveMessage(String text) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> saved = prefs.getStringList('saved_messages') ?? [];
    saved.add(text);
    await prefs.setStringList('saved_messages', saved);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        title: Text(
          widget.title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Colors.grey[300],
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(
                  key: ValueKey(index),
                  text: message.text,
                  isUser: message.isUser,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      controller: _inputController,
                      onSubmitted: (_) => _sendMessage(),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'How are you feeling now?...',
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isLoading ? null : _sendMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1c1b1f),
                    disabledBackgroundColor: Colors.grey[850],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Icon(Icons.send, size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}

// ---------------------------------------------------------------------------
// Message bubble widget
// ---------------------------------------------------------------------------

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xff432e81) : const Color(0xff1c1b1f),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: isUser ? Colors.white : Colors.grey[300],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Saved-messages drawer
// ---------------------------------------------------------------------------

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<String> _savedMessages = [];

  @override
  void initState() {
    super.initState();
    _loadSavedMessages();
  }

  Future<void> _loadSavedMessages() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> saved = prefs.getStringList('saved_messages') ?? [];
    setState(() {
      _savedMessages = saved;
    });
  }

  Future<void> _deleteMessage(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> saved = List.from(_savedMessages)..removeAt(index);
    await prefs.setStringList('saved_messages', saved);
    setState(() {
      _savedMessages = saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff121212),
            ),
            child: Text(
              'Saved Messages',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          if (_savedMessages.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'No saved messages yet.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          for (int i = 0; i < _savedMessages.length; i++)
            ListTile(
              title: Text(_savedMessages[i]),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                tooltip: 'Delete',
                onPressed: () => _deleteMessage(i),
              ),
              onTap: () => Navigator.pop(context),
            ),
        ],
      ),
    );
  }
}
