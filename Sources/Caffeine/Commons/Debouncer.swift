//
//  Debouncer.swift
//  Caffeine
//
//  Created by Jota Uribe on 18/07/26.
//

import Foundation

/// Executes asynchronous work using debounce semantics.
///
/// Successive calls within the configured delay cancel the previous pending
/// execution. Optionally supports leading-edge execution while always
/// performing a trailing-edge invocation.
public final class Debouncer {
    private let delay: Duration
    private var trailingTask: Task<Void, Never>?
    private var hasExecutedLeading = false

    public init(delay: Duration) {
        self.delay = delay
    }

    public func schedule(isLeading: Bool = false, priority: TaskPriority? = nil, action: @escaping @Sendable () async -> Void) {
        // Cancel any pending trailing execution.
        trailingTask?.cancel()

        // Execute on the leading edge once per debounce window.
        if isLeading && !hasExecutedLeading {
            hasExecutedLeading = true

            Task(priority: priority) {
                await action()
            }
        }

        // Schedule trailing execution.
        trailingTask = Task(priority: priority) {
            try? await Task.sleep(for: delay)

            guard !Task.isCancelled else { return }

            hasExecutedLeading = false
            await action()
        }
    }

    deinit {
        trailingTask?.cancel()
    }
}
