//
//  DKImageViewController.swift
//  DreamKatcher
//
//  Created by Sukumar Anup Sukumaran on 20/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import SDWebImage

class DKImageViewController: UIViewController, StoryboardProtocol {

    @IBOutlet weak var imgView: UIImageView!
    
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var index: Int!
    fileprivate var feed: ResultsData!
    fileprivate var isPlaying: Bool!
    
    static func instantiate(feed: ResultsData, andIndex index: Int, isPlaying: Bool = false) -> UIViewController {
        let viewController = DKImageViewController.instantiate()
        viewController.feed = feed
        viewController.index = index
        viewController.isPlaying = isPlaying
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFeed()
        // Do any additional setup after loading the view.
    }
    

    fileprivate func initializeFeed() {
        
        guard let urlStr = feed.formatted_data?.image else {return}
        
        print("MEga - ImageURL = \(urlStr)")
        
        imgView.sd_setImage(with: URL(string: urlStr)) { (img, error, cache, url) in
            
        }
        
    }

}
