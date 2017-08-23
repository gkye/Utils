import UIKit

extension UIImage {
    public func resize (size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let imageResized = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return imageResized!
    }
}
