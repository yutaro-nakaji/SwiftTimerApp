//
//  ViewController.swift
//  SwiftTimerApp
//
//  Created by Yutaro Nakaji（B） on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    // タイマー使用できるよう宣言
    var timer = Timer()
    
    // 変数宣言
    var count = Int()
    
    // 配列宣言（中身はUIImage）
    var imageArray = [UIImage]()
    
    //　画面が表示されたときに読み込まれる処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ストップボタンを使えないように
        stopButton.isEnabled = true
        
        for i in 0..<5 {
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        imageView.image = UIImage(named: "0")
    }
    
    // スタート押したときの処理
    @IBAction func start(_ sender: Any) {
        // startTimer処理
        startTimer()
        // スタートボタンを使えないように
        startButton.isEnabled = false
        // ストップボタンを使えるように
        stopButton.isEnabled = true
        
    }
    
    // ストップ押したときの処理
    @IBAction func stop(_ sender: Any) {
        // スタートボタンを使えるように
        startButton.isEnabled = true
        // ストップボタンを使えないように
        stopButton.isEnabled = false
        //タイマーを止める
        timer.invalidate()
    }
    
    // startTimer処理が呼ばれたときの処理
    func startTimer(){
        // タイマー起動
        timer = Timer.scheduledTimer(
            timeInterval: 0.2, // 0.2秒ごとに
            target: self,
            selector: #selector(timerUpdate), //この処理を実行
            userInfo: nil,
            repeats: true
        )
    }
    
    // timerUpdate処理が呼ばれたときの処理
    @objc func timerUpdate(){
        count += 1
        if count > 4 {
            count = 0
        }
        imageView.image = imageArray[count]
    }
    
}
