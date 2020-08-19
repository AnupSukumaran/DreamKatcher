//
//  DKFeedPagePresenter.swift
//  DreamKatcher
//
//  Created by Sukumar Anup Sukumaran on 20/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import Foundation
import AVFoundation
import SASLogger
import SASLoaderPod

typealias IndexedFeed = (feed: ResultsData, index: Int)

protocol FeedPagePresenterDelegate: class {
    func viewDidLoad()
    func fetchNextFeed() -> IndexedFeed?
    func fetchPreviousFeed() -> IndexedFeed?
    func updateFeedIndex(fromIndex index: Int)
}

class DKFeedPagePresenter: FeedPagePresenterDelegate {
    
    fileprivate unowned var view: FeedPageViewDelegate
    fileprivate var fetcher: APILibraryDelegate
    fileprivate var activity: ActivityModel?
    fileprivate var currentFeedIndex = 0
    fileprivate var loader: LoaderView!
    init(view: FeedPageViewDelegate, fetcher: APILibraryDelegate = APILibrary(), loader: LoaderView) {
        self.view = view
        self.fetcher = fetcher
        self.loader = loader
    }
    
    func viewDidLoad() {
        fetcher.delegate = self
        configureAudioSession()
        fetchFeeds()
    }
    
    func updateFeedIndex(fromIndex index: Int) {
        currentFeedIndex = index
    }
    
    func fetchNextFeed() -> IndexedFeed? {
        return getFeed(atIndex: currentFeedIndex + 1)
    }
    
    func fetchPreviousFeed() -> IndexedFeed? {
        return getFeed(atIndex: currentFeedIndex - 1)
    }
    
    fileprivate func configureAudioSession() {
        try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: [])
    }
    
    fileprivate func fetchFeeds() {
       // view.startLoading()
        Logger.p("Loading...")
        loader.startAnimating()
        fetcher.fetchFeeds()
    }
    
    fileprivate func getFeed(atIndex index: Int) -> IndexedFeed? {
        guard let results = activity?.results else {return nil}
        guard index >= 0 && index < results.count else {
            return nil
        }
        return (feed: results[index], index: index)
    }
    
    
}

extension DKFeedPagePresenter: FetchFeedDelegate {
    func feedFetchService(_ service: APILibraryDelegate, didFetchFeeds feeds: ActivityModel?, withError error: Error?) {
        loader.stopAnimating()
        
        Logger.p("Loading Completed")
        if let error = error {
            Logger.p("Error Here-241 = \(error.localizedDescription)")
            return
        }
        self.activity = feeds
        guard let initialFeed = self.activity?.results?.first else {
            Logger.p("Message Here-241 = No Availavle Video Feeds")
            return
        }
        
        view.presentInitialFeed(initialFeed)
    }
    

}
