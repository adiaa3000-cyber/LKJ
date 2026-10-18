
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    publishableKey: 'YOUR_SUPABASE_PUBLISHABLE_KEY',
  );

  runApp(const DioxivetApp());
}


const navy = Color(0xFF102A43);
const teal = Color(0xFF18A999);
const pale = Color(0xFFF3F7FA);

class DioxivetApp extends StatelessWidget {
  const DioxivetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dioxivet Academy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pale,
        colorScheme: ColorScheme.fromSeed(seedColor: teal),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFE4EBF0)),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class Course {
  final String title;
  final String category;
  final String description;
  final String lessons;
  final String level;
  final IconData icon;

  const Course({
    required this.title,
    required this.category,
    required this.description,
    required this.lessons,
    required this.level,
    required this.icon,
  });
}

const courses = <Course>[
  Course(
    title: 'Clinical Examination in Small Animals',
    category: 'باطنة وتشخيص',
    description:
        'مقدمة تعليمية لفحص الحيوانات الصغيرة، وأخذ التاريخ المرضي، والملاحظة السريرية المنظمة.',
    lessons: '12 محاضرة',
    level: 'مبتدئ',
    icon: Icons.medical_services_outlined,
  ),
  Course(
    title: 'Veterinary Surgery Essentials',
    category: 'جراحة',
    description:
        'مبادئ تمهيدية في الجراحة البيطرية، والتجهيز، والتعقيم، ومفاهيم السلامة الأساسية.',
    lessons: '9 محاضرات',
    level: 'متوسط',
    icon: Icons.healing_outlined,
  ),
  Course(
    title: 'Laboratory Diagnostics',
    category: 'تحاليل ومعامل',
    description:
        'التعرف على أساسيات العينات والتحاليل المعملية وكيفية فهم النتائج في السياق السريري.',
    lessons: '8 محاضرات',
    level: 'مبتدئ',
    icon: Icons.biotech_outlined,
  ),
  Course(
    title: 'Farm Animal Health',
    category: 'حيوانات المزرعة',
    description:
        'مفاهيم أساسية في متابعة صحة حيوانات المزرعة والوقاية والإدارة الصحية.',
    lessons: '10 محاضرات',
    level: 'متوسط',
    icon: Icons.agriculture_outlined,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildHome(),
      const CoursesScreen(),
      const MyLearningScreen(),
      const AccountScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: teal,
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Icon(Icons.school_outlined, color: navy),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dioxivet Academy',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
                Text('VETERINARY EDUCATION',
                    style: TextStyle(fontSize: 9, letterSpacing: 1.2)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'الإشعارات',
            onPressed: () => _showMessage('الإشعارات ستُضاف في مرحلة لاحقة.'),
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: pages[selectedTab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) => setState(() => selectedTab = index),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
          NavigationDestination(
              icon: Icon(Icons.menu_book_outlined), label: 'الكورسات'),
          NavigationDestination(
              icon: Icon(Icons.play_circle_outline), label: 'تعلمي'),
          NavigationDestination(
              icon: Icon(Icons.person_outline), label: 'حسابي'),
        ],
      ),
    );
  }

  Widget _buildHome() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [navy, Color(0xFF1B4965)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('أهلاً بيك في Dioxivet',
                  style: TextStyle(color: Color(0xFF7DE2D1), fontSize: 14)),
              const SizedBox(height: 12),
              const Text(
                'طوّر مستواك البيطري',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    height: 1.25,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              const Text(
                'تعلّم من محاضرات متخصصة، وابدأ رحلتك المهنية.',
                style: TextStyle(color: Colors.white70, height: 1.5),
              ),
              const SizedBox(height: 18),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: teal,
                  foregroundColor: navy,
                ),
                onPressed: () => setState(() => selectedTab = 1),
                child: const Text('استكشف الكورسات'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const SectionHeading(title: 'التخصصات', subtitle: 'اختار المجال اللي يهمك'),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5,
          children: const [
            CategoryTile(icon: Icons.medical_services_outlined, title: 'الباطنة والتشخيص'),
            CategoryTile(icon: Icons.healing_outlined, title: 'الجراحة'),
            CategoryTile(icon: Icons.biotech_outlined, title: 'التحاليل والمعامل'),
            CategoryTile(icon: Icons.agriculture_outlined, title: 'حيوانات المزرعة'),
          ],
        ),
        const SizedBox(height: 24),
        const SectionHeading(title: 'كورسات مقترحة', subtitle: 'محتوى تجريبي للتصميم'),
        const SizedBox(height: 12),
        ...courses.take(3).map((course) => CourseCard(
              course: course,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CourseDetailsScreen(course: course),
                ),
              ),
            )),
        const SizedBox(height: 8),
        const Text(
          'ملاحظة: الكورسات المعروضة بيانات تجريبية وليست محتوى منشوراً.',
          style: TextStyle(color: Colors.black54, fontSize: 11),
        ),
      ],
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeading({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800, color: navy)),
              const SizedBox(height: 3),
              Text(subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: teal, size: 29),
            const SizedBox(height: 8),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  const CourseCard({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F5F1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(course.icon, color: navy, size: 29),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.category,
                        style: const TextStyle(
                            color: teal, fontWeight: FontWeight.w700, fontSize: 11)),
                    const SizedBox(height: 4),
                    Text(course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: navy, fontWeight: FontWeight.w800, fontSize: 14)),
                    const SizedBox(height: 5),
                    Text('${course.lessons} • ${course.level}',
                        style: const TextStyle(color: Colors.black54, fontSize: 11)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black45),
            ],
          ),
        ),
      ),
    );
  }
}

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('كل الكورسات',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: navy)),
        const SizedBox(height: 5),
        const Text('استكشف المسارات التعليمية البيطرية المتاحة.'),
        const SizedBox(height: 16),
        ...courses.map((course) => CourseCard(
              course: course,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CourseDetailsScreen(course: course),
                ),
              ),
            )),
      ],
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  const CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الكورس')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: const Color(0xFFE0F5F1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(course.icon, size: 76, color: navy),
          ),
          const SizedBox(height: 20),
          Text(course.category,
              style: const TextStyle(color: teal, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Text(course.title,
              style: const TextStyle(
                  fontSize: 24, height: 1.25, color: navy, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          Text(course.description, style: const TextStyle(height: 1.6)),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: Text(course.lessons)),
              Chip(label: Text(course.level)),
              const Chip(label: Text('بيانات تجريبية')),
            ],
          ),
          const SizedBox(height: 22),
          const Text('محتوى الكورس',
              style: TextStyle(fontSize: 18, color: navy, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          const LessonRow(number: '01', title: 'مقدمة وتعريف بالكورس'),
          const LessonRow(number: '02', title: 'المفاهيم الأساسية'),
          const LessonRow(number: '03', title: 'تطبيقات وحالات تعليمية'),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('سيتم تفعيل التسجيل ومشاهدة المحاضرات في المرحلة التالية.'),
                ),
              );
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text('ابدأ التعلّم — قريباً'),
          ),
        ],
      ),
    );
  }
}

class LessonRow extends StatelessWidget {
  final String number;
  final String title;

  const LessonRow({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFE0F5F1),
        foregroundColor: navy,
        child: Text(number),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.lock_outline, size: 19),
    );
  }
}

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyState(
      icon: Icons.play_circle_outline,
      title: 'رحلتك التعليمية هتبدأ هنا',
      message: 'بعد إضافة تسجيل الدخول والاشتراكات، هتظهر هنا الكورسات اللي اشتركت فيها وتقدمك في كل كورس.',
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyState(
      icon: Icons.person_outline,
      title: 'حساب الطالب',
      message: 'هنضيف إنشاء الحساب وتسجيل الدخول والبيانات الشخصية في المرحلة القادمة.',
    );
  }
}

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: teal),
            const SizedBox(height: 16),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 21, color: navy, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.6, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
