//
//  ViewModel.swift
//  Caffeine
//
//  Created by Jota Uribe on 26/08/23.
//

import Foundation

/// A protocol describing basic structure of viewModels.
public protocol ViewModel: ObservableObject {
    associatedtype Action
    func handle(_ action: Action)
}

public extension ViewModel {
    func handle(_ action: Action) async {
        Task {
            await handle(action)
        }
    }
}

