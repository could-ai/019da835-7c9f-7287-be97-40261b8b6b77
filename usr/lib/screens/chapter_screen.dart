import 'package:flutter/material.dart';
import '../models/chapter.dart';

class ChapterScreen extends StatelessWidget {
  final Chapter chapter;
  final VoidCallback onBack;

  const ChapterScreen({
    super.key,
    required this.chapter,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3E2723),
        foregroundColor: Colors.white,
        title: Text(chapter.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chapter Header
            Center(
              child: Text(
                chapter.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E2723),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (chapter.subtitle.isNotEmpty) ...[
              const SizedBox(height: 8),
              Center(
                child: Text(
                  chapter.subtitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF795548),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            const SizedBox(height: 32),
            Container(
              height: 2,
              color: const Color(0xFFEFEBE0),
            ),
            const SizedBox(height: 32),
            
            // Introduction / Content
            Text(
              chapter.content,
              style: const TextStyle(
                fontSize: 18,
                height: 1.8,
                color: Color(0xFF212121),
              ),
              textAlign: TextAlign.justify,
            ),
            
            // Sections
            if (chapter.sections.isNotEmpty) ...[
              const SizedBox(height: 40),
              ...chapter.sections.map((section) => Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      section.content,
                      style: const TextStyle(
                        fontSize: 18,
                        height: 1.8,
                        color: Color(0xFF212121),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              )).toList(),
            ]
          ],
        ),
      ),
    );
  }
}
