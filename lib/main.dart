import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class PlatformScreen extends StatefulWidget {
  @override
  _PlatformScreenState createState() => _PlatformScreenState();
}

class _PlatformScreenState extends State<PlatformScreen> {
  String _platform = 'Нажмите кнопку, чтобы определить платформу';
  bool _isLoading = false;

  Future<void> _determinePlatform() async {
    setState(() {
      _isLoading = true;
    });

    // Имитируем задержку в 4 секунды
    await Future.delayed(Duration(seconds: 4));

    String platform;
    if (Platform.isAndroid) {
      platform = 'Android';
    } else if (Platform.isIOS) {
      platform = 'iOS';
    } else if (Platform.isLinux) {
      platform = 'Linux';
    } else if (Platform.isMacOS) {
      platform = 'macOS';
    } else if (Platform.isWindows) {
      platform = 'Windows';
    } else {
      platform = 'неизвестная платформа';
    }

    setState(() {
      _platform = platform;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Экран платформы'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isLoading
                ? CircularProgressIndicator()
                : Text('Приложение запущено на: $_platform'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _determinePlatform,
              child: Text('Определить платформу'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PlatformScreen(),
  ));
}
