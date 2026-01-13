import 'package:divelog2/src/features/data/database_service.dart';
import 'package:divelog2/src/features/data/local/app_database.dart';
import 'package:divelog2/src/features/dives/dive_form_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDatabaseService extends Mock implements DatabaseService {}

class DiveSessionsCompanionFake extends Fake implements DiveSessionsCompanion {}

void main() {
  late MockDatabaseService mockDbService;
  late DiveFormViewModel viewModel;

  setUpAll(() {
    registerFallbackValue(DiveSessionsCompanionFake());
  });

  setUp(() {
    mockDbService = MockDatabaseService();
    viewModel = DiveFormViewModel(mockDbService);
  });

  test('saveDiveSession calls databaseService.createDiveSession', () async {
    when(
      () => mockDbService.createDiveSession(any()),
    ).thenAnswer((_) async => 1);

    await viewModel.saveDiveSession(
      date: DateTime.now(),
      location: 'Test Location',
      maxDepth: 20.0,
      bottomTime: 40,
    );

    verify(() => mockDbService.createDiveSession(any())).called(1);
    expect(viewModel.isLoading, false);
    expect(viewModel.error, null);
  });

  test('saveDiveSession sets error on failure', () async {
    when(
      () => mockDbService.createDiveSession(any()),
    ).thenThrow(Exception('DB Error'));

    try {
      await viewModel.saveDiveSession(
        date: DateTime.now(),
        location: 'Test Location',
        maxDepth: 20.0,
        bottomTime: 40,
      );
    } catch (_) {}

    expect(viewModel.error, contains('DB Error'));
    expect(viewModel.isLoading, false);
  });
}
