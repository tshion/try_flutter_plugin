package io.github.tshion.try_flutter_plugin

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.github.tshion.trykmp.TryKmp
import kotlinx.coroutines.runBlocking

/** TryFlutterPlugin */
class TryFlutterPlugin : FlutterPlugin, TryKmpHostApi {

    private val model by lazy { TryKmp() }


    override fun onAttachedToEngine(binding: FlutterPluginBinding) {
        TryKmpHostApi.setUp(binding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
        TryKmpHostApi.setUp(binding.binaryMessenger, null)
    }


    override fun time(): String {
        return model.time()
    }

    override fun searchGitHubRepo(
        query: String,
        callback: (Result<GitHubRepoDto>) -> Unit,
    ) {
        runBlocking {
            try {
                val result = model.searchGitHubRepo(query)
                result.let { native ->
                    GitHubRepoDto(
                        native.totalCount.toLong(),
                        native.incompleteResults,
                        native.items.map {
                            GitHubRepoItemDto(
                                it.fullName,
                                it.description,
                                it.url,
                                it.updatedAt.toString(),
                                it.language,
                            )
                        },
                    )
                }.also { callback(Result.success(it)) }
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}
