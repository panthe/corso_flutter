import 'package:flutter/material.dart';
import 'package:flutter_app_redux/mock_data/user_mock_data.dart';
import 'package:flutter_app_redux/widgets/user_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('UserCard test', (WidgetTester tester) async {

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(MaterialApp(
          home: UserCard(user: userMockData)
        )
      );
    });

    expect(find.text('Ms Louanne Durand'), findsOneWidget); // Full name
    expect(find.widgetWithText(Column, 'Ms Louanne Durand'), findsOneWidget);
    expect(find.widgetWithText(Column, 'female'), findsOneWidget);

    expect(find.byWidgetPredicate((widget) =>
      widget is CircleAvatar && widget.backgroundColor == Colors.pink,
      description: "Check background color"
    ), findsOneWidget);

  });
}
