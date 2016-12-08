//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Ashutosh Kumar Sai on 08/12/16.
//  Copyright © 2016 Ashish Rajendra Kumar Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        print("Record button Clicked")
        recordingInProgressText.text = "Recording In Progress"
        stopRecordingClicked.isEnabled = true
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        print("Stop Recording Hit")
        recordButtonClicked.isEnabled = false
    }
    

}

