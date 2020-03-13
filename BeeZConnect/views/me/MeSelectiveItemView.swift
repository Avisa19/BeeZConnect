

import UIKit

class MeSelectiveItemView: UIView {
    
    fileprivate let ME_ID = "MeID"
    fileprivate var iconImages: [IconImage] = [
        IconImage(image: #imageLiteral(resourceName: "icons8-marker").withRenderingMode(.alwaysTemplate)),
        IconImage(image: #imageLiteral(resourceName: "icons8-event_management_filled").withRenderingMode(.alwaysTemplate)),
        IconImage(image: #imageLiteral(resourceName: "icons8-bookmark_ribbon").withRenderingMode(.alwaysTemplate))
    ]
    var horizentalBarleftConstraint: NSLayoutConstraint?
    var meController: MeController?
    
    lazy var meCollectionView = BZCollectionView()
    
    fileprivate let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        meCollectionView.backgroundColor = #colorLiteral(red: 0.8477998772, green: 0.8583888591, blue: 0.866802117, alpha: 1)
        
        setupUI()
        setupHorizentalBar()
    }
    
    fileprivate func setupUI() {
        addSubview(meCollectionView)
        addSubview(dividerView)
        
        dividerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dividerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        meCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        meCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        meCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        meCollectionView.bottomAnchor.constraint(equalTo: dividerView.topAnchor).isActive = true
        
        meCollectionView.register(MeCollectionCell.self, forCellWithReuseIdentifier: ME_ID)
        meCollectionView.delegate = self
        meCollectionView.dataSource = self
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        meCollectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
    }
    
    
    fileprivate func setupHorizentalBar() {
        let horizentalBar = UIView()
        horizentalBar.backgroundColor = #colorLiteral(red: 0.4269747436, green: 0.2723884881, blue: 0.08990689367, alpha: 1)
        horizentalBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizentalBar)
        
        horizentalBarleftConstraint = horizentalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizentalBarleftConstraint?.isActive = true
        horizentalBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        horizentalBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        horizentalBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MeSelectiveItemView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MeSelectiveSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ME_ID, for: indexPath) as! MeCollectionCell
        let title = MeSelectiveSection(rawValue: indexPath.item)?.description
        cell.title = title
        cell.image = iconImages[indexPath.item].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let x: CGFloat = CGFloat(indexPath.item) * frame.width / 3
//        horizentalBarleftConstraint?.constant = x
//
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.layoutIfNeeded()
//        })
        self.meController?.scrollToMeCollection(indexPath.item)
    }
}

extension MeSelectiveItemView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width * (1/3)
        return .init(width: width, height: collectionView.frame.height)
    }
}
