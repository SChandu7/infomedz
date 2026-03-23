// lib/screens/home_screen.dart
// Full InfoMedZ Home — All Features, All Roles, Rich UI
// Contains: HomeScreen, PatientDashboard, DoctorDashboard,
//           AppointmentsPage, MedicinesPage, LabTestsPage,
//           HospitalsPage, RecordsPage, ChatPage, ProfilePage

import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme/app_theme.dart';
import '../screens/splash_screen.dart';


// ─────────────────────────────────────────────
// DATA MODELS (Dummy)
// ─────────────────────────────────────────────
class DummyData {
  static List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. Priya Sharma',
      'specialty': 'Cardiologist',
      'hospital': 'Apollo Hospital',
      'rating': 4.9,
      'reviews': 312,
      'experience': '15 yrs',
      'fee': '₹800',
      'available': true,
      'image': '👩‍⚕️',
      'location': 'Hyderabad',
    },
    {
      'name': 'Dr. Ramesh Kumar',
      'specialty': 'Neurologist',
      'hospital': 'KIMS Hospital',
      'rating': 4.8,
      'reviews': 228,
      'experience': '12 yrs',
      'fee': '₹700',
      'available': true,
      'image': '👨‍⚕️',
      'location': 'Guntur',
    },
    {
      'name': 'Dr. Anita Rao',
      'specialty': 'Pediatrician',
      'hospital': 'Rainbow Hospital',
      'rating': 4.7,
      'reviews': 187,
      'experience': '10 yrs',
      'fee': '₹600',
      'available': false,
      'image': '👩‍⚕️',
      'location': 'Vijayawada',
    },
    {
      'name': 'Dr. Suresh Patel',
      'specialty': 'Orthopedic',
      'hospital': 'Care Hospital',
      'rating': 4.9,
      'reviews': 402,
      'experience': '20 yrs',
      'fee': '₹900',
      'available': true,
      'image': '👨‍⚕️',
      'location': 'Mumbai',
    },
  ];

  static List<Map<String, dynamic>> appointments = [
    {
      'doctor': 'Dr. Priya Sharma',
      'specialty': 'Cardiology',
      'date': 'Today, 3:30 PM',
      'status': 'Confirmed',
      'type': 'Video Call',
      'icon': '💗',
      'statusColor': AppColors.success,
    },
    {
      'doctor': 'Dr. Ramesh Kumar',
      'specialty': 'Neurology',
      'date': 'Mar 25, 10:00 AM',
      'status': 'Pending',
      'type': 'In-Person',
      'icon': '🧠',
      'statusColor': AppColors.warning,
    },
    {
      'doctor': 'Dr. Anita Rao',
      'specialty': 'Pediatrics',
      'date': 'Mar 28, 2:00 PM',
      'status': 'Confirmed',
      'type': 'Video Call',
      'icon': '👶',
      'statusColor': AppColors.success,
    },
  ];

  static List<Map<String, dynamic>> medicines = [
    {
      'name': 'Paracetamol 500mg',
      'brand': 'Calpol',
      'type': 'Tablet',
      'price': '₹25',
      'stock': 'In Stock',
      'icon': '💊',
    },
    {
      'name': 'Azithromycin 250mg',
      'brand': 'Zithromax',
      'type': 'Capsule',
      'price': '₹120',
      'stock': 'In Stock',
      'icon': '💊',
    },
    {
      'name': 'Cetirizine 10mg',
      'brand': 'Zyrtec',
      'type': 'Tablet',
      'price': '₹40',
      'stock': 'Low Stock',
      'icon': '💊',
    },
    {
      'name': 'Omeprazole 20mg',
      'brand': 'Prilosec',
      'type': 'Capsule',
      'price': '₹55',
      'stock': 'In Stock',
      'icon': '💊',
    },
  ];

  static List<Map<String, dynamic>> labTests = [
    {
      'name': 'Complete Blood Count',
      'lab': 'Dr. Lal PathLabs',
      'price': '₹350',
      'duration': '6 hrs',
      'icon': '🩸',
      'category': 'Blood',
    },
    {
      'name': 'Lipid Profile',
      'lab': 'SRL Diagnostics',
      'price': '₹600',
      'duration': '12 hrs',
      'icon': '🔬',
      'category': 'Cardiac',
    },
    {
      'name': 'Thyroid Panel (T3,T4,TSH)',
      'lab': 'Thyrocare',
      'price': '₹450',
      'duration': '24 hrs',
      'icon': '🧬',
      'category': 'Hormones',
    },
    {
      'name': 'HbA1c',
      'lab': 'Dr. Lal PathLabs',
      'price': '₹280',
      'duration': '4 hrs',
      'icon': '💉',
      'category': 'Diabetes',
    },
  ];

  static List<Map<String, dynamic>> hospitals = [
    {
      'name': 'Apollo Hospital',
      'location': 'Jubilee Hills, Hyderabad',
      'rating': 4.8,
      'beds': 500,
      'specialties': ['Cardiology', 'Neurology', 'Oncology'],
      'icon': '🏥',
      'type': 'Multi-Specialty',
      'emergency': true,
    },
    {
      'name': 'KIMS Hospital',
      'location': 'Secunderabad',
      'rating': 4.7,
      'beds': 350,
      'specialties': ['Orthopedics', 'Urology', 'ENT'],
      'icon': '🏥',
      'type': 'Multi-Specialty',
      'emergency': true,
    },
    {
      'name': 'Rainbow Children\'s Hospital',
      'location': 'Banjara Hills',
      'rating': 4.9,
      'beds': 200,
      'specialties': ['Pediatrics', 'Neonatology'],
      'icon': '🏥',
      'type': 'Specialty',
      'emergency': true,
    },
  ];

  static List<Map<String, dynamic>> records = [
    {
      'title': 'Blood Report - CBC',
      'date': 'Mar 10, 2025',
      'doctor': 'Dr. Priya Sharma',
      'type': 'Lab Report',
      'icon': '📋',
      'color': AppColors.info,
    },
    {
      'title': 'ECG Report',
      'date': 'Feb 20, 2025',
      'doctor': 'Dr. Priya Sharma',
      'type': 'Diagnosis',
      'icon': '📈',
      'color': AppColors.accent,
    },
    {
      'title': 'Prescription - Antibiotics',
      'date': 'Jan 15, 2025',
      'doctor': 'Dr. Ramesh Kumar',
      'type': 'Prescription',
      'icon': '📝',
      'color': AppColors.primary,
    },
    {
      'title': 'X-Ray Chest',
      'date': 'Dec 5, 2024',
      'doctor': 'Dr. Suresh Patel',
      'type': 'Radiology',
      'icon': '🫁',
      'color': AppColors.secondary,
    },
  ];

  static List<Map<String, dynamic>> chatMessages = [
    {'sender': 'Dr. Priya Sharma', 'msg': 'Hello! How are you feeling today?', 'time': '10:02 AM', 'isMe': false},
    {'sender': 'Me', 'msg': 'I\'ve been having chest discomfort since morning.', 'time': '10:04 AM', 'isMe': true},
    {'sender': 'Dr. Priya Sharma', 'msg': 'I see. Is it a sharp pain or dull pressure? Any shortness of breath?', 'time': '10:05 AM', 'isMe': false},
    {'sender': 'Me', 'msg': 'Dull pressure. No breathing issues.', 'time': '10:07 AM', 'isMe': true},
    {'sender': 'Dr. Priya Sharma', 'msg': 'Okay. Please take your last ECG report and meet me at 3:30 PM. I\'ll prescribe accordingly.', 'time': '10:09 AM', 'isMe': false},
  ];

  // Doctor-specific data
  static Map<String, dynamic> doctorStats = {
    'patientsToday': 18,
    'appointments': 12,
    'pending': 4,
    'completed': 8,
    'rating': 4.9,
    'earnings': '₹14,400',
  };

  static List<Map<String, dynamic>> patientQueue = [
    {'name': 'Arjun Mehta', 'age': 45, 'issue': 'Chest Pain', 'time': '9:00 AM', 'status': 'In Progress', 'token': 'T001'},
    {'name': 'Sunita Reddy', 'age': 32, 'issue': 'Palpitations', 'time': '9:30 AM', 'status': 'Waiting', 'token': 'T002'},
    {'name': 'Vikram Singh', 'age': 58, 'issue': 'Hypertension Follow-up', 'time': '10:00 AM', 'status': 'Waiting', 'token': 'T003'},
    {'name': 'Meena Patel', 'age': 29, 'issue': 'Shortness of breath', 'time': '10:30 AM', 'status': 'Scheduled', 'token': 'T004'},
  ];
}

