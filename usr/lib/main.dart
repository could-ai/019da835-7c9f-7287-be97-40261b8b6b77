import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/research_data.dart';
import 'models/chapter.dart';
import 'screens/cover_screen.dart';
import 'screens/toc_screen.dart';
import 'screens/chapter_screen.dart';

void main() {
  runApp(const ResearchApp());
}

class ResearchApp extends StatefulWidget {
  const ResearchApp({super.key});

  @override
  State<ResearchApp> createState() => _ResearchAppState();
}

class _ResearchAppState extends State<ResearchApp> {
  String _currentScreen = 'cover';
  Chapter? _selectedChapter;

  void _navigateToToc() {
    setState(() {
      _currentScreen = 'toc';
      _selectedChapter = null;
    });
  }

  void _navigateToChapter(Chapter chapter) {
    setState(() {
      _currentScreen = 'chapter';
      _selectedChapter = chapter;
    });
  }

  void _navigateBack() {
    setState(() {
      if (_currentScreen == 'chapter') {
        _currentScreen = 'toc';
        _selectedChapter = null;
      } else if (_currentScreen == 'toc') {
        _currentScreen = 'cover';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حوامل الكتاب العربي',
      debugShowCheckedModeBanner: false,
      // Arabic Localization settings
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // Arabic
      ],
      locale: const Locale('ar', 'AE'),
      theme: ThemeData(
        fontFamily: 'Amiri', // A traditional Arabic font if available, otherwise falls back
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3E2723)),
        useMaterial3: true,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('CoverPage'),
            child: CoverScreen(onStart: _navigateToToc),
          ),
          if (_currentScreen == 'toc' || _currentScreen == 'chapter')
            MaterialPage(
              key: const ValueKey('TocPage'),
              child: TocScreen(
                chapters: ResearchData.chapters,
                onChapterSelected: _navigateToChapter,
                onBack: _navigateBack,
              ),
            ),
          if (_currentScreen == 'chapter' && _selectedChapter != null)
            MaterialPage(
              key: ValueKey('ChapterPage_${_selectedChapter!.id}'),
              child: ChapterScreen(
                chapter: _selectedChapter!,
                onBack: _navigateBack,
              ),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          _navigateBack();
          return true;
        },
      ),
    );
  }
}
