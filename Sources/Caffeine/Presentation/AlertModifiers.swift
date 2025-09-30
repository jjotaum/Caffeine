//
//  AlertModifiers.swift
//  Caffeine
//
//  Created by Jota Uribe on 1/03/24.
//

import SwiftUI

public protocol AlertModel: Identifiable {
    var id: String { get }
    var primaryActionTitle: LocalizedStringResource { get }
}

public struct ErrorAlertModel<Error: LocalizedError>: AlertModel {
    public var id: String { "\(error.localizedDescription)" }
    let error: Error
    public let primaryActionTitle: LocalizedStringResource
    
    public init(error: Error, primaryActionTitle: LocalizedStringResource) {
        self.error = error
        self.primaryActionTitle = primaryActionTitle
    }
}

public struct InputAlertModel: AlertModel {
    public var id: String { [title, message].compactMap(\.?.key).joined(separator: "_").appending("_\(String(describing: self))") }
    public let title: LocalizedStringResource?
    public let message: LocalizedStringResource?
    public let placeholder: LocalizedStringResource
    public let primaryActionTitle: LocalizedStringResource
    public let secondaryActionTitle: LocalizedStringResource?
    
    let primaryActionRole: ButtonRole?
    let primaryActionBlock: ((String) -> Void)?
    let secondaryActionRole: ButtonRole?
    let secondaryActionBlock: (() -> Void)?
    
    public init(
        title: LocalizedStringResource? = nil,
        message: LocalizedStringResource? = nil,
        placeholder: LocalizedStringResource,
        primaryActionRole: ButtonRole? = nil,
        primaryActionTitle: LocalizedStringResource,
        primaryActionBlock: ((String) -> Void)? = nil,
        secondaryActionRole: ButtonRole? = nil,
        secondaryActionTitle: LocalizedStringResource? = nil,
        secondaryActionBlock: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.placeholder = placeholder
        self.primaryActionRole = primaryActionRole
        self.primaryActionTitle = primaryActionTitle
        self.primaryActionBlock = primaryActionBlock
        self.secondaryActionRole = secondaryActionRole
        self.secondaryActionTitle = secondaryActionTitle
        self.secondaryActionBlock = secondaryActionBlock
    }
}

public struct LocalizedAlertModel: AlertModel {
    public var id: String { [title, message].compactMap(\.?.key).joined(separator: "_").appending("_\(String(describing: self))") }
    public let title: LocalizedStringResource?
    public let message: LocalizedStringResource?
    public let primaryActionTitle: LocalizedStringResource
    public let secondaryActionTitle: LocalizedStringResource?
    
    let primaryActionRole: ButtonRole?
    let primaryActionBlock: (() -> Void)?
    let secondaryActionRole: ButtonRole?
    let secondaryActionBlock: (() -> Void)?
    
    public init(
        title: LocalizedStringResource? = nil,
        message: LocalizedStringResource? = nil,
        primaryActionRole: ButtonRole? = nil,
        primaryActionTitle: LocalizedStringResource,
        primaryActionBlock: (() -> Void)? = nil,
        secondaryActionRole: ButtonRole? = nil,
        secondaryActionTitle: LocalizedStringResource? = nil,
        secondaryActionBlock: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.primaryActionRole = primaryActionRole
        self.primaryActionTitle = primaryActionTitle
        self.primaryActionBlock = primaryActionBlock
        self.secondaryActionRole = secondaryActionRole
        self.secondaryActionTitle = secondaryActionTitle
        self.secondaryActionBlock = secondaryActionBlock
    }
}

struct ErrorAlertModifier<Error: LocalizedError>: ViewModifier {
    @Binding var model: ErrorAlertModel<Error>?
    
    func body(content: Content) -> some View {
        content.alert(isPresented: .init(get: { model != nil }, set: { _ in }), error: model?.error) {
            if let primaryActionTitle = model?.primaryActionTitle {
                Button(primaryActionTitle.key, role: .cancel) { model = nil }
            }
        }
    }
}

struct InputAlertModifier: ViewModifier {
    @Binding var model: InputAlertModel?
    @State var text: String = .empty
    
    func body(content: Content) -> some View {
        content.alert(model?.title ?? "", isPresented: .init(get: { model != nil }, set: { _ in })) {
            TextField(model?.placeholder.key ?? "", text: $text)
            if let secondaryActionTitle = model?.secondaryActionTitle {
                Button(secondaryActionTitle.key, role: model?.secondaryActionRole ?? .cancel) {
                    model?.secondaryActionBlock?()
                    model = nil
                }
            }
            if let primaryActionTitle = model?.primaryActionTitle {
                Button(primaryActionTitle.key, role: model?.primaryActionRole) {
                    model?.primaryActionBlock?(text)
                    model = nil
                }
            }
        } message: {
            if let message = model?.message {
                Text(message)
            }
        }
    }
}

struct LocalizedAlertModifier: ViewModifier {
    @Binding var model: LocalizedAlertModel?
    func body(content: Content) -> some View {
        content.alert(model?.title ?? "", isPresented: .init(get: { model != nil }, set: { _ in  })) {
            if let secondaryActionTitle = model?.secondaryActionTitle {
                Button(secondaryActionTitle.key, role: model?.secondaryActionRole ?? .cancel) {
                    model?.secondaryActionBlock?()
                    model = nil
                }
            }
            if let primaryActionTitle = model?.primaryActionTitle {
                Button(primaryActionTitle.key, role: model?.primaryActionRole) {
                    model?.primaryActionBlock?()
                    model = nil
                }
            }
        } message: {
            if let message = model?.message {
                Text(message)
            }
        }
    }
}

public extension View {
    func localizedAlert(for model: Binding<LocalizedAlertModel?>) -> some View {
        modifier(LocalizedAlertModifier(model: model))
    }
    
    func inputAlert(for model: Binding<InputAlertModel?>) -> some View {
        modifier(InputAlertModifier(model: model))
    }
    
    func errorAlert<Error: LocalizedError>(for model: Binding<ErrorAlertModel<Error>?>) -> some View {
        modifier(ErrorAlertModifier(model: model))
    }
}

