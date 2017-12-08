//
//  ViewController.swift
//  MP7
//
//  Created by Taha Syed on 12/7/17.
//  Copyright © 2017 UIUC. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //Create and array of sounds.
    let soundFileNames = ["fired", "news", "wall", "rich", "wrong", "china"]
    
    //Create an array of audio players.
    var audioPlayers = [AVAudioPlayer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //Setup audio players
        for sound in soundFileNames {
            
            do {
               
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: ".mp3")!);
                let audioPlayer = try AVAudioPlayer(contentsOf: url as URL);
                
                audioPlayers.append(audioPlayer)
                
            } catch {
                
                audioPlayers.append(AVAudioPlayer())
                
            }
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
   
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        //Get the audio player for the corresponding button that was tapped.
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
        
        
    }
    
    
    
}