// ─────────────────────────────────────────────
// HOME SCREEN (Shell)
// ─────────────────────────────────────────────
class HomeScreen extends StatefulWidget {
  final String role;
  const HomeScreen({super.key, required this.role});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _navController;

  @override
  void initState() {
    super.initState();
    _navController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _navController.dispose();
    super.dispose();
  }

  List<Widget> get _pages {
    if (widget.role == 'Doctor') {
      return [
        const DoctorHomePage(),
        const AppointmentsPage(),
        const ChatPage(role: 'Doctor'),
        const ProfilePage(role: 'Doctor'),
      ];
    }
    return [
      const PatientHomePage(),
      const AppointmentsPage(),
      const MedicinesPage(),
      const ChatPage(role: 'Patient'),
      const ProfilePage(role: 'Patient'),
    ];
  }

  List<BottomNavigationBarItem> get _navItems {
    if (widget.role == 'Doctor') {
      return const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today_rounded), label: 'Schedule'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
      ];
    }
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_today_rounded), label: 'Book'),
      BottomNavigationBarItem(icon: Icon(Icons.local_pharmacy_rounded), label: 'Medicines'),
      BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'Chat'),
      BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: KeyedSubtree(
          key: ValueKey(_currentIndex),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.textLight,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            elevation: 0,
            items: _navItems,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// PATIENT HOME PAGE
// ─────────────────────────────────────────────
class PatientHomePage extends StatefulWidget {
  const PatientHomePage({super.key});

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _searchController = TextEditingController();
  int _selectedSpecialty = 0;

  final List<String> _specialties = [
    'All', 'Cardiology', 'Neurology', 'Orthopedic',
    'Pediatrics', 'Dermatology', 'ENT', 'Dental',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeroHeader(),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: const SizedBox(),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  _buildSearchBar(),
                  const SizedBox(height: 24),

                  // Quick Actions
                  _buildSectionHeader('Quick Actions', 'See all'),
                  const SizedBox(height: 14),
                  _buildQuickActions(),
                  const SizedBox(height: 24),

                  // Health Stats
                  _buildSectionHeader('Your Health Summary', null),
                  const SizedBox(height: 14),
                  _buildHealthStats(),
                  const SizedBox(height: 24),

                  // Upcoming Appointment
                  _buildSectionHeader('Upcoming Appointments', 'View all'),
                  const SizedBox(height: 14),
                  _buildUpcomingAppointment(),
                  const SizedBox(height: 24),

                  // Find Doctors
                  _buildSectionHeader('Find Doctors', 'See all'),
                  const SizedBox(height: 14),
                  _buildSpecialtyChips(),
                  const SizedBox(height: 14),
                  _buildDoctorCards(),
                  const SizedBox(height: 24),

                  // Hospitals Near You
                  _buildSectionHeader('Hospitals Near You', 'View map'),
                  const SizedBox(height: 14),
                  _buildHospitalCards(),
                  const SizedBox(height: 24),

                  // Lab Tests
                  _buildSectionHeader('Popular Lab Tests', 'Book now'),
                  const SizedBox(height: 14),
                  _buildLabTestCards(),
                  const SizedBox(height: 24),

                  // Medical Records
                  _buildSectionHeader('Recent Records', 'All records'),
                  const SizedBox(height: 14),
                  _buildMedicalRecords(),
                  const SizedBox(height: 24),

                  // Emergency
                  _buildEmergencyBanner(),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Good Morning 🌤',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Arjun Mehta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildHeaderIcon(Icons.notifications_outlined, onTap: () {}),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primary,
                        child: const Text('AM',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatChip('Next Appt', 'Today 3:30 PM', '📅'),
                    _buildStatDivider(),
                    _buildStatChip('Blood Group', 'O+', '🩸'),
                    _buildStatDivider(),
                    _buildStatChip('BMI', '22.4', '⚖️'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatChip(String label, String value, String icon) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
        Text(label,
            style: const TextStyle(color: Colors.white60, fontSize: 10)),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
        width: 1, height: 36, color: Colors.white.withOpacity(0.2));
  }

  Widget _buildHeaderIcon(IconData icon, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.cardShadow,
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search doctors, hospitals, medicines...',
          hintStyle: TextStyle(color: AppColors.textLight, fontSize: 13),
          prefixIcon: Icon(Icons.search_rounded, color: AppColors.textLight, size: 20),
          suffixIcon: Icon(Icons.tune_rounded, color: AppColors.primary, size: 20),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String? action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.headlineMedium),
        if (action != null)
          GestureDetector(
            onTap: () {},
            child: Text(
              action,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'label': 'Book Appt', 'icon': '📅', 'gradient': AppColors.blueGradient},
      {'label': 'Medicines', 'icon': '💊', 'gradient': AppColors.primaryGradient},
      {'label': 'Lab Tests', 'icon': '🧪', 'gradient': const LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)])},
      {'label': 'Emergency', 'icon': '🚨', 'gradient': AppColors.redGradient},
      {'label': 'Records', 'icon': '📋', 'gradient': const LinearGradient(colors: [Color(0xFF10B981), Color(0xFF34D399)])},
      {'label': 'Teleconsult', 'icon': '📹', 'gradient': const LinearGradient(colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)])},
      {'label': 'Ambulance', 'icon': '🚑', 'gradient': AppColors.redGradient},
      {'label': 'Find Hospital', 'icon': '🏥', 'gradient': AppColors.blueGradient},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: actions.length,
      itemBuilder: (context, i) {
        final action = actions[i];
        return GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: action['gradient'] as LinearGradient,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: (action['gradient'] as LinearGradient)
                          .colors[0]
                          .withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(action['icon'] as String,
                      style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                action['label'] as String,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHealthStats() {
    final stats = [
      {'label': 'Heart Rate', 'value': '72 bpm', 'icon': '❤️', 'color': AppColors.accent, 'trend': '↑'},
      {'label': 'Blood Pressure', 'value': '118/78', 'icon': '🩺', 'color': AppColors.secondary, 'trend': '→'},
      {'label': 'Blood Sugar', 'value': '96 mg/dL', 'icon': '🩸', 'color': AppColors.primary, 'trend': '↓'},
      {'label': 'SpO2', 'value': '98%', 'icon': '💨', 'color': const Color(0xFF10B981), 'trend': '→'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.0,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: stats.length,
      itemBuilder: (context, i) {
        final stat = stats[i];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppColors.cardShadow,
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: (stat['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(stat['icon'] as String,
                      style: const TextStyle(fontSize: 20)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(stat['value'] as String,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary)),
                    Text(stat['label'] as String,
                        style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary)),
                  ],
                ),
              ),
              Text(
                stat['trend'] as String,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: stat['trend'] == '↑'
                      ? AppColors.accent
                      : stat['trend'] == '↓'
                          ? AppColors.success
                          : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUpcomingAppointment() {
    final appt = DummyData.appointments.first;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppColors.blueGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppColors.blueShadow,
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(appt['icon'] as String,
                  style: const TextStyle(fontSize: 26)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appt['doctor'] as String,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15)),
                const SizedBox(height: 3),
                Text(appt['specialty'] as String,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        color: Colors.white70, size: 13),
                    const SizedBox(width: 4),
                    Text(appt['date'] as String,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 12)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(appt['type'] as String,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.secondary,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Join',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Reschedule',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialtyChips() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _specialties.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final isSelected = i == _selectedSpecialty;
          return GestureDetector(
            onTap: () => setState(() => _selectedSpecialty = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: AppColors.cardShadow,
              ),
              child: Text(
                _specialties[i],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDoctorCards() {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: DummyData.doctors.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, i) {
          final doc = DummyData.doctors[i];
          return Container(
            width: 155,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppColors.cardShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                          child: Text(doc['image'] as String,
                              style: const TextStyle(fontSize: 24))),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        color: (doc['available'] as bool)
                            ? AppColors.success.withOpacity(0.1)
                            : AppColors.error.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        (doc['available'] as bool) ? 'Online' : 'Busy',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: (doc['available'] as bool)
                              ? AppColors.success
                              : AppColors.error,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(doc['name'] as String,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(doc['specialty'] as String,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary)),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        color: Color(0xFFFBBF24), size: 14),
                    const SizedBox(width: 3),
                    Text(
                      '${doc['rating']}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${doc['reviews']})',
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.textLight),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(doc['fee'] as String,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary)),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Book',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHospitalCards() {
    return Column(
      children: DummyData.hospitals.take(2).map((hospital) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: AppColors.cardShadow,
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                    child: Text('🏥', style: TextStyle(fontSize: 26))),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(hospital['name'] as String,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary)),
                        ),
                        if (hospital['emergency'] == true)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text('24/7',
                                style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.accent)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 12, color: AppColors.textLight),
                        const SizedBox(width: 3),
                        Text(hospital['location'] as String,
                            style: const TextStyle(
                                fontSize: 11, color: AppColors.textSecondary)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            size: 13, color: Color(0xFFFBBF24)),
                        const SizedBox(width: 3),
                        Text('${hospital['rating']}',
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary)),
                        const SizedBox(width: 12),
                        const Icon(Icons.bed_outlined,
                            size: 13, color: AppColors.textLight),
                        const SizedBox(width: 3),
                        Text('${hospital['beds']} Beds',
                            style: const TextStyle(
                                fontSize: 11, color: AppColors.textSecondary)),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('Visit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLabTestCards() {
    return SizedBox(
      height: 145,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: DummyData.labTests.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final test = DummyData.labTests[i];
          return Container(
            width: 145,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: AppColors.cardShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(test['icon'] as String,
                    style: const TextStyle(fontSize: 26)),
                const SizedBox(height: 8),
                Text(test['name'] as String,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(test['lab'] as String,
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.textSecondary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(test['price'] as String,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary)),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(test['duration'] as String,
                          style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMedicalRecords() {
    return Column(
      children: DummyData.records.take(3).map((record) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppColors.cardShadow,
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: (record['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: Text(record['icon'] as String,
                        style: const TextStyle(fontSize: 22))),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(record['title'] as String,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary)),
                    const SizedBox(height: 3),
                    Text(record['doctor'] as String,
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: (record['color'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(record['type'] as String,
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: record['color'] as Color)),
                  ),
                  const SizedBox(height: 4),
                  Text(record['date'] as String,
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.textLight)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmergencyBanner() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppColors.redGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
                child: Text('🚨', style: TextStyle(fontSize: 26))),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Emergency?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w800)),
                SizedBox(height: 3),
                Text('Call 108 or book an ambulance instantly',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.accent,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('SOS',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// DOCTOR HOME PAGE
// ─────────────────────────────────────────────
class DoctorHomePage extends StatelessWidget {
  const DoctorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = DummyData.doctorStats;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 190,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildDoctorHeader(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats Row
                  Row(
                    children: [
                      Expanded(child: _buildDoctorStatCard('Patients Today', '${stats['patientsToday']}', '🧑‍⚕️', AppColors.secondary)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildDoctorStatCard('Appointments', '${stats['appointments']}', '📅', AppColors.primary)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildDoctorStatCard("Today's Earn", '${stats['earnings']}', '💰', AppColors.success)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Progress
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: AppColors.cardShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Today\'s Progress',
                                style: AppTextStyles.titleLarge),
                            Text('${stats['completed']}/${stats['appointments']} done',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: (stats['completed'] as int) /
                                (stats['appointments'] as int),
                            backgroundColor: AppColors.surfaceElevated,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary),
                            minHeight: 10,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildProgressChip('Completed', '${stats['completed']}', AppColors.success),
                            _buildProgressChip('Pending', '${stats['pending']}', AppColors.warning),
                            _buildProgressChip('Rating', '${stats['rating']}⭐', AppColors.primary),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Patient Queue
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Patient Queue', style: AppTextStyles.headlineMedium),
                      GestureDetector(
                        onTap: () {},
                        child: const Text('Manage',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  ...DummyData.patientQueue.map((patient) => _buildPatientQueueItem(patient)),

                  const SizedBox(height: 24),

                  // Quick Actions for Doctor
                  const Text('Quick Actions', style: AppTextStyles.headlineMedium),
                  const SizedBox(height: 14),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      _buildDoctorActionCard('Write Rx', '📝', AppColors.primaryGradient),
                      _buildDoctorActionCard('Lab Orders', '🧪', AppColors.blueGradient),
                      _buildDoctorActionCard('Patient History', '📋', const LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)])),
                      _buildDoctorActionCard('Telemedicine', '📹', const LinearGradient(colors: [Color(0xFF10B981), Color(0xFF34D399)])),
                      _buildDoctorActionCard('Referrals', '↗️', const LinearGradient(colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)])),
                      _buildDoctorActionCard('Reports', '📊', AppColors.redGradient),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A237E), Color(0xFF1565C0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primary,
                child: const Text('PS',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16)),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Dr. Priya Sharma',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.3)),
                    SizedBox(height: 3),
                    Text('Cardiologist · Apollo Hospital',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        _DocBadge(label: 'MBBS, MD', color: Color(0xFF10B981)),
                        SizedBox(width: 6),
                        _DocBadge(label: '15 yrs exp', color: AppColors.primary),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.notifications_outlined,
                    color: Colors.white, size: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorStatCard(String label, String value, String icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 8),
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: color)),
          const SizedBox(height: 2),
          Text(label,
              style: const TextStyle(
                  fontSize: 10, color: AppColors.textSecondary),
              maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _buildProgressChip(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w800, color: color)),
          Text(label,
              style: const TextStyle(
                  fontSize: 10, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildPatientQueueItem(Map<String, dynamic> patient) {
    final statusColor = patient['status'] == 'In Progress'
        ? AppColors.primary
        : patient['status'] == 'Waiting'
            ? AppColors.warning
            : AppColors.textLight;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
        border: patient['status'] == 'In Progress'
            ? Border.all(color: AppColors.primary.withOpacity(0.3))
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(patient['token'] as String,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: statusColor)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${patient['name']} · ${patient['age']}y',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(patient['issue'] as String,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(patient['time'] as String,
                  style: const TextStyle(
                      fontSize: 11, color: AppColors.textLight)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(patient['status'] as String,
                    style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: statusColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorActionCard(String label, String icon, LinearGradient gradient) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: gradient.colors[0].withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 6),
            Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _DocBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _DocBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontSize: 10, fontWeight: FontWeight.w700)),
    );
  }
}

// ─────────────────────────────────────────────
// APPOINTMENTS PAGE
// ─────────────────────────────────────────────
class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Appointments'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Book'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          indicatorWeight: 2.5,
          labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAppointmentList(DummyData.appointments),
          _buildAppointmentList([]),
          _buildAppointmentList([]),
        ],
      ),
    );
  }

  Widget _buildAppointmentList(List<Map<String, dynamic>> appts) {
    if (appts.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('📭', style: TextStyle(fontSize: 48)),
            SizedBox(height: 12),
            Text('No appointments here',
                style: AppTextStyles.titleMedium),
            SizedBox(height: 4),
            Text('Book a new appointment',
                style: AppTextStyles.bodyMedium),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: appts.length,
      itemBuilder: (context, i) {
        final appt = appts[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppColors.cardShadow,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                        child: Text(appt['icon'] as String,
                            style: const TextStyle(fontSize: 24))),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(appt['doctor'] as String,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary)),
                        const SizedBox(height: 3),
                        Text(appt['specialty'] as String,
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: (appt['statusColor'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(appt['status'] as String,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: appt['statusColor'] as Color)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildApptDetail(Icons.calendar_today, appt['date'] as String),
                    _buildApptDetail(Icons.video_call_outlined, appt['type'] as String),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text('Reschedule',
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 0,
                      ),
                      child: const Text('Join Call',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildApptDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 5),
        Text(text,
            style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// MEDICINES PAGE
// ─────────────────────────────────────────────
class MedicinesPage extends StatefulWidget {
  const MedicinesPage({super.key});

  @override
  State<MedicinesPage> createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {
  final _searchController = TextEditingController();
  final List<String> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Medicines & Pharmacy'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: AppColors.primary),
                onPressed: () {},
              ),
              if (_cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                        color: AppColors.accent, shape: BoxShape.circle),
                    child: Center(
                      child: Text('${_cartItems.length}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Upload Prescription Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(18),
              boxShadow: AppColors.elevatedShadow,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upload Prescription',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                      SizedBox(height: 4),
                      Text('Get medicines delivered to your door',
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('Upload',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Search
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: AppColors.cardShadow,
            ),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search medicines, brands...',
                prefixIcon: Icon(Icons.search_rounded, color: AppColors.textLight, size: 20),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text('Available Medicines', style: AppTextStyles.headlineMedium),
          const SizedBox(height: 14),

          ...DummyData.medicines.map((med) => _buildMedicineCard(med)),

          const SizedBox(height: 24),
          const Text('Your Active Prescriptions', style: AppTextStyles.headlineMedium),
          const SizedBox(height: 14),
          _buildPrescriptionCard(),
        ],
      ),
    );
  }

  Widget _buildMedicineCard(Map<String, dynamic> med) {
    final bool isInCart = _cartItems.contains(med['name']);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
                child: Text('💊', style: TextStyle(fontSize: 24))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(med['name'] as String,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text('${med['brand']} · ${med['type']}',
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary)),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: med['stock'] == 'In Stock'
                        ? AppColors.success.withOpacity(0.1)
                        : AppColors.warning.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(med['stock'] as String,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: med['stock'] == 'In Stock'
                              ? AppColors.success
                              : AppColors.warning)),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(med['price'] as String,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (isInCart) {
                      _cartItems.remove(med['name']);
                    } else {
                      _cartItems.add(med['name'] as String);
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isInCart ? AppColors.success : AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    isInCart ? Icons.check : Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrescriptionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.cardShadow,
        border: Border.all(color: AppColors.secondary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dr. Priya Sharma',
                  style: AppTextStyles.titleLarge),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6)),
                child: const Text('Active',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.success)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text('Issued: Mar 10, 2025',
              style: AppTextStyles.bodyMedium),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 8),
          _buildPrescriptionItem('Paracetamol 500mg', '2 tabs · After meals · 5 days'),
          _buildPrescriptionItem('Azithromycin 250mg', '1 tab · Morning · 3 days'),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Order All Medicines',
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrescriptionItem(String name, String dosage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Text('💊', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary)),
                Text(dosage,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// CHAT PAGE (Teleconsultation)
// ─────────────────────────────────────────────
class ChatPage extends StatefulWidget {
  final String role;
  const ChatPage({super.key, required this.role});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _msgController = TextEditingController();
  final _scrollController = ScrollController();
  late List<Map<String, dynamic>> _messages;

  @override
  void initState() {
    super.initState();
    _messages = List.from(DummyData.chatMessages);
  }

  void _sendMessage() {
    if (_msgController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'sender': 'Me',
        'msg': _msgController.text.trim(),
        'time': 'Now',
        'isMe': true,
      });
      _msgController.clear();
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.secondary.withOpacity(0.1),
              child: const Text('👩‍⚕️', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dr. Priya Sharma',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary)),
                Text('Cardiologist · Online',
                    style: TextStyle(
                        fontSize: 10,
                        color: AppColors.success,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call_rounded, color: AppColors.primary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call_rounded, color: AppColors.secondary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, i) {
                final msg = _messages[i];
                final isMe = msg['isMe'] as bool;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: isMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!isMe) ...[
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.secondary.withOpacity(0.1),
                          child: const Text('👩‍⚕️',
                              style: TextStyle(fontSize: 12)),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isMe ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(18),
                              topRight: const Radius.circular(18),
                              bottomLeft: Radius.circular(isMe ? 18 : 4),
                              bottomRight: Radius.circular(isMe ? 4 : 18),
                            ),
                            boxShadow: AppColors.cardShadow,
                          ),
                          child: Column(
                            crossAxisAlignment: isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(msg['msg'] as String,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isMe
                                        ? Colors.white
                                        : AppColors.textPrimary,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                  )),
                              const SizedBox(height: 4),
                              Text(msg['time'] as String,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: isMe
                                          ? Colors.white60
                                          : AppColors.textLight)),
                            ],
                          ),
                        ),
                      ),
                      if (isMe) const SizedBox(width: 8),
                    ],
                  ),
                );
              },
            ),
          ),

          // Input bar
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file_rounded,
                      color: AppColors.textSecondary),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceElevated,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _msgController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send_rounded,
                        color: Colors.white, size: 20),
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

