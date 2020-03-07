
import UIKit

class MeController: UIViewController {
    
   fileprivate let meBarButtonView: MeBarItemsView = {
           let view = MeBarItemsView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    fileprivate let meSelectiveItemView : MeSelectiveItemView = {
        let view = MeSelectiveItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMeBarButtonView()
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func setupMeBarButtonView() {
        
        view.addSubview(meBarButtonView)
        
        meBarButtonView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        meBarButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        meBarButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        meBarButtonView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        view.addSubview(meSelectiveItemView)
        meSelectiveItemView.topAnchor.constraint(equalTo: meBarButtonView.bottomAnchor).isActive = true
        meSelectiveItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        meSelectiveItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        meSelectiveItemView.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    
}
