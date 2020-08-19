//
//  DKFeedPageViewController.swift
//  DreamKatcher
//
//  Created by Sukumar Anup Sukumaran on 20/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit

protocol FeedPageViewDelegate: class {
    func presentInitialFeed(_ feed: ResultsData)
}

class DKFeedPageViewController: UIPageViewController {
    
    fileprivate var presenter: FeedPagePresenterDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        presenter = DKFeedPagePresenter(view: self)
        presenter.viewDidLoad()
    }
    


}

extension DKFeedPageViewController: FeedPageViewDelegate {
    func presentInitialFeed(_ feed: ResultsData) {
        
        let viewController = DKFeedViewController.instantiate(feed: feed, andIndex: 0, isPlaying: true) as! DKFeedViewController
        setViewControllers([viewController], direction: .forward, animated: false, completion: nil)
    }
}

extension DKFeedPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let indexedFeed = presenter.fetchPreviousFeed() else { return nil }
        return DKFeedViewController.instantiate(feed: indexedFeed.feed, andIndex: indexedFeed.index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let indexedFeed = presenter.fetchNextFeed() else { return nil }
        return DKFeedViewController.instantiate(feed: indexedFeed.feed, andIndex: indexedFeed.index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        if let viewController = pageViewController.viewControllers?.first as? DKFeedViewController, let previousViewController = previousViewControllers.first as? DKFeedViewController {
            previousViewController.pause()
            viewController.play()
            presenter.updateFeedIndex(fromIndex: viewController.index)
        }
    }
    
    
}
