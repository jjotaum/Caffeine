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

/// A ´ViewModel´ which can be delegated to handle ´ChildViewModel´ actions.
public protocol ParentViewModel: Caffeine.ViewModel {
    associatedtype ChildAction
    func handle(childAction: ChildAction) async
}

/// A ´ViewModel´ that can delegate its actions to a ´ParentViewModel´.
public protocol ChildViewModel<Parent>: ViewModel where Parent: ParentViewModel, Parent.ChildAction == Self.Action {
    associatedtype Parent
    var parent: Parent { get set }
}

public extension ParentViewModel {
    func handle(childAction: ChildAction) {
        Task {
            await handle(childAction: childAction)
        }
    }
}

