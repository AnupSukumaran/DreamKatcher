//
//  DKFeedViewController.swift
//  DreamKatcher
//
//  Created by Sukumar Anup Sukumaran on 20/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class DKFeedViewController: AVPlayerViewController, StoryboardProtocol {
    
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var index: Int!
    fileprivate var feed: ResultsData!
    fileprivate var isPlaying: Bool!
    
    static func instantiate(feed: ResultsData, andIndex index: Int, isPlaying: Bool = false) -> UIViewController {
        let viewController = DKFeedViewController.instantiate()
        viewController.feed = feed
        viewController.index = index
        viewController.isPlaying = isPlaying
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFeed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        player?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        player?.pause()
    }
    
    func play() {
        player?.play()
    }
    
    func pause() {
        player?.pause()
    }
    
    fileprivate func initializeFeed() {
        
        guard let urlStr = feed.formatted_data?.video, let url = URL(string: urlStr) else {return}
        
        print("urlStr = \(urlStr)")
        
        player = AVPlayer(url: url)
        isPlaying ? play() : nil
    }
}
