//
// Created by Timur Mustafaev on 01/08/2023.
//

import Foundation
import UIKit

public final class AssetProviderService {
    public init() {}

    public func getNatureImage1() -> UIImage? {
        guard let image = UIImage(named: "nature1") else {
            print("Image nature1 not found")
            return nil
        }

        return image
    }

    public func getNatureImage2() -> UIImage? {
        guard let image = UIImage(named: "nature2") else {
            print("Image nature2 not found")
            return nil
        }

        return image
    }
}