
import UIKit

class MeController: UIViewController {
    
    fileprivate let MECELL_ID = "MeCellId"
    fileprivate let LOCATION_ID = "LocationId"
    fileprivate let FOLLOW_ID = "FollowID"
    fileprivate let SAVED_ID = "SavedID"
    
    fileprivate let meBarButtonView: MeBarItemsView = {
        let view = MeBarItemsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var meSelectiveItemView : MeSelectiveItemView = {
        let view = MeSelectiveItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.meController = self
        return view
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMeBarButtonView()
        navigationController?.navigationBar.isHidden = true
        setupSelectiveItemView()
        setupCollectionView()
        
    }
    
    fileprivate func setupMeBarButtonView() {
        
        view.addSubview(meBarButtonView)
        
        meBarButtonView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        meBarButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        meBarButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        meBarButtonView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
    }
    
    fileprivate func setupSelectiveItemView() {
        view.addSubview(meSelectiveItemView)
        meSelectiveItemView.topAnchor.constraint(equalTo: meBarButtonView.bottomAnchor).isActive = true
        meSelectiveItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        meSelectiveItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        meSelectiveItemView.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    fileprivate func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = #colorLiteral(red: 0.6445900798, green: 0.592133224, blue: 0.488560617, alpha: 1)
        collectionView.topAnchor.constraint(equalTo: meSelectiveItemView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.register(MeFeedCell.self, forCellWithReuseIdentifier: MECELL_ID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: LOCATION_ID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: FOLLOW_ID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: SAVED_ID)
    }
    
    func scrollToMeCollection(_ menuIndex: Int) {
        let selectedIndexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: selectedIndexPath, at: .centeredHorizontally, animated: true)
    }
}

extension MeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MeSelectiveSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MECELL_ID, for: indexPath) as! MeFeedCell
        let section = MeSelectiveSection(rawValue: indexPath.item)
        switch section {
        case .Location:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LOCATION_ID, for: indexPath)
            cell.backgroundColor = #colorLiteral(red: 0.6005938053, green: 0.4504014254, blue: 0.1519396603, alpha: 1)
            return cell
        case .Following:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FOLLOW_ID, for: indexPath)
            cell.backgroundColor = #colorLiteral(red: 0.6597153544, green: 0.6040559411, blue: 0.5004613996, alpha: 1)
            return cell
        case .Saved:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SAVED_ID, for: indexPath)
            cell.backgroundColor = #colorLiteral(red: 0.2233045995, green: 0.1308634281, blue: 0.02907828428, alpha: 1)
            return cell
        default:
            break
        }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        meSelectiveItemView.horizentalBarleftConstraint?.constant = scrollView.contentOffset.x * 1/3
    }
}
