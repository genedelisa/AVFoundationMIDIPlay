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
    var sampler:MIDISampler!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sound = Sound()
        self.sampler = MIDISampler()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playAction(sender: UIButton) {
        sound.togglePlaying()
    }
    
    @IBAction func samplerDown(sender: UIButton) {
        sampler.hstart()
    }
    
    @IBAction func samplerUp(sender: UIButton) {
        sampler.hstop()
    }

    @IBAction func marimbaDown(sender: UIButton) {
        sampler.mstart()
    }
    @IBAction func marimbaUp(sender: UIButton) {
        sampler.mstop()
    }
}

