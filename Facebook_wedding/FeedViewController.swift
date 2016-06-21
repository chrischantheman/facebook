//
//  FeedViewController.swift
//  Facebook_wedding
//
//  Created by Christopher Chan on 6/18/16.
//  Copyright © 2016 Christopher Chan. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedView: UIImageView!
    
    var selectedImageView: UIImageView!
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = feedView.image!.size
        scrollView.delegate = self
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        photoViewController.imageView = selectedImageView.image
        
        // Set the modal presentation style of your destinationViewController to be custom.
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        photoViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }
    
    @IBAction func onTapGestureFeed(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("FeedtoPhotoSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return feedView
    }

}
