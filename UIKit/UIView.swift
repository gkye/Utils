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
}
