import UIKit

import UIKit

extension UIView {
    public func parentViewOfType<T>(type: T.Type) -> T? where T : UIView {
        var view = self.superview
        
        while (view != nil && !(view is T)) {
            view = view!.superview
        }
        
        if let view = view as? T {
            return view
        }
        
        return nil
    }
    
    public func parentTableViewCell () -> UITableViewCell? {
        return parentViewOfType(type: UITableViewCell.self)
    }
    
    public func parentCollectionViewCell () -> UICollectionViewCell? {
        return parentViewOfType(type: UICollectionViewCell.self)
    }
    
    public func snapshotImage() -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        if (self.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:)))){
            self.drawHierarchy(in: bounds, afterScreenUpdates: false)
        }else{
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
        }
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImage
    }
    
    /**
        Apply shadow with sketch like properties
        When using a non-zero spread, it hardcodes a path based on the bounds of the CALayer. 
        If the layer's bounds ever change, you'd want to call the applySketchShadow() method again.
        https://stackoverflow.com/a/48489506/5222077
    **/
    func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
