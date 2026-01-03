import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'corn_yield_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTextTheme = GoogleFonts.manropeTextTheme();

    return MaterialApp(
      title: 'Corn Yield',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E8D4E)),
        scaffoldBackgroundColor: const Color(0xFFF5F7F2),
        textTheme: baseTextTheme,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
        navigationBarTheme: const NavigationBarThemeData(backgroundColor: Colors.white),
      ),
      home: const _RootShell(),
    );
  }
}

class _RootShell extends StatefulWidget {
  const _RootShell();

  @override
  State<_RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<_RootShell> {
  int _index = 0;

  final _pages = const [
    _OverviewPage(),
    CornYieldPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.auto_graph_outlined),
            selectedIcon: Icon(Icons.auto_graph),
            label: 'Yield',
          ),
        ],
      ),
    );
  }
}

class _OverviewPage extends StatelessWidget {
  const _OverviewPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF5D6D5D)),
            ),
            const SizedBox(height: 4),
            Text(
              'Plant health cockpit',
              style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w900, color: const Color(0xFF1F2D1F)),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3FB15E), Color(0xFF2D8B4E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Color(0x26000000), blurRadius: 16, offset: Offset(0, 10))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(.16), borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.local_florist_rounded, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Corn yield assistant',
                        style: GoogleFonts.manrope(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Jump into the yield predictor to see SHAP-based explanations and keep inputs aligned with Plantix-style visuals.',
                    style: GoogleFonts.manrope(color: Colors.white.withOpacity(.9), fontSize: 14, height: 1.4),
                  ),
                  const SizedBox(height: 14),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1F7B41),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CornYieldPage()),
                      );
                    },
                    child: Text(
                      'Open predictor',
                      style: GoogleFonts.manrope(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: const Color(0xFFEAF6EF), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.check_circle, color: Color(0xFF2E8D4E)),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'What\'s inside',
                          style: GoogleFonts.manrope(fontWeight: FontWeight.w800, fontSize: 16, color: const Color(0xFF1F2D1F)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '• Plantix-inspired palette with rounded cards and bold CTA\n• Yield prediction + SHAP explanations\n• Clean navigation bar to hop to the predictor',
                      style: GoogleFonts.manrope(fontSize: 14, height: 1.5, color: const Color(0xFF4F5A50)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
