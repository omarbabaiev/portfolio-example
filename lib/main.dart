import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const OptimizedPortfolioApp());
}

class OptimizedPortfolioApp extends StatelessWidget {
  const OptimizedPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Optimized Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const OptimizedPortfolioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OptimizedPortfolioPage extends StatefulWidget {
  const OptimizedPortfolioPage({super.key});

  @override
  State<OptimizedPortfolioPage> createState() => _OptimizedPortfolioPageState();
}

class _OptimizedPortfolioPageState extends State<OptimizedPortfolioPage> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for scroll targets
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      _scrollController.animateTo(
        _scrollController.offset + position.dy - 100,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F0F0F), Color(0xFF1A1A1A), Color(0xFF0F0F0F)],
          ),
        ),
        child: Column(
          children: [
            // Sticky Header
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: _buildOptimizedHeader(),
            ),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    _buildOptimizedHeroSection(),
                    _buildOptimizedAboutSection(),
                    _buildOptimizedSkillsSection(),
                    _buildOptimizedProjectsSection(),
                    _buildOptimizedContactSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptimizedHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 800 ? 50 : 20,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            'REENI',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width > 800 ? 32 : 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          // Navigation
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                _buildOptimizedNavItem('Home', 0),
                _buildOptimizedNavItem('About', 1),
                _buildOptimizedNavItem('Skills', 2),
                _buildOptimizedNavItem('Projects', 3),
                _buildOptimizedNavItem('Contact', 4),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildOptimizedNavItem(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
            switch (index) {
              case 0:
                _scrollToSection(_heroKey);
                break;
              case 1:
                _scrollToSection(_aboutKey);
                break;
              case 2:
                _scrollToSection(_skillsKey);
                break;
              case 3:
                _scrollToSection(_projectsKey);
                break;
              case 4:
                _scrollToSection(_contactKey);
                break;
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: _currentIndex == index
                  ? Colors.white.withOpacity(0.1)
                  : Colors.transparent,
            ),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: _currentIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                fontSize: 16,
                fontWeight: _currentIndex == index
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptimizedHeroSection() {
    return Container(
      key: _heroKey,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        children: [
          // Background gradient circles
          if (MediaQuery.of(context).size.width > 800)
            Positioned(
              top: 100,
              right: 100,
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0x1A2196F3),
                      Color(0x0D9C27B0),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // Profile image
                    Container(
                      width: MediaQuery.of(context).size.width > 800
                          ? 200
                          : 150,
                      height: MediaQuery.of(context).size.width > 800
                          ? 200
                          : 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0x4D2196F3), Color(0x4D9C27B0)],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x4D2196F3),
                            blurRadius: 50,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.person,
                        size: MediaQuery.of(context).size.width > 800
                            ? 100
                            : 75,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width > 800 ? 60 : 40,
                    ),
                    // Main title
                    Text(
                      'Hello, I\'m',
                      style: GoogleFonts.poppins(
                        color: const Color(0xCCFFFFFF),
                        fontSize: MediaQuery.of(context).size.width > 800
                            ? 24
                            : 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'MOBILE DEVELOPER',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width > 800
                            ? 72
                            : 36,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Flutter & Native Mobile Development',
                      style: GoogleFonts.poppins(
                        color: const Color(0x99FFFFFF),
                        fontSize: MediaQuery.of(context).size.width > 800
                            ? 20
                            : 16,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width > 800 ? 60 : 40,
                    ),
                    // CTA Button
                    _buildOptimizedCTAButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptimizedCTAButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _scrollToSection(_projectsKey),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width > 800 ? 40 : 30,
            vertical: MediaQuery.of(context).size.width > 800 ? 20 : 15,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xCC2196F3), Color(0xCC9C27B0)],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color(0x662196F3),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Text(
            'VIEW MY PROJECTS',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width > 800 ? 16 : 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptimizedAboutSection() {
    return Container(
      key: _aboutKey,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 800 ? 50 : 20,
        vertical: MediaQuery.of(context).size.width > 800 ? 120 : 80,
      ),
      child: Column(
        children: [
          Text(
            'ABOUT',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width > 800 ? 48 : 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width > 800 ? 100 : 60),
          MediaQuery.of(context).size.width > 800
              ? Row(
                  children: [
                    // Left side - Image
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [Color(0x4D2196F3), Color(0x4D9C27B0)],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x332196F3),
                              blurRadius: 30,
                              offset: Offset(0, 20),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 150,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 80),
                    // Right side - Content
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Creative Mobile Developer',
                            style: GoogleFonts.poppins(
                              fontSize: MediaQuery.of(context).size.width > 800
                                  ? 36
                                  : 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'I am an experienced developer in Flutter and native mobile development. '
                            'I develop modern and high-performance mobile applications by prioritizing user experience.',
                            style: GoogleFonts.poppins(
                              fontSize: MediaQuery.of(context).size.width > 800
                                  ? 18
                                  : 16,
                              color: const Color(0xCCFFFFFF),
                              height: 1.8,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 40),
                          _buildOptimizedStats(),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      'Creative Mobile Developer',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'I am an experienced developer in Flutter and native mobile development. '
                      'I develop modern and high-performance mobile applications by prioritizing user experience.',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xCCFFFFFF),
                        height: 1.8,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildOptimizedStats(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildOptimizedStats() {
    return MediaQuery.of(context).size.width > 800
        ? Row(
            children: [
              _buildOptimizedStatItem('5+', 'Years Experience'),
              const SizedBox(width: 60),
              _buildOptimizedStatItem('50+', 'Projects Completed'),
              const SizedBox(width: 60),
              _buildOptimizedStatItem('100%', 'Client Satisfaction'),
            ],
          )
        : Column(
            children: [
              _buildOptimizedStatItem('5+', 'Years Experience'),
              const SizedBox(height: 20),
              _buildOptimizedStatItem('50+', 'Projects Completed'),
              const SizedBox(height: 20),
              _buildOptimizedStatItem('100%', 'Client Satisfaction'),
            ],
          );
  }

  Widget _buildOptimizedStatItem(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width > 800 ? 48 : 36,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF2196F3),
            letterSpacing: 1,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width > 800 ? 16 : 14,
            color: const Color(0xB3FFFFFF),
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildOptimizedSkillsSection() {
    return Container(
      key: _skillsKey,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 800 ? 50 : 20,
        vertical: MediaQuery.of(context).size.width > 800 ? 120 : 80,
      ),
      child: Column(
        children: [
          Text(
            'SKILLS',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width > 800 ? 48 : 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width > 800 ? 100 : 60),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: MediaQuery.of(context).size.width > 1200
                ? 4
                : MediaQuery.of(context).size.width > 800
                ? 3
                : 1,
            crossAxisSpacing: MediaQuery.of(context).size.width > 800 ? 30 : 20,
            mainAxisSpacing: MediaQuery.of(context).size.width > 800 ? 30 : 20,
            childAspectRatio: MediaQuery.of(context).size.width > 800
                ? 1.2
                : 1.5,
            children: const [
              OptimizedSkillCard('Flutter', Icons.mobile_friendly, 95),
              OptimizedSkillCard('Dart', Icons.code, 90),
              OptimizedSkillCard('Android', Icons.android, 85),
              OptimizedSkillCard('iOS', Icons.phone_iphone, 80),
              OptimizedSkillCard('Firebase', Icons.cloud, 85),
              OptimizedSkillCard('Git', Icons.source, 90),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptimizedProjectsSection() {
    return Container(
      key: _projectsKey,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 800 ? 50 : 20,
        vertical: MediaQuery.of(context).size.width > 800 ? 120 : 80,
      ),
      child: Column(
        children: [
          Text(
            'PROJECTS',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width > 800 ? 48 : 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width > 800 ? 100 : 60),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1.3,
            children: const [
              OptimizedProjectCard(
                'E-Commerce App',
                'Modern e-commerce application',
                Icons.shopping_cart,
                'Flutter, Firebase',
              ),
              OptimizedProjectCard(
                'Fitness Tracker',
                'Personal fitness tracking app',
                Icons.fitness_center,
                'Flutter, SQLite',
              ),
              OptimizedProjectCard(
                'Weather App',
                'Weather application',
                Icons.wb_sunny,
                'Flutter, API',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptimizedContactSection() {
    return Container(
      key: _contactKey,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 800 ? 50 : 20,
        vertical: MediaQuery.of(context).size.width > 800 ? 120 : 80,
      ),
      child: Column(
        children: [
          Text(
            'CONTACT',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width > 800 ? 48 : 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width > 800 ? 100 : 60),
          MediaQuery.of(context).size.width > 800
              ? Row(
                  children: [
                    // Contact Info
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let\'s Work Together',
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'I provide professional mobile solutions for your projects.',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: const Color(0xCCFFFFFF),
                              height: 1.6,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 50),
                          const OptimizedContactItem(
                            Icons.email,
                            'contact@example.com',
                          ),
                          const SizedBox(height: 20),
                          const OptimizedContactItem(
                            Icons.phone,
                            '+90 555 123 4567',
                          ),
                          const SizedBox(height: 20),
                          const OptimizedContactItem(
                            Icons.location_on,
                            'İstanbul, Türkiye',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 80),
                    // Contact Form
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: const Color(0x0DFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0x1AFFFFFF),
                            width: 1,
                          ),
                        ),
                        child: const OptimizedContactForm(),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    // Contact Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Let\'s Work Together',
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'I provide professional mobile solutions for your projects.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color(0xCCFFFFFF),
                            height: 1.6,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const OptimizedContactItem(
                          Icons.email,
                          'contact@example.com',
                        ),
                        const SizedBox(height: 15),
                        const OptimizedContactItem(
                          Icons.phone,
                          '+90 555 123 4567',
                        ),
                        const SizedBox(height: 15),
                        const OptimizedContactItem(
                          Icons.location_on,
                          'İstanbul, Türkiye',
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Contact Form
                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: const Color(0x0DFFFFFF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0x1AFFFFFF),
                          width: 1,
                        ),
                      ),
                      child: const OptimizedContactForm(),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

// Optimized Widgets using const constructors for better performance
class OptimizedSkillCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final int percentage;

  const OptimizedSkillCard(this.title, this.icon, this.percentage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width > 800 ? 30 : 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0x0DFFFFFF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x1AFFFFFF), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D000000),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: MediaQuery.of(context).size.width > 800 ? 60 : 50,
            color: const Color(0xFF2196F3),
          ),
          SizedBox(height: MediaQuery.of(context).size.width > 800 ? 20 : 15),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width > 800 ? 20 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width > 800 ? 20 : 15),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0x1AFFFFFF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage / 100,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$percentage%',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xB3FFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class OptimizedProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String tech;

  const OptimizedProjectCard(
    this.title,
    this.description,
    this.icon,
    this.tech, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: const Color(0x0DFFFFFF),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0x1AFFFFFF), width: 1),
            boxShadow: const [
              BoxShadow(
                color: Color(0x4D000000),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 50, color: const Color(0xFF2196F3)),
              const SizedBox(height: 20),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xB3FFFFFF),
                  height: 1.5,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                tech,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFF2196F3),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptimizedContactItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const OptimizedContactItem(this.icon, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF2196F3),
          size: MediaQuery.of(context).size.width > 800 ? 24 : 20,
        ),
        SizedBox(width: MediaQuery.of(context).size.width > 800 ? 15 : 12),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width > 800 ? 16 : 14,
              color: const Color(0xCCFFFFFF),
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}

class OptimizedContactForm extends StatelessWidget {
  const OptimizedContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Column(
      children: [
        OptimizedFormField('Full Name'),
        SizedBox(height: isDesktop ? 20 : 15),
        OptimizedFormField('Email'),
        SizedBox(height: isDesktop ? 20 : 15),
        OptimizedFormField('Message', maxLines: 4),
        SizedBox(height: isDesktop ? 30 : 25),
        const OptimizedSubmitButton(),
      ],
    );
  }
}

class OptimizedFormField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const OptimizedFormField(this.hint, {this.maxLines = 1, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width > 800 ? 16 : 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: const Color(0x80FFFFFF),
          fontSize: MediaQuery.of(context).size.width > 800 ? 16 : 14,
        ),
        filled: true,
        fillColor: const Color(0x0DFFFFFF),
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 800 ? 20 : 15,
          vertical: MediaQuery.of(context).size.width > 800 ? 15 : 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0x33FFFFFF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0x33FFFFFF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
        ),
      ),
    );
  }
}

class OptimizedSubmitButton extends StatelessWidget {
  const OptimizedSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width > 800 ? 20 : 15,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xCC2196F3), Color(0xCC9C27B0)],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x4D2196F3),
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            'SEND MESSAGE',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width > 800 ? 16 : 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
