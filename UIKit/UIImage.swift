//
//  UIImage.swift
//  Athena
//
//  Created by George Kye on 2017-09-09.
//  Copyright © 2017 George Kye. All rights reserved.
//

import Foundation
import UIKit

enum ImageSize {

	case small
	case medium
	case large
	case custom(width: CGFloat, height: CGFloat)

	func getSize() -> CGSize{
		switch self {
		case .small:
			return CGSize(width: 150, height: 150)
		case .medium:
			return CGSize(width: 250, height: 250)
		case .large:
			return CGSize(width: 400, height: 400)
		case .custom(let width, let height):
			return CGSize(width: width, height: height)
		}
	}
	
}

extension UIImage {

	func resize(size: ImageSize = .medium) -> UIImage {
		let imgSize = size.getSize()
		UIGraphicsBeginImageContextWithOptions(imgSize, false, 1.0)
		draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: imgSize))
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		return resizedImage!
	}
}
