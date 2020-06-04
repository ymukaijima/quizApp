//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by yumi on 2020/06/03.
//  Copyright © 2020 Yumi Takahashi. All rights reserved.
//

import UIKit
import AVFoundation

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreText: UILabel!
    
    // 音の設定
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreResult()
    }
    
    // スコアを確認
    func scoreResult() {
            if ScoreCountManager.sharedInstance.totalScore >= 100 {
                scoreText.text = "おめでとう！あなたの点数は150点中\(ScoreCountManager.sharedInstance.totalScore)点です！"
                
                playSound()
                
            } else {
                scoreText.text = "残念、あなたの点数は150点中\(ScoreCountManager.sharedInstance.totalScore)点です。またの挑戦を待っています！"
                }
    }
    // 音を流す関数
    func playSound() {
        let url = Bundle.main.url(forResource: "carpSong", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
