//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Anderson Soares Rodrigues on 06/10/2019.
//  Copyright © 2019 Anderson Soares Rodrigues. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var newRecordButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case slow = 0, fast, chipmunk, vader, echo, reverb }

    // MARK: Actions

    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }

        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }

    @IBAction func newRecordButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true;
        
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI(.notPlaying)
        
        setupButtonsImageScale()
    }
    
    func setupButtonsImageScale() {
        snailButton.contentMode = .center
        snailButton.imageView?.contentMode = .scaleAspectFit
        
        chipmunkButton.contentMode = .center
        chipmunkButton.imageView?.contentMode = .scaleAspectFit
        
        rabbitButton.contentMode = .center
        rabbitButton.imageView?.contentMode = .scaleAspectFit
        
        vaderButton.contentMode = .center
        vaderButton.imageView?.contentMode = .scaleAspectFit
        
        echoButton.contentMode = .center
        echoButton.imageView?.contentMode = .scaleAspectFit
        
        reverbButton.contentMode = .center
        reverbButton.imageView?.contentMode = .scaleAspectFit
    }
}
