
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Task Manager hiển thị trang chủ',
          (WidgetTester tester) async {
        await tester.pumpWidget(const TaskManagerApp());

        await tester.pumpAndSettle();

        expect(find.text('Task Manager'), findsOneWidget);
        expect(find.text('Tổng quan công việc'), findsOneWidget);
      });
}
