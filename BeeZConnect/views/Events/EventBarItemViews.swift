
import UIKit


class EventBarItemViews: UIView {
    
    fileprivate let EVENT_ID = "EventID"
    var leftHorizentalBarView: NSLayoutConstraint!
    var eventsController: ClassfieldsController?
    
    lazy var eventsItemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupEventBarItems()
        setupHorizentalBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupHorizentalBar() {
        let horizentalBarView = UIView()
        addSubview(horizentalBarView)
        horizentalBarView.translatesAutoresizingMaskIntoConstraints = false
        horizentalBarView.backgroundColor = #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1)
        
        // constraints
        leftHorizentalBarView = horizentalBarView.leftAnchor.constraint(equalTo: leftAnchor)
        leftHorizentalBarView.isActive = true
        horizentalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        horizentalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizentalBarView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    fileprivate func setupEventBarItems() {
        
        backgroundColor = #colorLiteral(red: 0.8737007976, green: 0.6250036359, blue: 0.2320800722, alpha: 1)
        eventsItemCollectionView.backgroundColor = #colorLiteral(red: 0.9050862789, green: 0.7766507864, blue: 0.2645807564, alpha: 1)
        addSubview(eventsItemCollectionView)
        
        eventsItemCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        eventsItemCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        eventsItemCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        eventsItemCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        eventsItemCollectionView.register(EventItemsCell.self, forCellWithReuseIdentifier: EVENT_ID)
    }
    
}

extension EventBarItemViews: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ClassfieldsSections.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EVENT_ID, for: indexPath) as! EventItemsCell
        
        let item = ClassfieldsSections(rawValue: indexPath.item)?.description
        cell.text = item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let x: CGFloat = CGFloat(indexPath.item) * frame.width / 4
//        leftHorizentalBarView.constant = x
//
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            self.layoutIfNeeded()
//        })
        self.eventsController?.scrollToMenu(to: indexPath.item)
    }
}

extension EventBarItemViews: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width * (1/4)
        return .init(width: width, height: collectionView.frame.height)
    }
   
}
