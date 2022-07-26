//
//  ExploreVC.swift
//  Test
//
//  Created by Michael Nelson on 24/07/2022.
//

import UIKit

class ExploreVC: UIViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var adMobBanner: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        storyCollectionView.dataSource = self
        storyCollectionView.delegate = self
        
        adMobBanner.layer.cornerRadius = 8
    }
    
    
    @IBAction func unwindToExplore(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}

extension UIViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCellId", for: indexPath) as? StoryCollectionViewCell {
            
            cell.setUpStoryView()
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
     
    
}
