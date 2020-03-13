

import UIKit

class BZCollectionView: UICollectionView {
    
    init(frame: CGRect = .zero, scrollDirection: UICollectionView.ScrollDirection = .horizontal ,collectionViewLayout layout: UICollectionViewLayout = UICollectionViewFlowLayout()) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.scrollDirection = scrollDirection
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
