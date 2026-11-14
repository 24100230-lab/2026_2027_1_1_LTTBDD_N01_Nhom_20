import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagerApp());
}

enum AppLanguage { vi, en }

class TaskItem {
  TaskItem({
    required this.title,
    required this.description,
    required this.priority,
    required this.dueDate,
    this.isCompleted = false,
  });

  String title;
  String description;
  String priority;
  DateTime dueDate;
  bool isCompleted;
}

class AppText {
  AppText(this.language);

  final AppLanguage language;
  bool get isEnglish => language == AppLanguage.en;

  String get appName => 'Task Manager';
  String get overview => isEnglish ? 'Overview' : 'Tổng quan';
  String get taskOverview => isEnglish ? 'Task overview' : 'Tổng quan công việc';
  String get tasks => isEnglish ? 'Tasks' : 'Công việc';
  String get statistics => isEnglish ? 'Statistics' : 'Thống kê';
  String get profile => isEnglish ? 'Profile' : 'Cá nhân';
  String get greetingMorning => isEnglish ? 'Good morning!' : 'Chào buổi sáng!';
  String get greetingAfternoon => isEnglish ? 'Good afternoon!' : 'Chào buổi chiều!';
  String get greetingEvening => isEnglish ? 'Good evening!' : 'Chào buổi tối!';
  String get today => isEnglish ? 'Today' : 'Hôm nay';
  String get progress => isEnglish ? 'Your progress' : 'Tiến độ của bạn';
  String get completedOf => isEnglish ? 'completed tasks' : 'công việc đã hoàn thành';
  String get totalTasks => isEnglish ? 'Total tasks' : 'Tổng công việc';
  String get inProgress => isEnglish ? 'In progress' : 'Đang thực hiện';
  String get completed => isEnglish ? 'Completed' : 'Hoàn thành';
  String get pending => isEnglish ? 'Not completed' : 'Chưa hoàn thành';
  String get recentTasks => isEnglish ? 'Recent tasks' : 'Công việc gần đây';
  String get seeAll => isEnglish ? 'See all' : 'Xem tất cả';
  String get taskList => isEnglish ? 'My tasks' : 'Danh sách công việc';
  String get searchHint => isEnglish ? 'Search tasks...' : 'Tìm kiếm công việc...';
  String get all => isEnglish ? 'All' : 'Tất cả';
  String get ongoing => isEnglish ? 'In progress' : 'Đang làm';
  String get done => isEnglish ? 'Completed' : 'Hoàn thành';
  String get noTasks => isEnglish ? 'No tasks yet' : 'Chưa có công việc nào';
  String get noResults => isEnglish ? 'No matching tasks found' : 'Không tìm thấy công việc phù hợp';
  String get addTask => isEnglish ? 'Add task' : 'Thêm công việc';
  String get editTask => isEnglish ? 'Edit task' : 'Chỉnh sửa công việc';
  String get taskName => isEnglish ? 'Task name' : 'Tên công việc';
  String get description => isEnglish ? 'Description' : 'Mô tả';
  String get priority => isEnglish ? 'Priority' : 'Mức độ ưu tiên';
  String get dueDate => isEnglish ? 'Due date' : 'Hạn hoàn thành';
  String get high => isEnglish ? 'High' : 'Cao';
  String get medium => isEnglish ? 'Medium' : 'Trung bình';
  String get low => isEnglish ? 'Low' : 'Thấp';
  String get save => isEnglish ? 'Save' : 'Lưu công việc';
  String get saveChanges => isEnglish ? 'Save changes' : 'Lưu thay đổi';
  String get cancel => isEnglish ? 'Cancel' : 'Hủy';
  String get delete => isEnglish ? 'Delete' : 'Xóa';
  String get deleteTask => isEnglish ? 'Delete task?' : 'Xóa công việc?';
  String get deleteConfirmation => isEnglish ? 'Are you sure you want to delete this task?' : 'Bạn có chắc chắn muốn xóa công việc này không?';
  String get enterTaskName => isEnglish ? 'Please enter a task name.' : 'Vui lòng nhập tên công việc.';
  String get taskSaved => isEnglish ? 'Task saved.' : 'Đã lưu công việc.';
  String get taskUpdated => isEnglish ? 'Task updated.' : 'Đã cập nhật công việc.';
  String get taskDeleted => isEnglish ? 'Task deleted.' : 'Đã xóa công việc.';
  String get languageLabel => isEnglish ? 'Language' : 'Ngôn ngữ';
  String get vietnamese => 'Tiếng Việt';
  String get english => 'English';
  String get personalInfo => isEnglish ? 'Personal information' : 'Thông tin người thực hiện';
  String get projectInfo => isEnglish ? 'Project information' : 'Thông tin đề tài';
  String get fullName => isEnglish ? 'Full name' : 'Họ và tên';
  String get studentId => isEnglish ? 'Student ID' : 'Mã sinh viên';
  String get course => isEnglish ? 'Course' : 'Học phần';
  String get projectName => isEnglish ? 'Project name' : 'Tên đề tài';
  String get technology => isEnglish ? 'Technology' : 'Công nghệ';
  String get projectDescription => isEnglish ? 'A simple application to create, organize and track personal tasks.' : 'Ứng dụng hỗ trợ tạo, sắp xếp và theo dõi tiến độ công việc cá nhân.';
  String get namePlaceholder => isEnglish ? 'Update your name here' : 'Cập nhật họ tên tại đây';
  String get idPlaceholder => isEnglish ? 'Update your student ID here' : 'Cập nhật mã sinh viên tại đây';
  String get editPersonalInfo => isEnglish ? 'Edit personal information' : 'Chỉnh sửa thông tin cá nhân';
  String get notUpdated => isEnglish ? 'Not updated yet' : 'Chưa cập nhật';
  String get saveProfile => isEnglish ? 'Save information' : 'Lưu thông tin';
  String get profileSaved => isEnglish ? 'Personal information saved.' : 'Đã lưu thông tin cá nhân.';
  String get appVersion => isEnglish ? 'Course project' : 'Bài tập lớn học phần';
  String get priorityBreakdown => isEnglish ? 'Tasks by priority' : 'Công việc theo mức ưu tiên';
  String get highPriority => isEnglish ? 'High priority' : 'Ưu tiên cao';
  String get mediumPriority => isEnglish ? 'Medium priority' : 'Ưu tiên trung bình';
  String get lowPriority => isEnglish ? 'Low priority' : 'Ưu tiên thấp';
  String get markCompleted => isEnglish ? 'Mark as completed' : 'Đánh dấu hoàn thành';
  String get markPending => isEnglish ? 'Mark as not completed' : 'Đánh dấu chưa hoàn thành';
  String get languageNote => isEnglish ? 'Choose the language displayed throughout the application.' : 'Chọn ngôn ngữ hiển thị trong toàn bộ ứng dụng.';
  String get personalPageNote => isEnglish ? 'This page contains the project author and course information.' : 'Trang này giới thiệu người thực hiện và thông tin học phần.';
}

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  AppLanguage _language = AppLanguage.vi;

  void _changeLanguage(AppLanguage language) {
    setState(() => _language = language);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6757D9),
          primary: const Color(0xFF6757D9),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F5FB),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F5FB),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: TaskHomePage(
        language: _language,
        onLanguageChanged: _changeLanguage,
      ),
    );
  }
}

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({
    super.key,
    required this.language,
    required this.onLanguageChanged,
  });

  final AppLanguage language;
  final ValueChanged<AppLanguage> onLanguageChanged;

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  int _selectedIndex = 0;
  String _statusFilter = 'all';
  final TextEditingController _searchController = TextEditingController();
  String _fullName = '';
  String _studentId = '';

  final List<TaskItem> _tasks = [
    TaskItem(
      title: 'Hoàn thành bài tập Flutter',
      description: 'Thiết kế giao diện ứng dụng quản lý công việc',
      priority: 'high',
      dueDate: DateTime.now(),
    ),
    TaskItem(
      title: 'Ôn tập môn lập trình',
      description: 'Ôn lại kiến thức Dart và lập trình hướng đối tượng',
      priority: 'medium',
      dueDate: DateTime.now().add(const Duration(days: 1)),
    ),
    TaskItem(
      title: 'Đọc tài liệu dự án',
      description: 'Tìm hiểu cấu trúc và kiến trúc ứng dụng',
      priority: 'low',
      dueDate: DateTime.now(),
      isCompleted: true,
    ),
  ];

  AppText get t => AppText(widget.language);

  int get _completedCount => _tasks.where((task) => task.isCompleted).length;
  int get _pendingCount => _tasks.length - _completedCount;
  double get _completionRate => _tasks.isEmpty ? 0 : _completedCount / _tasks.length;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return t.greetingMorning;
    if (hour < 18) return t.greetingAfternoon;
    return t.greetingEvening;
  }

  String _formatDate(DateTime date) => '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  String _todayLabel() {
    final now = DateTime.now();
    const viDays = ['Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ năm', 'Thứ sáu', 'Thứ bảy', 'Chủ nhật'];
    const enDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final day = widget.language == AppLanguage.vi ? viDays[now.weekday - 1] : enDays[now.weekday - 1];
    return '$day, ${_formatDate(now)}';
  }

  String _priorityLabel(String priority) {
    switch (priority) {
      case 'high':
        return t.high;
      case 'low':
        return t.low;
      default:
        return t.medium;
    }
  }

  Color _priorityColor(String priority) {
    switch (priority) {
      case 'high':
        return const Color(0xFFE45B68);
      case 'low':
        return const Color(0xFF299D78);
      default:
        return const Color(0xFFE59A35);
    }
  }

  List<TaskItem> get _visibleTasks {
    final keyword = _searchController.text.trim().toLowerCase();
    return _tasks.where((task) {
      final matchesSearch = task.title.toLowerCase().contains(keyword) ||
          task.description.toLowerCase().contains(keyword);
      final matchesStatus = switch (_statusFilter) {
        'pending' => !task.isCompleted,
        'completed' => task.isCompleted,
        _ => true,
      };
      return matchesSearch && matchesStatus;
    }).toList();
  }

  void _toggleTask(TaskItem task, bool value) {
    setState(() => task.isCompleted = value);
  }

  Future<void> _deleteTask(TaskItem task) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.deleteTask),
        content: Text('${t.deleteConfirmation}\n\n${task.title}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(t.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: const Color(0xFFD94D5C)),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(t.delete),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    setState(() => _tasks.remove(task));
    _showMessage(t.taskDeleted);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
  }

  Future<void> _editPersonalInfo() async {
    final nameController = TextEditingController(text: _fullName);
    final idController = TextEditingController(text: _studentId);

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.editPersonalInfo),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: t.fullName,
                  hintText: t.namePlaceholder,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: t.studentId,
                  hintText: t.idPlaceholder,
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(t.cancel),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                _fullName = nameController.text.trim();
                _studentId = idController.text.trim();
              });
              Navigator.pop(dialogContext);
              _showMessage(t.profileSaved);
            },
            child: Text(t.saveProfile),
          ),
        ],
      ),
    );

    nameController.dispose();
    idController.dispose();
  }

  Future<void> _openTaskForm({TaskItem? task}) async {
    final titleController = TextEditingController(text: task?.title ?? '');
    final descriptionController = TextEditingController(text: task?.description ?? '');
    String priority = task?.priority ?? 'medium';
    DateTime dueDate = task?.dueDate ?? DateTime.now();
    final isEditing = task != null;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetContext) => StatefulBuilder(
        builder: (sheetContext, setSheetState) => Padding(
          padding: EdgeInsets.fromLTRB(
            22,
            24,
            22,
            MediaQuery.of(sheetContext).viewInsets.bottom + 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(color: const Color(0xFFE4E2EB), borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 22),
                Text(isEditing ? t.editTask : t.addTask, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF242236))),
                const SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  textCapitalization: TextCapitalization.sentences,
                  autofocus: true,
                  decoration: _inputDecoration(t.taskName, Icons.title_rounded),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: descriptionController,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 3,
                  decoration: _inputDecoration(t.description, Icons.notes_rounded),
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<String>(
                  key: ValueKey(priority),
                  initialValue: priority,
                  decoration: _inputDecoration(t.priority, Icons.flag_outlined),
                  items: [
                    DropdownMenuItem(value: 'high', child: Text(t.high)),
                    DropdownMenuItem(value: 'medium', child: Text(t.medium)),
                    DropdownMenuItem(value: 'low', child: Text(t.low)),
                  ],
                  onChanged: (value) {
                    if (value != null) setSheetState(() => priority = value);
                  },
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: sheetContext,
                        initialDate: dueDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setSheetState(() => dueDate = picked);
                    },
                    icon: const Icon(Icons.calendar_month_outlined),
                    label: Text('${t.dueDate}: ${_formatDate(dueDate)}'),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: const Color(0xFF6757D9), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      final title = titleController.text.trim();
                      if (title.isEmpty) {
                        ScaffoldMessenger.of(sheetContext).showSnackBar(SnackBar(content: Text(t.enterTaskName)));
                        return;
                      }
                      setState(() {
                        if (task == null) {
                          _tasks.insert(0, TaskItem(
                            title: title,
                            description: descriptionController.text.trim(),
                            priority: priority,
                            dueDate: dueDate,
                          ));
                        } else {
                          task.title = title;
                          task.description = descriptionController.text.trim();
                          task.priority = priority;
                          task.dueDate = dueDate;
                        }
                      });
                      Navigator.pop(sheetContext);
                      _showMessage(isEditing ? t.taskUpdated : t.taskSaved);
                    },
                    child: Text(isEditing ? t.saveChanges : t.save, style: const TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    titleController.dispose();
    descriptionController.dispose();
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF77718C)),
      filled: true,
      fillColor: const Color(0xFFF8F7FC),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFEAE8F1))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFF6757D9), width: 1.5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildHomePage(),
      _buildTasksPage(),
      _buildStatisticsPage(),
      _buildProfilePage(),
    ];
    final labels = [t.overview, t.tasks, t.statistics, t.profile];
    final titles = [t.overview, t.taskList, t.statistics, t.profile];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        titleSpacing: 22,
        title: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(color: const Color(0xFFEAE7FF), borderRadius: BorderRadius.circular(14)),
              child: const Icon(Icons.task_alt_rounded, color: Color(0xFF6757D9), size: 26),
            ),
            const SizedBox(width: 11),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.appName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF29263D))),
                Text(titles[_selectedIndex], style: const TextStyle(fontSize: 11, color: Color(0xFF8A8798), fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () => widget.onLanguageChanged(widget.language == AppLanguage.vi ? AppLanguage.en : AppLanguage.vi),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), border: Border.all(color: const Color(0xFFEAE8F1))),
                  child: Row(
                    children: [
                      const Icon(Icons.language_rounded, size: 17, color: Color(0xFF6757D9)),
                      const SizedBox(width: 6),
                      Text(widget.language == AppLanguage.vi ? 'VI' : 'EN', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: IndexedStack(index: _selectedIndex, children: pages),
          ),
        ),
      ),
      floatingActionButton: _selectedIndex == 0 || _selectedIndex == 1
          ? FloatingActionButton.extended(
        onPressed: () => _openTaskForm(),
        backgroundColor: const Color(0xFF6757D9),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: Text(t.addTask, style: const TextStyle(fontWeight: FontWeight.w700)),
      )
          : null,
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFEAE7FF),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.grid_view_rounded), selectedIcon: const Icon(Icons.grid_view_rounded), label: labels[0]),
          NavigationDestination(icon: const Icon(Icons.checklist_rounded), selectedIcon: const Icon(Icons.checklist_rounded), label: labels[1]),
          NavigationDestination(icon: const Icon(Icons.insights_rounded), selectedIcon: const Icon(Icons.insights_rounded), label: labels[2]),
          NavigationDestination(icon: const Icon(Icons.person_outline_rounded), selectedIcon: const Icon(Icons.person_rounded), label: labels[3]),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    final recent = _tasks.take(3).toList();
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_greeting(), style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900, color: Color(0xFF29263D))),
          const SizedBox(height: 5),
          Text(_todayLabel(), style: const TextStyle(color: Color(0xFF898697), fontSize: 13)),
          const SizedBox(height: 22),
          _buildProgressBanner(),
          const SizedBox(height: 24),
          _sectionHeading(t.taskOverview, t.seeAll, () => setState(() => _selectedIndex = 2)),
          const SizedBox(height: 13),
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 520;
              final cards = [
                _summaryCard(t.totalTasks, _tasks.length.toString(), Icons.assignment_rounded, const Color(0xFF6757D9), const Color(0xFFECE9FF)),
                _summaryCard(t.inProgress, _pendingCount.toString(), Icons.timelapse_rounded, const Color(0xFFE29B35), const Color(0xFFFFF3DF)),
                _summaryCard(t.completed, _completedCount.toString(), Icons.check_circle_rounded, const Color(0xFF299D78), const Color(0xFFE3F6EF)),
                _summaryCard(t.pending, _pendingCount.toString(), Icons.pending_actions_rounded, const Color(0xFFE16A78), const Color(0xFFFFE9EC)),
              ];
              return GridView.count(
                crossAxisCount: compact ? 2 : 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: compact ? 1.55 : 1.38,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: cards,
              );
            },
          ),
          const SizedBox(height: 25),
          _sectionHeading(t.recentTasks, t.seeAll, () => setState(() => _selectedIndex = 1)),
          const SizedBox(height: 12),
          if (recent.isEmpty)
            _emptyState(t.noTasks)
          else
            ...recent.map(_taskCard),
        ],
      ),
    );
  }

  Widget _buildProgressBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF5E50CC), Color(0xFF8878EF)]),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: const Color(0xFF6757D9).withValues(alpha: 0.20), blurRadius: 22, offset: const Offset(0, 10))],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 430;
          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t.progress, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text('${(_completionRate * 100).round()}%', style: const TextStyle(color: Colors.white, fontSize: 39, fontWeight: FontWeight.w900, height: 1.1)),
              const SizedBox(height: 7),
              Text('$_completedCount/${_tasks.length} ${t.completedOf}', style: const TextStyle(color: Colors.white, fontSize: 13)),
              const SizedBox(height: 17),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(value: _completionRate, minHeight: 9, backgroundColor: Colors.white24, color: Colors.white),
              ),
            ],
          );
          final ring = SizedBox(
            width: compact ? 78 : 104,
            height: compact ? 78 : 104,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(value: _completionRate, strokeWidth: 8, backgroundColor: Colors.white24, color: Colors.white),
                Center(child: Icon(Icons.auto_awesome_rounded, color: Colors.white.withValues(alpha: 0.95), size: compact ? 27 : 34)),
              ],
            ),
          );
          if (compact) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(t.progress, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)), ring]), const SizedBox(height: 8), Text('${(_completionRate * 100).round()}%', style: const TextStyle(color: Colors.white, fontSize: 39, fontWeight: FontWeight.w900, height: 1.1)), Text('$_completedCount/${_tasks.length} ${t.completedOf}', style: const TextStyle(color: Colors.white, fontSize: 13)), const SizedBox(height: 17), ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: _completionRate, minHeight: 9, backgroundColor: Colors.white24, color: Colors.white))]);
          }
          return Row(children: [Expanded(child: content), const SizedBox(width: 28), ring]);
        },
      ),
    );
  }

  Widget _sectionHeading(String title, String action, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF302D43))),
        TextButton(onPressed: onTap, child: Text(action)),
      ],
    );
  }

  Widget _summaryCard(String title, String value, IconData icon, Color color, Color background) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(19), border: Border.all(color: const Color(0xFFF0EEF5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Container(width: 36, height: 36, decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: color, size: 19)), const Spacer(), Text(value, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w900, color: Color(0xFF302D43)))]),
          Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF858194), fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildTasksPage() {
    final visible = _visibleTasks;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t.taskList, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Color(0xFF29263D))),
            const SizedBox(height: 5),
            Text('${_tasks.length} ${t.totalTasks.toLowerCase()}', style: const TextStyle(color: Color(0xFF898697), fontSize: 13)),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: t.searchHint,
              prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF817B96)),
              suffixIcon: _searchController.text.isEmpty ? null : IconButton(onPressed: () { _searchController.clear(); setState(() {}); }, icon: const Icon(Icons.close_rounded)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFFEDEAF4))),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Color(0xFF6757D9))),
            ),
          ),
        ),
        const SizedBox(height: 13),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            _filterChip('all', t.all),
            _filterChip('pending', t.ongoing),
            _filterChip('completed', t.done),
          ]),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: visible.isEmpty
              ? _emptyState(t.noResults)
              : ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
            itemCount: visible.length,
            itemBuilder: (context, index) => _taskCard(visible[index]),
          ),
        ),
      ],
    );
  }

  Widget _filterChip(String key, String label) {
    final selected = _statusFilter == key;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        showCheckmark: false,
        labelStyle: TextStyle(color: selected ? Colors.white : const Color(0xFF696579), fontWeight: FontWeight.w700, fontSize: 12),
        selectedColor: const Color(0xFF6757D9),
        backgroundColor: Colors.white,
        side: BorderSide(color: selected ? const Color(0xFF6757D9) : const Color(0xFFE9E6F1)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        onSelected: (_) => setState(() => _statusFilter = key),
      ),
    );
  }

  Widget _taskCard(TaskItem task) {
    final priorityColor = _priorityColor(task.priority);
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFF0EEF5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Checkbox(
              value: task.isCompleted,
              activeColor: const Color(0xFF6757D9),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              onChanged: (value) { if (value != null) _toggleTask(task, value); },
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(task.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: task.isCompleted ? const Color(0xFF9995A5) : const Color(0xFF302D43), decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
                if (task.description.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(task.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF8D899B), fontSize: 12, height: 1.35)),
                ],
                const SizedBox(height: 10),
                Wrap(spacing: 8, runSpacing: 6, crossAxisAlignment: WrapCrossAlignment.center, children: [
                  _smallTag(Icons.calendar_today_outlined, _formatDate(task.dueDate), const Color(0xFF817B96), const Color(0xFFF4F2F8)),
                  _smallTag(Icons.flag_outlined, _priorityLabel(task.priority), priorityColor, priorityColor.withValues(alpha: 0.10)),
                  if (task.isCompleted) _smallTag(Icons.check_circle_outline, t.done, const Color(0xFF299D78), const Color(0xFFE6F6EF)),
                ]),
              ]),
            ),
          ),
          PopupMenuButton<String>(
            tooltip: t.editTask,
            icon: const Icon(Icons.more_horiz_rounded, color: Color(0xFF898697)),
            onSelected: (value) {
              if (value == 'edit') _openTaskForm(task: task);
              if (value == 'delete') _deleteTask(task);
              if (value == 'toggle') _toggleTask(task, !task.isCompleted);
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'edit', child: ListTile(dense: true, contentPadding: EdgeInsets.zero, leading: const Icon(Icons.edit_outlined), title: Text(t.editTask))),
              PopupMenuItem(value: 'toggle', child: ListTile(dense: true, contentPadding: EdgeInsets.zero, leading: const Icon(Icons.check_circle_outline), title: Text(task.isCompleted ? t.markPending : t.markCompleted))),
              PopupMenuItem(value: 'delete', child: ListTile(dense: true, contentPadding: EdgeInsets.zero, leading: const Icon(Icons.delete_outline, color: Color(0xFFD94D5C)), title: Text(t.delete, style: const TextStyle(color: Color(0xFFD94D5C))))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _smallTag(IconData icon, String label, Color color, Color background) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 11, color: color), const SizedBox(width: 5), Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700))]),
    );
  }

  Widget _buildStatisticsPage() {
    final high = _tasks.where((task) => task.priority == 'high').length;
    final medium = _tasks.where((task) => task.priority == 'medium').length;
    final low = _tasks.where((task) => task.priority == 'low').length;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 35),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(t.statistics, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Color(0xFF29263D))),
        const SizedBox(height: 6),
        Text(t.progress, style: const TextStyle(color: Color(0xFF898697), fontSize: 13)),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22), border: Border.all(color: const Color(0xFFF0EEF5))),
          child: Column(children: [
            Text(t.progress, style: const TextStyle(fontSize: 15, color: Color(0xFF777287), fontWeight: FontWeight.w700)),
            const SizedBox(height: 22),
            SizedBox(width: 170, height: 170, child: Stack(fit: StackFit.expand, children: [
              CircularProgressIndicator(value: _completionRate, strokeWidth: 15, strokeCap: StrokeCap.round, backgroundColor: const Color(0xFFF0EEF6), color: const Color(0xFF6757D9)),
              Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Text('${(_completionRate * 100).round()}%', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF302D43))), Text(t.completed, style: const TextStyle(fontSize: 12, color: Color(0xFF898697)))])),
            ])),
            const SizedBox(height: 19),
            Text('$_completedCount / ${_tasks.length} ${t.completedOf}', style: const TextStyle(color: Color(0xFF777287), fontWeight: FontWeight.w600)),
          ]),
        ),
        const SizedBox(height: 15),
        LayoutBuilder(builder: (context, constraints) {
          final compact = constraints.maxWidth < 500;
          return GridView.count(
            crossAxisCount: compact ? 2 : 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.8,
            children: [
              _summaryCard(t.totalTasks, _tasks.length.toString(), Icons.assignment_rounded, const Color(0xFF6757D9), const Color(0xFFECE9FF)),
              _summaryCard(t.completed, _completedCount.toString(), Icons.check_circle_rounded, const Color(0xFF299D78), const Color(0xFFE3F6EF)),
              _summaryCard(t.pending, _pendingCount.toString(), Icons.pending_actions_rounded, const Color(0xFFE29B35), const Color(0xFFFFF3DF)),
            ],
          );
        }),
        const SizedBox(height: 24),
        Text(t.priorityBreakdown, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF302D43))),
        const SizedBox(height: 12),
        _priorityRow(t.highPriority, high, _tasks.length, const Color(0xFFE45B68)),
        _priorityRow(t.mediumPriority, medium, _tasks.length, const Color(0xFFE59A35)),
        _priorityRow(t.lowPriority, low, _tasks.length, const Color(0xFF299D78)),
      ]),
    );
  }

  Widget _priorityRow(String label, int count, int total, Color color) {
    final ratio = total == 0 ? 0.0 : count / total;
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFF0EEF5))),
      child: Column(children: [
        Row(children: [Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF555166), fontSize: 13))), Text('$count', style: TextStyle(fontWeight: FontWeight.w900, color: color))]),
        const SizedBox(height: 10),
        ClipRRect(borderRadius: BorderRadius.circular(12), child: LinearProgressIndicator(value: ratio, minHeight: 7, backgroundColor: const Color(0xFFF0EEF6), color: color)),
      ]),
    );
  }

  Widget _buildProfilePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 35),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(t.profile, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Color(0xFF29263D))),
        const SizedBox(height: 6),
        Text(t.personalPageNote, style: const TextStyle(color: Color(0xFF898697), fontSize: 13)),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF5E50CC), Color(0xFF8878EF)]), borderRadius: BorderRadius.circular(22)),
          child: Column(children: [
            Container(width: 76, height: 76, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.18), shape: BoxShape.circle, border: Border.all(color: Colors.white54)), child: const Icon(Icons.person_rounded, color: Colors.white, size: 42)),
            const SizedBox(height: 12),
            Text(
              _fullName.isEmpty ? t.personalInfo : _fullName,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5),
            Text(
              _studentId.isEmpty ? t.appVersion : 'MSSV: $_studentId',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ]),
        ),
        const SizedBox(height: 18),
        _infoCard(
          title: t.personalInfo,
          children: [
            _infoRow(Icons.person_outline_rounded, t.fullName, _fullName.isEmpty ? t.notUpdated : _fullName),
            const Divider(height: 22, color: Color(0xFFF0EEF5)),
            _infoRow(Icons.badge_outlined, t.studentId, _studentId.isEmpty ? t.notUpdated : _studentId),
            const Divider(height: 22, color: Color(0xFFF0EEF5)),
            _infoRow(Icons.school_outlined, t.course, t.isEnglish ? 'Mobile Application Programming' : 'Lập trình thiết bị di động'),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _editPersonalInfo,
                icon: const Icon(Icons.edit_outlined),
                label: Text(t.editPersonalInfo),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _infoCard(
          title: t.projectInfo,
          children: [
            _infoRow(Icons.task_alt_rounded, t.projectName, 'Personal Task Manager'),
            const Divider(height: 22, color: Color(0xFFF0EEF5)),
            _infoRow(Icons.code_rounded, t.technology, 'Flutter • Dart • Android Studio'),
            const Divider(height: 22, color: Color(0xFFF0EEF5)),
            Text(t.projectDescription, style: const TextStyle(color: Color(0xFF777287), fontSize: 13, height: 1.5)),
          ],
        ),
        const SizedBox(height: 14),
        _infoCard(
          title: t.languageLabel,
          children: [
            Text(t.languageNote, style: const TextStyle(color: Color(0xFF898697), fontSize: 12, height: 1.4)),
            const SizedBox(height: 13),
            SegmentedButton<AppLanguage>(
              segments: [
                ButtonSegment(value: AppLanguage.vi, label: Text(t.vietnamese), icon: const Icon(Icons.translate_rounded)),
                ButtonSegment(value: AppLanguage.en, label: Text(t.english), icon: const Icon(Icons.language_rounded)),
              ],
              selected: {widget.language},
              onSelectionChanged: (selection) {
                if (selection.isNotEmpty) widget.onLanguageChanged(selection.first);
              },
            ),
          ],
        ),
      ]),
    );
  }

  Widget _infoCard({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(19), border: Border.all(color: const Color(0xFFF0EEF5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF302D43), fontSize: 15)),
        const SizedBox(height: 15),
        ...children,
      ]),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(width: 34, height: 34, decoration: BoxDecoration(color: const Color(0xFFF0EEFF), borderRadius: BorderRadius.circular(11)), child: Icon(icon, size: 18, color: const Color(0xFF6757D9))),
      const SizedBox(width: 11),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF9894A4))), const SizedBox(height: 3), Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF464255)))])),
    ]);
  }

  Widget _emptyState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 72, height: 72, decoration: const BoxDecoration(color: Color(0xFFEDEAFF), shape: BoxShape.circle), child: const Icon(Icons.inbox_outlined, color: Color(0xFF6757D9), size: 34)),
          const SizedBox(height: 14),
          Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF858194), fontWeight: FontWeight.w600)),
        ]),
      ),
    );
  }
}
