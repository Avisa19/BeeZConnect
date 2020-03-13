
import UIKit

class ClassfieldsController: UIViewController {
    
    fileprivate let FEED_ID = "FeedID"
    fileprivate let CONCERT_ID = "ConcertId"
    fileprivate let ART_ID = "ArtID"
    fileprivate let THEATRE_ID = "theatreID"
    fileprivate let FAMILY_ID = "FamilyID"
    
    lazy var eventBarItemsView: EventBarItemViews = {
        let view = EventBarItemViews()
        view.eventsController = self
        return view
    }()
    
    fileprivate lazy var eventsCollectionView = BZCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavBarButtonItems()
        setupEventsBarItems()
        setupCollectionView()
    }
    
    fileprivate func setupEventsBarItems() {
        
        view.addSubview(eventBarItemsView)
        
        eventBarItemsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        eventBarItemsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        eventBarItemsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        eventBarItemsView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    fileprivate func setupNavBarButtonItems() {
        
        let searchBarItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch))
        searchBarItem.tintColor = .black
        
        let moreBarItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleMoreDetail))
        moreBarItem.tintColor = .black
        navigationItem.rightBarButtonItems = [searchBarItem, moreBarItem]
    }
    
    fileprivate func setupCollectionView() {
        
        view.addSubview(eventsCollectionView)
        eventsCollectionView.backgroundColor = #colorLiteral(red: 0.6557940841, green: 0.6001401544, blue: 0.4965561628, alpha: 1)
        eventsCollectionView.topAnchor.constraint(equalTo: eventBarItemsView.bottomAnchor).isActive = true
        eventsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        eventsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        eventsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        
        // register Cells
        eventsCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: FEED_ID)
        eventsCollectionView.register(ConcertCell.self, forCellWithReuseIdentifier: CONCERT_ID)
        eventsCollectionView.register(ArtCell.self, forCellWithReuseIdentifier: ART_ID)
        eventsCollectionView.register(TheatreCell.self, forCellWithReuseIdentifier: THEATRE_ID)
        eventsCollectionView.register(FamilyEventsCell.self, forCellWithReuseIdentifier: FAMILY_ID)
    }
    
    func scrollToMenu(to menuIndex: Int) {
        let scrollIndexPath = IndexPath(item: menuIndex, section: 0)
        eventsCollectionView.scrollToItem(at: scrollIndexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension ClassfieldsController {
    @objc fileprivate func handleSearch() {
        print("Start searching...")
    }
    
    @objc fileprivate func handleMoreDetail() {
        print("Start seeing more details...")
    }
}

extension ClassfieldsController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ClassfieldsSections.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FEED_ID, for: indexPath) as! FeedCell
        let item = ClassfieldsSections(rawValue: indexPath.item)
        switch item {
        case .Concerts:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CONCERT_ID, for: indexPath) as! ConcertCell
            cell.backgroundColor = .green
            return cell
        case .Arts:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ART_ID, for: indexPath) as! ArtCell
            cell.backgroundColor = .purple
            return cell
        case .Theatre:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: THEATRE_ID, for: indexPath) as! TheatreCell
            cell.backgroundColor = .red
            return cell
        case .FamilyEvents:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FAMILY_ID, for: indexPath) as! FamilyEventsCell
            cell.backgroundColor = .orange
            return cell
        case .none:
            break
        }
        return cell
    }
    
}

extension ClassfieldsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        eventBarItemsView.leftHorizentalBarView.constant = scrollView.contentOffset.x * 1/4
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPathSelected = IndexPath(item: index, section: 0)
        eventBarItemsView.eventsItemCollectionView.selectItem(at: indexPathSelected, animated: true, scrollPosition: .bottom)
    }
}
