import Foundation
import Reader
import Writer

public final class Interactor {
    private let reader: ReaderService
    private let writer: WriterService

    public init() {
        reader = ReaderService()
        writer = WriterService()
    }

    public func read() {
        reader.read()
    }

    public func write(text: String) {
        writer.write(text: text)
    }
}
