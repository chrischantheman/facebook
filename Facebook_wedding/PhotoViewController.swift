//
//  PhotoViewController.swift
//  Facebook_wedding
//
//  Created by Christopher Chan on 6/18/16.
//  Copyright © 2016 Christopher Chan. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    var imageView: UIImage!
    var weddingViewOriginalCenter: CGPoint!
    var weddingViewUp: CGPoint!
    var weddingViewDown: CGPoint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var weddingView: UIImageView!
    @IBOutlet weak var photoActionsView: UIImageView!
    @IBOutlet weak var doneButtonView: UIImageView!
    
    @IBAction func onDismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        print("translation \(translation.y)")
        print("velocity \(velocity.y)")
        
        if sender.state == UIGestureRecognizerState.Began {
            print("gesture began")
            weddingViewOriginalCenter = weddingView.center
            //photoActionsOriginalCenter = photoActionsView.center
            //doneButtonOriginalCenter = doneButtonView.center
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("gesture started")
            weddingView.center = CGPoint(x: weddingViewOriginalCenter.x, y: weddingViewOriginalCenter.y + translation.y)
            
            if translation.y > 100 || translation.y < -100 {
                photoActionsView.alpha = 0.1
                doneButtonView.alpha = 0.1
            }
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("gesture ended")
            if velocity.y > 0 && translation.y > 100 {
                UIView.animateWithDuration(0.3) {
                    print("hello!")
                    self.weddingView.center = self.weddingViewDown
                    self.photoActionsView.alpha = 1.0
                    self.doneButtonView.alpha = 1.0
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            } else if velocity.y < 0 && translation.y < -100 {
                print("hello2!")
                UIView.animateWithDuration(0.3) {
                    self.weddingView.center = self.weddingViewUp
                    self.photoActionsView.alpha = 1.0
                    self.doneButtonView.alpha = 1.0
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            } else {
                self.photoActionsView.alpha = 1.0
                self.doneButtonView.alpha = 1.0
                
                UIView.animateWithDuration(0.3) {
                    self.weddingView.center = self.weddingViewDown
                    self.weddingView.center = self.weddingViewUp
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weddingView.image = imageView
        
        scrollView.contentSize = CGSize(width: 320, height: 600)
        scrollView.delegate = self
        
        weddingViewDown = weddingView.center
        weddingViewUp = weddingView.center
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
        return weddingView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
