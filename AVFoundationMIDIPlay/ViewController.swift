//
//  ViewController.swift
//  AVFoundationMIDIPlay
//
//  Created by Gene De Lisa on 1/12/16.
//  Copyright © 2016 Gene De Lisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sound:Sound!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sound = Sound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playAction(sender: UIButton) {
        sound.togglePlaying()
    }
}

