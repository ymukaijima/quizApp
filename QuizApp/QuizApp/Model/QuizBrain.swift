//
//  QuizBrain.swift
//  QuizApp
//
//  Created by yumi on 2020/06/02.
//  Copyright © 2020 Yumi Takahashi. All rights reserved.
//

import Foundation

// クイズに関連する関数や問題をまとめたクラスを作成
class QuizBrain {
    
    static let quizBrain = QuizBrain()
    
    var questionNumber = 0

    var quiz = [
        Question(q: "2020年のカープの監督は誰？", a:["野村謙二郎", "マーティ・レオ・ブラウン", "佐々岡真司"], correctAnswer: "佐々岡真司", l: 1),
        Question(q: "広島カープが本拠地をおくスタジアムは？", a:["広島グリーンアリーナ", "広島市民球場", "MAZDA Zoom-Zoom スタジアム 広島"], correctAnswer: "MAZDA Zoom-Zoom スタジアム 広島", l: 2),
        Question(q: "マスコットのスラィリーの、背番号の代わりにつけられている記号は何？", a:["&", "!", "%"], correctAnswer: "!", l: 3),
        Question(q: "2016年、カープは何年ぶりのリーグ優勝を果たした？", a:["32年", "25年", "15年"], correctAnswer: "25年", l: 4),
        Question(q: "2017年7月7日、最終回に代打逆転３ランをバックスクリーンに叩き込んだのは誰？", a:["新井貴浩", "鈴木誠也", "松山竜平"], correctAnswer: "新井貴浩", l: 5),
        Question(q: "「孤高の天才」という異名を持つ前田智徳の通算打率は？", a:[".221", ".296", ".302"], correctAnswer: ".302", l: 6),
        Question(q: "鈴木誠也の応援歌「誠の道進み チームに流れを呼べ ○○から架けろ 夢の赤い橋」○○に入る言葉は何？", a:["荒川", "横川", "広島"], correctAnswer: "荒川", l: 7),
        Question(q: "この中でカープの監督に就任したことがない人は？", a:["山本浩二", "金本知憲", "緒方孝市"], correctAnswer: "金本知憲", l: 8),
        Question(q: "この中で新人王を獲ったことがない選手は？", a:["大瀬良大地", "鈴木誠也", "梵英心"], correctAnswer: "鈴木誠也", l: 9),
        Question(q: "黒田博樹が2015年にカープに復帰したが、どこのチームからカープへ復帰したか？", a:["ニューヨーク・ヤンキース", "シアトル・マリナーズ", "ロサンゼルス・ドジャース"], correctAnswer: "ニューヨーク・ヤンキース", l: 10)
        ]
    
    // 問題文を取得する関数
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // 回答の選択肢を取得する関数
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    // Progress Viewに現在の問題数を反映
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    // 次のクイズを取得する関数
    func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            // 最後のクイズ回答後、1番目の問題に戻る
            questionNumber = 0
        }
    }
    
    //　ユーザーが選択した答えが正解かどうか確認する関数
    func checkAnswer(userAnswer: String) -> Bool {
        // 正解していたらスコアを加算
        if userAnswer == quiz[questionNumber].rightAnswer {
            ScoreCountManager.sharedInstance.addScore()
            return true
        } else {
            return false
        }
    }
}
