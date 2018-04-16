import UIKit

// swiftlint:disable extension_access_modifier
extension UIView {
  public class func fromNib() -> Self {
    return fromNib(nibName: nil)
  }

  public class func fromNib(nibName: String?) -> Self {
    func fromNibHelper<T>(nibName: String?) -> T where T : UIView {
      let bundle = Bundle(for: T.self)
      let name = nibName ?? String(describing: T.self)
      return bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T ?? T()
    }
    return fromNibHelper(nibName: nibName)
  }
}

extension UICollectionViewCell {
  static func registerNib(in collectionView: UICollectionView){
    let nib = UINib(nibName: toString(), bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: toString())
  }

  static func toString() -> String {
    return String(describing: self.self)
  }
}

extension UITableViewCell {
  static func registerNib(in tableView: UITableView){
    let nib = UINib(nibName: toString(), bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: toString())
  }

  static func toString() -> String {
    return String(describing: self.self)
  }
}
