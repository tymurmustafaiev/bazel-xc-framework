import Foundation
@_implementationOnly import InteractorSDK

public final class Performer {
    private let interactor: Interactor

    public init() {
        interactor = Interactor()
    }

    public func read() {
        interactor.read()
    }

    public func write(text: String) {
        interactor.write(text: text)
    }
}
