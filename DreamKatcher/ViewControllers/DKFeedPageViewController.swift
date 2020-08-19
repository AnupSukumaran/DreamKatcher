//
//  DKFeedPageViewController.swift
//  DreamKatcher
//
//  Created by Sukumar Anup Sukumaran on 20/08/20.
//  Copyright © 2020 Tech_Tonic. All rights reserved.
//

import UIKit
import SASLoaderPod
import SASLogger

protocol FeedPageViewDelegate: class {
    func presentInitialFeed(_ feed: ResultsData)
}

class DKFeedPageViewController: UIPageViewController {
    
    fileprivate var presenter: FeedPagePresenterDelegate!
    
    var showImageOnly: Bool = false
    var loader: LoaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        loader = LoaderView(callOn: self, type: .ballSpinFadeLoader, color: .red, padding: 18)
        presenter = DKFeedPagePresenter(view: self, loader: loader)
        presenter.viewDidLoad()
        
    }
    
}

extension DKFeedPageViewController: FeedPageViewDelegate {
    func presentInitialFeed(_ feed: ResultsData) {
        if showImageOnly {
            let viewController = DKImageViewController.instantiate(feed: feed, andIndex: 0, isPlaying: true) as! DKImageViewController
            setViewControllers([viewController], direction: .forward, animated: false, completion: nil)
        } else {
            let viewController = DKFeedViewController.instantiate(feed: feed, andIndex: 0, isPlaying: true) as! DKFeedViewController
            setViewControllers([viewController], direction: .forward, animated: false, completion: nil)
        }
    }
}

extension DKFeedPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let indexedFeed = presenter.fetchPreviousFeed() else { return nil }

        if showImageOnly {
            return DKImageViewController.instantiate(feed: indexedFeed.feed, andIndex: indexedFeed.index)
        } else {
            return DKFeedViewController.instantiate(feed: indexedFeed.feed, andIndex: indexedFeed.index)
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let indexedFeed = presenter.fetchNextFeed() else { return nil }
        
        if showImageOnly {
          return DKImageViewController.instantiate(feed: indexedFeed.feed, andIndex: indexedFeed.index)
        } else {
           return DKFeedViewController.instantiate(feed: indexedFeed.feed, andIndex: indexedFeed.index)
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        showImageOnly = arc4random_uniform(2) == 0
        
        if showImageOnly {
          if let viewController = pageViewController.viewControllers?.first as? DKImageViewController {
                if let previousViewController = previousViewControllers.first as? DKFeedViewController {
                   previousViewController.pause()
                }
              presenter.updateFeedIndex(fromIndex: viewController.index)
          }
        } else {
            if let viewController = pageViewController.viewControllers?.first as? DKFeedViewController {
            
            if let previousViewController = previousViewControllers.first as? DKFeedViewController {
                previousViewController.pause()
            }
               viewController.play()
               presenter.updateFeedIndex(fromIndex: viewController.index)
           }
        }
        
    }
    
    
}
