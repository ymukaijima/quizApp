//
//  ScoreCountManager.swift
//  QuizApp
//
//  Created by yumi on 2020/06/03.
//  Copyright © 2020 Yumi Takahashi. All rights reserved.
//

import Foundation

protocol ScoreDelegate: class {
    //まかせたい処理（点数の値自体を取得すること）
    func getPoint() -> Int
}

// スコアをカウントする機能
class ScoreCountManager{
    
    // インスタンス化せずに呼び出せるようにする
    static let sharedInstance = ScoreCountManager()
    
    // 合計得点
    var totalScore: Int = 0
    
    // まかせる先のクラス
    weak var delegate: ScoreDelegate?
    
    // このクラス内からしかインスタンス化できないようにする
    private init(){
        // シングルトンであることを保証
    }
    
    // 得点を追加する関数
    func addScore(){
        // delegateはnilの可能性があるため、アンラップが必要
        if let point = self.delegate?.getPoint(){
            // アンラップしたものを代入
            self.totalScore += point
        }
    }
}
