import Flutter
import TryKMP
import UIKit

public class TryFlutterPlugin: NSObject, FlutterPlugin, TryKmpHostApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        TryKmpHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: TryFlutterPlugin())
    }
    
    
    private let model = TryKmp()
    
    
    func searchGitHubRepo(query: String, completion: @escaping (Result<GitHubRepoDto, Error>) -> Void){
        model.searchGitHubRepo(query: query) { result, error in
            if let result = result {
                let mapped = GitHubRepoDto(
                    totalCount: Int64(result.totalCount),
                    incompleteResults: result.incompleteResults,
                    items: result.items.map {
                        GitHubRepoItemDto(
                            fullName: $0.fullName,
                            description: $0.description,
                            url: $0.url,
                            updatedAt: $0.updatedAt.ISO8601Format(),
                            language: $0.language
                        )
                    }
                )
                completion(.success(mapped))
            }
            completion(.failure(error ?? PigeonError(code: "", message: nil, details: nil)))
        }
    }
    
    func time() throws -> String {
        return model.time(suffix: "")
    }
}
