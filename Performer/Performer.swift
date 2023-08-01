import Foundation
import UIKit
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

    public func log(text: String) {
        interactor.log(text: text)
    }

    public func getNatureImage1() -> UIImage? {
        interactor.getNatureImage1()
    }

    public func getNatureImage2() -> UIImage? {
        interactor.getNatureImage2()
    }
}
