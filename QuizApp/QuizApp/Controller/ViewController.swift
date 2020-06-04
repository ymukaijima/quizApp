//
//  ViewController.swift
//  QuizApp
//
//  Created by yumi on 2020/06/02.
//  Copyright © 2020 Yumi Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ScoreDelegate{
    //　ScoreDelegateプロトコルに準拠したメソッド（デリゲートメソッド）
    // Label番号5,6,7,9,10は難問のため20点、それ以外は10点
    func getPoint() -> Int {
        if QuizBrain.quizBrain.quiz[QuizBrain.quizBrain.questionNumber].label == 5 || QuizBrain.quizBrain.quiz[QuizBrain.quizBrain.questionNumber].label == 6 ||
            QuizBrain.quizBrain.quiz[QuizBrain.quizBrain.questionNumber].label == 7 ||
            QuizBrain.quizBrain.quiz[QuizBrain.quizBrain.questionNumber].label == 9 ||
            QuizBrain.quizBrain.quiz[QuizBrain.quizBrain.questionNumber].label == 10
            {
            return 20
        } else {
            return 10
        }
    }
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // クイズの入った配列をシャッフルする
        QuizBrain.quizBrain.quiz.shuffle()
        // 回答もシャッフルする
        QuizBrain.quizBrain.quiz[QuizBrain.quizBrain.questionNumber].answers.shuffle()
        // 問題を表示させる関数
        updateUI()
        
        // Buttonの文字数が増えても文字列全体を表示させるようにする
        choice1.titleLabel?.numberOfLines = 0
        choice2.titleLabel?.numberOfLines = 0
        choice3.titleLabel?.numberOfLines = 0
        
        //　デリゲート先が自分自身であることを宣言
        ScoreCountManager.sharedInstance.delegate = self
    }

    //　回答ボタンを押した時うごくfunction
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // ユーザーが押した答えを取得
        let userAnswer = sender.currentTitle!
        
        // ユーザーが正しい答えを選んだかどうかを確認する関数
        QuizBrain.quizBrain.checkAnswer(userAnswer: userAnswer)
        
        // 次の問題へ
        if QuizBrain.quizBrain.questionNumber != 9 {
            QuizBrain.quizBrain.nextQuestion()
        } else {
            // 最後のクイズに回答後、スコアが確認できる画面へ
            moveToScoreView()
        }
        
        // 次の問題が表示されるまでのラグを0.2に設定
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // 問題を画面表示させる関数
    @objc func updateUI() {
        // 問題文を表示
        questionText.text = QuizBrain.quizBrain.getQuestionText()
        // 回答文を表示
        let answerChoices = QuizBrain.quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        // Progress Viewに現在の問題数を反映
        progressBar.progress = QuizBrain.quizBrain.getProgress()
    }
    
    // スコアが確認できる画面へ遷移
    func moveToScoreView(){
        // 2秒後に画面を遷移する
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let vc = ScoreViewController()
            //次の画面をフルスクリーンにして表示
            vc.modalPresentationStyle = .fullScreen
            //次の画面を表示
            self.present(vc, animated: true, completion: nil)
        }
    }
        @IBAction func tappedModalButton(_ sender: Any) {
        let vc = ModalViewController()
        self.present(vc, animated: true, completion: nil)
        }
}
