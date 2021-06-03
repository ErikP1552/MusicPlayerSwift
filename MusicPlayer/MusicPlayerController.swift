//
//  MusicPlayerController.swift
//  MusicPlayer
//
//  Created by Erik on 6/1/21.
//

import UIKit
import MediaPlayer


var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

class MusicPlayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func genreButtonTap(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization{  (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
           }
        }
    }

    @IBAction func StopButton(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String){
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    

}
