import Foundation
import Reader
import Writer
import AssetProvider

public final class Interactor {
    private let reader: ReaderService
    private let writer: WriterService
    private let logger: LoggerService
    private let assetProvider: AssetProviderService

    public init() {
        reader = ReaderService()
        writer = WriterService()
        logger = LoggerService()
        assetProvider = AssetProviderService()
    }

    public func read() {
        reader.read()
    }

    public func write(text: String) {
        writer.write(text: text)
    }

    public func log(text: String) {
        logger.log(withText: text)
    }

    public func getNatureImage1() -> UIImage? {
        assetProvider.getNatureImage1()
    }

    public func getNatureImage2() -> UIImage? {
        assetProvider.getNatureImage2()
    }
}
