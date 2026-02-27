import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/bridges/trykmp.g.dart',
    dartPackageName: 'trykmp',
    kotlinOptions: KotlinOptions(
      package: 'io.github.tshion.try_flutter_plugin.bridges',
    ),
    kotlinOut:
        'android/src/main/kotlin/io/github/tshion/try_flutter_plugin/bridges/TryKmp.g.kt',
    swiftOut:
        'ios/try_flutter_plugin/Sources/try_flutter_plugin/Bridges/TryKmp.g.swift',
  ),
)
@HostApi()
abstract class TryKmpHostApi {
  String time();

  @async
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
