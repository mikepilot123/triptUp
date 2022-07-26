//
//  StoryCollectionViewCell.swift
//  Test
//
//  Created by Michael Nelson on 24/07/2022.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    //TripSection
    @IBOutlet weak var tripImage: UIImageView!
    
    //Review
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    //Profile Section
    @IBOutlet weak var profilePicImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var travellerType: UILabel!
    
    
    //TripInfo Section
    @IBOutlet weak var tripDescription: UILabel!
    @IBOutlet weak var tripLocation: UILabel!
    
    @IBOutlet weak var storyBackgroundView: UIView!
    
    
    override func awakeFromNib() {
        
    }
    
    func setUpStoryView() {
        
        profilePicImage.layer.cornerRadius = profilePicImage.frame.size.height/2
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        
        self.layer.cornerRadius = 8
        self.tripImage.layer.cornerRadius = 6
    }
}
