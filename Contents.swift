import UIKit
import Foundation // Timerクラスを使用するために必要なモジュール
import PlaygroundSupport // Playground上でTimerクラスを機能させるために必要なモジュール

// デフォルトだとTimerクラスを継続的に処理させることが出来ないため、フラグを変更
PlaygroundPage.current.needsIndefiniteExecution = true


class AlarmClock {
    var timer: Timer?
    var currentTime: String?
    var dateFormatt = DateFormatter()
    var limit: Int = 5
    
    func start() {
        // 任意の箇所でTimerクラスを使用して1秒毎にcountup()メソッドを実行させるタイマーをセット
        timer = Timer.scheduledTimer(
            timeInterval: 1, // タイマーの実行間隔を指定(単位はn秒)
            target: self, // ここは「self」でOK
            selector: #selector(countup), // timeInterval毎に実行するメソッドを指定
            userInfo: nil, // ここは「nil」でOK
            repeats: true // 繰り返し処理を実行したいので「true」を指定
        )
        
        var settingAlarm = Date()
        var calendar = Calendar.current
        
        var hour = calendar.component( .hour, from: settingAlarm)
        var minutes = calendar.component( .minute, from: settingAlarm)
        print("現在の時刻は\(hour)時\(minutes)分です。")
        
    }

    // Timerクラスに設定するメソッドは「@objc」キーワードを忘れずに付与する
    @objc func countup() {
        
        dateFormatt.dateFormat = "HH:mm"
        let timezoneDate = dateFormatt.string(from: Date())
        currentTime = timezoneDate
        }
    
    @objc func timerSet() {}
}