// ─────────────────────────────────────────────
// PROFILE PAGE
// ─────────────────────────────────────────────
class ProfilePage extends StatelessWidget {
  final String role;
  const ProfilePage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    final isDoctor = role == 'Doctor';
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildProfileHeader(isDoctor),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if (isDoctor) ...[
                    _buildDoctorProfileStats(),
                    const SizedBox(height: 20),
                  ],
                  _buildProfileSection('Account', [
                    _buildProfileItem(Icons.person_outline, 'Personal Information', null),
                    _buildProfileItem(Icons.medical_information_outlined, isDoctor ? 'Medical License' : 'Medical History', null),
                    _buildProfileItem(Icons.security_outlined, 'Privacy & Security', null),
                    _buildProfileItem(Icons.notifications_outlined, 'Notifications', null),
                  ]),
                  const SizedBox(height: 16),
                  _buildProfileSection('Health', [
                    if (!isDoctor) ...[
                      _buildProfileItem(Icons.monitor_heart_outlined, 'Health Records', '4 files'),
                      _buildProfileItem(Icons.medication_outlined, 'Prescriptions', '2 active'),
                    ],
                    _buildProfileItem(Icons.star_outline, 'Reviews & Ratings', isDoctor ? '312 reviews' : null),
                    _buildProfileItem(Icons.history, 'Appointment History', null),
                  ]),
                  const SizedBox(height: 16),
                  _buildProfileSection('Support', [
                    _buildProfileItem(Icons.help_outline, 'Help & Support', null),
                    _buildProfileItem(Icons.info_outline, 'About InfoMedZ', null),
                    _buildProfileItem(Icons.policy_outlined, 'Terms & Privacy', null),
                  ]),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (_) => LoginScreen()),
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.logout_rounded,
                          color: AppColors.accent),
                      label: const Text('Sign Out',
                          style: TextStyle(
                              color: AppColors.accent,
                              fontWeight: FontWeight.w700)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.accent.withOpacity(0.5)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(bool isDoctor) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 42,
              backgroundColor: AppColors.primary,
              child: Text(
                isDoctor ? 'PS' : 'AM',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 22),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              isDoctor ? 'Dr. Priya Sharma' : 'Arjun Mehta',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Text(
              isDoctor ? 'Cardiologist · Apollo Hospital' : 'Patient · ID: P-2024-1892',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                isDoctor ? '⭐ 4.9 · 312 Reviews' : '🩸 O+ · Age 45',
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorProfileStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('2,450+', 'Patients'),
          _buildStatDivider(),
          _buildStatItem('15 yrs', 'Experience'),
          _buildStatDivider(),
          _buildStatItem('312', 'Reviews'),
          _buildStatDivider(),
          _buildStatItem('4.9 ⭐', 'Rating'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary)),
        const SizedBox(height: 2),
        Text(label,
            style: const TextStyle(
                fontSize: 11, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(width: 1, height: 36, color: const Color(0xFFE5E7EB));
  }

  Widget _buildProfileSection(String title, List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Text(title,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textLight,
                    letterSpacing: 0.8)),
          ),
          ...items,
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String? subtitle) {
    return ListTile(
      dense: true,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: AppColors.secondary),
      ),
      title: Text(title,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary)),
      subtitle: subtitle != null
          ? Text(subtitle,
              style: const TextStyle(
                  fontSize: 11, color: AppColors.textSecondary))
          : null,
      trailing: const Icon(Icons.chevron_right_rounded,
          color: AppColors.textLight, size: 18),
      onTap: () {},
    );
  }
}