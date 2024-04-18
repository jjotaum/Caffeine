//
//  AlertStateModifier.swift
//  Caffeine
//
//  Created by Jota Uribe on 1/03/24.
//

import SwiftUI

protocol AlertState: Identifiable {
    var id: String { get }
    var confirmationTitle: String { get }
}

public struct ErrorAlertState<Error: LocalizedError>: AlertState {
    public var id: String { "\(error.localizedDescription)" }
    let error: Error
    let confirmationTitle: String
    
    public init(error: Error, confirmationTitle: String = "OK") {
        self.error = error
        self.confirmationTitle = confirmationTitle
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
@available(tvOS 15.0, *)
@available(watchOS 8.0, *)
public struct LocalizedAlertState: AlertState {
    public var id: String { "\(title))" }
    let title: LocalizedStringKey
    let cancelationRole: ButtonRole?
    let cancelationTitle: String
    let cancelationBlock: (() -> Void)?
    let confirmationRole: ButtonRole?
    let confirmationTitle: String
    let confirmationBlock: (() -> Void)?
    
    public init(
        title: LocalizedStringKey,
        cancelationRole: ButtonRole? = nil,
        cancelationTitle: String = "Cancel",
        cancelationBlock: (() -> Void)? = nil,
        confirmationRole: ButtonRole? = nil,
        confirmationTitle: String = "Confirm",
        confirmationBlock: (() -> Void)? = nil
    ) {
        self.title = title
        self.cancelationRole = cancelationRole
        self.cancelationTitle = cancelationTitle
        self.cancelationBlock = cancelationBlock
        self.confirmationRole = confirmationRole
        self.confirmationTitle = confirmationTitle
        self.confirmationBlock = confirmationBlock
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
@available(tvOS 15.0, *)
@available(watchOS 8.0, *)
struct LocalizedAlertStateModifier: ViewModifier {
    @Binding var state: LocalizedAlertState?
    func body(content: Content) -> some View {
        content.alert(state?.title ?? "", isPresented: .init(get: { state != nil }, set: { _ in  })) {
            Button(role: state?.cancelationRole ?? .cancel, action: {
                state?.cancelationBlock?()
                state = nil
            } , label: { Text(state?.cancelationTitle ?? .empty) })
            Button(role: state?.confirmationRole, action: {
                state?.confirmationBlock?()
                state = nil
            } , label: { Text(state?.confirmationTitle ?? .empty) })
        }
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
@available(tvOS 15.0, *)
@available(watchOS 8.0, *)
struct ErrorAlertStateModifier<Error: LocalizedError>: ViewModifier {
    @Binding var state: ErrorAlertState<Error>?
    
    func body(content: Content) -> some View {
        content.alert(isPresented: .init(get: { state != nil }, set: { _ in }), error: state?.error) {
            Button(role: .cancel, action: { state = nil } , label: { Text(state?.confirmationTitle ?? .empty) })
        }
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
@available(tvOS 15.0, *)
@available(watchOS 8.0, *)
public extension View {
    func localizedAlert(for state: Binding<LocalizedAlertState?>) -> some View {
        modifier(LocalizedAlertStateModifier(state: state))
    }
    
    func errorAlert<Error: LocalizedError>(for state: Binding<ErrorAlertState<Error>?>) -> some View {
        modifier(ErrorAlertStateModifier(state: state))
    }
}

