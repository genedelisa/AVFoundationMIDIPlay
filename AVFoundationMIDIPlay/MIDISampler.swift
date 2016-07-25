//
//  MIDISampler.swift
//  AVFoundationMIDIPlay
//
//  Created by Gene De Lisa on 1/12/16.
//  Copyright © 2016 Gene De Lisa. All rights reserved.
//

import Foundation
import AVFoundation

class MIDISampler {
    
    var engine:AVAudioEngine!
    var sampler:AVAudioUnitSampler!
    
    let melodicBank = UInt8(kAUSampler_DefaultMelodicBankMSB)
    let defaultBankLSB = UInt8(kAUSampler_DefaultBankLSB)
    
    /// general midi number for marimba
    let gmMarimba = UInt8(12)
    let gmHarpsichord = UInt8(6)
    
    init() {
        initAudioEngine()
    }
    
    func initAudioEngine () {
        
        engine = AVAudioEngine()

        sampler = AVAudioUnitSampler()
        engine.attachNode(sampler)
        
        engine.connect(sampler, to: engine.mainMixerNode, format: nil)
        
        startEngine()
    }
    
    func startEngine() {
        
        if engine.running {
            print("audio engine already started")
            return
        }
        
        do {
            try engine.start()
            print("audio engine started")
        } catch {
            print("oops \(error)")
            print("could not start audio engine")
        }
    }
    
   
    func loadPatch(gmpatch:UInt8, channel:UInt8 = 0) {
        
        guard let soundbank =
            NSBundle.mainBundle().URLForResource("GeneralUser GS MuseScore v1.442", withExtension: "sf2")
            else {
                print("could not read sound font")
                return
        }
        
        do {
            try sampler.loadSoundBankInstrumentAtURL(soundbank, program:gmpatch,
                bankMSB: melodicBank, bankLSB: defaultBankLSB)
            
        } catch let error as NSError {
            print("\(error.localizedDescription)")
            return
        }
        
        self.sampler.sendProgramChange(gmpatch, bankMSB: melodicBank, bankLSB: defaultBankLSB, onChannel: channel)
    }

    
    func hstart() {
        // of course, loading the patch every time is not optimal.
        loadPatch(gmHarpsichord)
        self.sampler.startNote(65, withVelocity: 64, onChannel: 0)
    }
    
    func hstop() {
        self.sampler.stopNote(65, onChannel: 0)
    }
    
    func mstart() {
        loadPatch(gmMarimba, channel:1)
        self.sampler.startNote(65, withVelocity: 64, onChannel: 1)
    }
    
    func mstop() {
        self.sampler.stopNote(65, onChannel: 1)
    }
    
}

