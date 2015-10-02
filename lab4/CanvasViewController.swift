//
//  CanvasViewController.swift
//  lab4
//
//  Created by Deepti Chinta on 10/1/15.
//  Copyright © 2015 DeeptiChinta. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    var newlyCreatedFace: UIImageView!
    
    @IBOutlet weak var deadFace: UIImageView!
    
    
    @IBAction func imageGesture(sender: UIPanGestureRecognizer) {
        
        var panImageGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onDragImage:")
        deadFace.addGestureRecognizer(panImageGestureRecognizer)
    }
    
    func onDragImage(panGestureRecognizer: UIPanGestureRecognizer) {
        var translation = panGestureRecognizer.translationInView(self.view)
        
        var point = panGestureRecognizer.locationInView(self.view)
        
        
        //var velocity = sender.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            var imageView = panGestureRecognizer.view as! UIImageView
            newlyCreatedFace = UIImageView(frame: imageView.frame)
            newlyCreatedFace.image = imageView.image
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            
               // .view as UIImageView
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            newlyCreatedFace.center = point
            //newlyCreatedFace.frame = CGRectMake(0, self.view.bounds.size.height - 20.0, trayView.frame.width, trayView.frame.height)

            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
            
            
            
        }
    }
    
    
    var trayOriginalCenter: CGPoint!
    
    
    
    @IBOutlet weak var trayView: UIView!
    
    
    
    @IBAction func onTrayPanGesture(sender: UIPanGestureRecognizer) {
        //sender.locationInView(trayView)
        
    }
    
    func onCustomTap(tapGestureRecognizer: UITapGestureRecognizer) {
        trayOriginalCenter = trayView.center
        //var translation = panGestureRecognizer.translationInView(trayView)


        var point = tapGestureRecognizer.locationInView(view)
        print ("here")
    }
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        var translation = panGestureRecognizer.translationInView(self.view)

        var point = panGestureRecognizer.locationInView(self.view)
        
        
        //var velocity = sender.velocityInView(view)
        var velocity = panGestureRecognizer.velocityInView(self.view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            var beginPoint = point
            trayOriginalCenter = trayView.center
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)


        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            var endPoint = point
            
            if (velocity.y > 0){
                print ("down")
                trayView.frame = CGRectMake(0, self.view.bounds.size.height - 20.0, trayView.frame.width, trayView.frame.height)
               // trayOriginalCenter = trayView.center


                
            } else {
                print ("up")
                trayView.frame = CGRectMake(0, self.view.bounds.size.height - trayView.frame.size.height, trayView.frame.width, trayView.frame.height)

                 //trayOriginalCenter = trayView.center
            
            }
            
            
            
            
        }
        
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var updirection: Bool?
        var downDirection: Int?
        
    
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onCustomTap:")
        
       // var location = tapGestureRecognizer.locationInView(self.trayView)
        // Optionally set the number of required taps, e.g., 2 for a double click
        tapGestureRecognizer.numberOfTapsRequired = 1;
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        trayView.userInteractionEnabled = true
        trayView.addGestureRecognizer(tapGestureRecognizer)
        
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        trayView.addGestureRecognizer(panGestureRecognizer)




        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
