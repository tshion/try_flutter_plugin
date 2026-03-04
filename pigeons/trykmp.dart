import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/trykmp.g.dart',
    dartPackageName: 'trykmp',
    kotlinOptions: KotlinOptions(
      package: 'io.github.tshion.try_flutter_plugin',
    ),
    kotlinOut:
        'android/src/main/kotlin/io/github/tshion/try_flutter_plugin/TryKmp.g.kt',
    swiftOut:
        'ios/try_flutter_plugin/Sources/try_flutter_plugin/TryKmp.g.swift',
  ),
)
@HostApi()
abstract class TryKmpHostApi {
  String time();

  @async
  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  GitHubRepoDto searchGitHubRepo(String query);
}

class GitHubRepoDto {
  const GitHubRepoDto({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<GitHubRepoItemDto> items;
}

class GitHubRepoItemDto {
  const GitHubRepoItemDto({
    required this.fullName,
    this.description,
    required this.url,
    required this.updatedAt,
    this.language,
  });

  final String fullName;
  final String? description;
  final String url;
  final String updatedAt;
  final String? language;
}
