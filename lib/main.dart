import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskItem {
  String title;
  String description;
  String priority;
  DateTime date;
  bool isCompleted;

  TaskItem({
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
    this.isCompleted = false,
  });
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6258E8),
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;
  String filter = 'Tất cả';
  final TextEditingController searchController = TextEditingController();

  final List<TaskItem> tasks = [
    TaskItem(
      title: 'Hoàn thành bài tập Flutter',
      description: 'Thiết kế giao diện ứng dụng quản lý công việc',
      priority: 'Cao',
      date: DateTime.now(),
    ),
    TaskItem(
      title: 'Ôn tập môn lập trình',
      description: 'Ôn lại kiến thức Dart và lập trình hướng đối tượng',
      priority: 'Trung bình',
      date: DateTime.now(),
    ),
    TaskItem(
      title: 'Đọc tài liệu dự án',
      description: 'Tìm hiểu cấu trúc và kiến trúc ứng dụng',
      priority: 'Thấp',
      date: DateTime.now(),
      isCompleted: true,
    ),
  ];

  int get completedTasks => tasks.where((task) => task.isCompleted).length;

  int get pendingTasks => tasks.where((task) => !task.isCompleted).length;

  double get completionRate =>
      tasks.isEmpty ? 0 : completedTasks / tasks.length;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Chào buổi sáng ☀️';
    if (hour < 18) return 'Chào buổi chiều 🌤️';
    return 'Chào buổi tối 🌙';
  }

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String getToday() {
    final now = DateTime.now();
    const weekdays = [
      'Thứ hai',
      'Thứ ba',
      'Thứ tư',
      'Thứ năm',
      'Thứ sáu',
      'Thứ bảy',
      'Chủ nhật',
    ];
    return '${weekdays[now.weekday - 1]}, ${formatDate(now)}';
  }

  void toggleTask(TaskItem task, bool value) {
    setState(() {
      task.isCompleted = value;
    });
  }

  Future<void> deleteTask(TaskItem task) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Xóa công việc?'),
          content: Text('Bạn có chắc muốn xóa "${task.title}" không?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Hủy'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true || !mounted) return;

    setState(() {
      tasks.remove(task);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã xóa công việc')),
    );
  }

  Future<void> showTaskForm({TaskItem? task}) async {
    final titleController = TextEditingController(text: task?.title ?? '');
    final descriptionController =
    TextEditingController(text: task?.description ?? '');

    String priority = task?.priority ?? 'Trung bình';
    DateTime selectedDate = task?.date ?? DateTime.now();
    final isEditing = task != null;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (sheetContext, setSheetState) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                24,
                20,
                MediaQuery.of(sheetContext).viewInsets.bottom + 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEditing ? 'Chỉnh sửa công việc' : 'Thêm công việc mới',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: titleController,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        labelText: 'Tên công việc',
                        prefixIcon: const Icon(Icons.edit_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: descriptionController,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Mô tả công việc',
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(Icons.notes),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    DropdownButtonFormField<String>(
                      initialValue: priority,
                      decoration: InputDecoration(
                        labelText: 'Mức độ ưu tiên',
                        prefixIcon: const Icon(Icons.flag_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: const ['Cao', 'Trung bình', 'Thấp']
                          .map(
                            (value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setSheetState(() {
                            priority = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: sheetContext,
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            setSheetState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month),
                        label: Text(
                          'Hạn hoàn thành: ${formatDate(selectedDate)}',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF6258E8),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          final title = titleController.text.trim();
                          if (title.isEmpty) {
                            ScaffoldMessenger.of(sheetContext).showSnackBar(
                              const SnackBar(
                                content: Text('Vui lòng nhập tên công việc'),
                              ),
                            );
                            return;
                          }

                          setState(() {
                            if (task == null) {
                              tasks.insert(
                                0,
                                TaskItem(
                                  title: title,
                                  description: descriptionController.text.trim(),
                                  priority: priority,
                                  date: selectedDate,
                                ),
                              );
                            } else {
                              task.title = title;
                              task.description =
                                  descriptionController.text.trim();
                              task.priority = priority;
                              task.date = selectedDate;
                            }
                          });

                          Navigator.pop(sheetContext);
                        },
                        child: Text(isEditing ? 'Lưu thay đổi' : 'Lưu công việc'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    titleController.dispose();
    descriptionController.dispose();
  }

  List<TaskItem> get filteredTasks {
    final keyword = searchController.text.trim().toLowerCase();

    return tasks.where((task) {
      final matchesSearch = task.title.toLowerCase().contains(keyword) ||
          task.description.toLowerCase().contains(keyword);

      final matchesFilter = switch (filter) {
        'Đang làm' => !task.isCompleted,
        'Hoàn thành' => task.isCompleted,
        _ => true,
      };

      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6FA),
        title: const Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Color(0xFF6258E8),
              size: 30,
            ),
            SizedBox(width: 9),
            Text(
              'Task Manager',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Chức năng thông báo sẽ được bổ sung sau'),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
          buildHome(),
          buildTaskPage(),
          buildStatistics(),
        ],
      ),
      floatingActionButton: selectedTab == 2
          ? null
          : FloatingActionButton(
        onPressed: () => showTaskForm(),
        backgroundColor: const Color(0xFF6258E8),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE9E7FF),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            selectedIcon: Icon(Icons.checklist),
            label: 'Công việc',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Thống kê',
          ),
        ],
      ),
    );
  }

  Widget buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getGreeting(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            getToday(),
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 22),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6258E8), Color(0xFF9585F5)],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tiến độ công việc',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                const SizedBox(height: 12),
                Text(
                  '${(completionRate * 100).toInt()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: completionRate,
                    minHeight: 10,
                    backgroundColor: Colors.white30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$completedTasks/${tasks.length} công việc đã hoàn thành',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Tổng quan công việc',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: buildSummaryCard(
                  'Tổng công việc',
                  tasks.length.toString(),
                  Icons.assignment_outlined,
                  const Color(0xFF6258E8),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: buildSummaryCard(
                  'Đang thực hiện',
                  pendingTasks.toString(),
                  Icons.pending_actions,
                  Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: buildSummaryCard(
                  'Hoàn thành',
                  completedTasks.toString(),
                  Icons.task_alt,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: buildSummaryCard(
                  'Chưa hoàn thành',
                  pendingTasks.toString(),
                  Icons.access_time,
                  Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Công việc gần đây',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedTab = 1;
                  });
                },
                child: const Text('Xem tất cả'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (tasks.isEmpty)
            const Center(child: Text('Chưa có công việc nào'))
          else
            ...tasks.take(3).map(buildTaskCard),
        ],
      ),
    );
  }

  Widget buildSummaryCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget buildTaskPage() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Danh sách công việc',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Tìm kiếm công việc...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: searchController.text.isEmpty
                  ? null
                  : IconButton(
                onPressed: () {
                  searchController.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.close),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['Tất cả', 'Đang làm', 'Hoàn thành'].map((item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(item),
                    selected: filter == item,
                    onSelected: (_) {
                      setState(() {
                        filter = item;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: filteredTasks.isEmpty
              ? const Center(child: Text('Không tìm thấy công việc'))
              : ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 90),
            itemCount: filteredTasks.length,
            itemBuilder: (context, index) {
              return buildTaskCard(filteredTasks[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget buildTaskCard(TaskItem task) {
    Color priorityColor;

    switch (task.priority) {
      case 'Cao':
        priorityColor = Colors.red;
        break;
      case 'Trung bình':
        priorityColor = Colors.orange;
        break;
      default:
        priorityColor = Colors.green;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Checkbox(
            value: task.isCompleted,
            activeColor: const Color(0xFF6258E8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onChanged: (value) {
              if (value != null) toggleTask(task, value);
            },
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                    color: task.isCompleted ? Colors.grey : Colors.black87,
                  ),
                ),
                if (task.description.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    task.description,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 13,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          formatDate(task.date),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: priorityColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        task.priority,
                        style: TextStyle(
                          color: priorityColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: 'Sửa công việc',
                visualDensity: VisualDensity.compact,
                onPressed: () => showTaskForm(task: task),
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Color(0xFF6258E8),
                ),
              ),
              IconButton(
                tooltip: 'Xóa công việc',
                visualDensity: VisualDensity.compact,
                onPressed: () => deleteTask(task),
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStatistics() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thống kê công việc',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 22),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Tỷ lệ hoàn thành',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: completionRate,
                        strokeWidth: 13,
                        backgroundColor: Colors.grey.shade200,
                        color: const Color(0xFF6258E8),
                      ),
                      Center(
                        child: Text(
                          '${(completionRate * 100).toInt()}%',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Text('$completedTasks trên ${tasks.length} công việc'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: buildSummaryCard(
                  'Tổng công việc',
                  tasks.length.toString(),
                  Icons.assignment_outlined,
                  const Color(0xFF6258E8),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: buildSummaryCard(
                  'Đã hoàn thành',
                  completedTasks.toString(),
                  Icons.check_circle_outline,
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          buildSummaryCard(
            'Đang thực hiện',
            pendingTasks.toString(),
            Icons.pending_actions,
            Colors.orange,
          ),
        ],
      ),
    );
  }
}
