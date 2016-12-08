//
//  RecordSoundViewController.swift
//  Pitch Perfect
//
//  Created by Ashish Kumar Sai on 08/12/16.
//  Copyright © 2016 Ashish Rajendra Kumar Sai. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundViewController: UIViewController {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordButtonClicked: UIButton!
    @IBOutlet weak var recordingInProgressText: UILabel!
    @IBOutlet weak var stopRecordingClicked: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopRecordingClicked.isEnabled = false
    }



    @IBAction func recordAudio(_ sender: Any) {
        print("Record button Clicked")
        recordingInProgressText.text = "Recording In Progress"
        stopRecordingClicked.isEnabled = true
        recordButtonClicked.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print("Stop Recording Hit")
        recordButtonClicked.isEnabled = true
        stopRecordingClicked.isEnabled = false
        recordingInProgressText.text = "Click To Record"
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
        
    }
    

}

