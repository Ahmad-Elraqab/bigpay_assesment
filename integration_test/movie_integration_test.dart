import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bigpay_assessment/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('MoviesView integration test', () {
    testWidgets('Displays the title', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final titleFinder = find.byKey(const Key('movie_poster'));

      expect(find.text('Popular Movies'), findsOneWidget);
      Future.delayed(const Duration(seconds: 2),
          () => {expect(titleFinder, findsAtLeastNWidgets(5))});
    });

    testWidgets('Refreshes the movie collection', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final refreshIndicatorFinder =
          find.byKey(const Key('movies_refresh_indicator'));

      expect(refreshIndicatorFinder, findsOneWidget);

      // Trigger a pull-to-refresh action.
      await tester.drag(refreshIndicatorFinder, const Offset(0.0, 300.0));
      await tester.pumpAndSettle();

      // Verify that the movie collection is refreshed.
      final moviesFinder = find.byKey(const Key('movie_poster'));
      expect(moviesFinder, findsAtLeastNWidgets(5));
    });

    testWidgets('Load More to the movie collection',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final refreshIndicatorFinder =
          find.byKey(const Key('movies_refresh_indicator'));

      expect(refreshIndicatorFinder, findsOneWidget);

      // Trigger a pull-to-refresh action.
      for (var i = 0; i < 5; i++) {
        await tester.drag(refreshIndicatorFinder, const Offset(0.0, -1000.0));
        await tester.pumpAndSettle();
      }

      // Verify that the movie collection is extended by checking title of movie in page 2.
      final moviesFinder = find.byKey(const Key('Murder Mystery 2'));

      await expectLater(moviesFinder, findsOneWidget);
    });
  });
}
