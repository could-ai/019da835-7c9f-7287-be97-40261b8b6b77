import 'package:flutter/material.dart';
import '../models/chapter.dart';

class TocScreen extends StatelessWidget {
  final List<Chapter> chapters;
  final Function(Chapter) onChapterSelected;
  final VoidCallback onBack;

  const TocScreen({
    super.key,
    required this.chapters,
    required this.onChapterSelected,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3E2723),
        foregroundColor: Colors.white,
        title: const Text('فهرس المحتويات', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.white,
            child: InkWell(
              onTap: () => onChapterSelected(chapter),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFEBE0),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5D4037),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chapter.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3E2723),
                            ),
                          ),
                          if (chapter.subtitle.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              chapter.subtitle,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF795548),
                              ),
                            ),
                          ],
                          const SizedBox(height: 12),
                          Text(
                            '${chapter.sections.length} مباحث',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Color(0xFF8D6E63)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
