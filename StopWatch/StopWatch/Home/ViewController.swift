import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var stopFlag : Bool = false
    var timerFlag : Bool = false
    var timer : Timer?
    var centiSecond : Int = 0
    var second : Int = 0
    var minute : Int = 0
    var laps : [String] = []
    var currentTime : String?
    var startBackgroundColor = UIColor.init(red: 051/255, green: 102/255, blue: 0, alpha: 1.0)
    var startTintColor = UIColor.init(red: 051/255, green: 204/255, blue:0, alpha: 1.0)
    var stopBackgroundColor = UIColor.init(red: 153/255, green: 0, blue: 0, alpha: 1.0)
    var stopTintColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 1.0)
    
    @IBOutlet weak var stopWatch: UILabel!
    @IBOutlet weak var startAndStop: UIButton!
    @IBOutlet weak var lapAndReset: UIButton!
    @IBOutlet weak var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonCircular()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        cell.lap.text = "랩\(indexPath.row+1)"
        cell.time.text = laps[indexPath.row]
        return cell
    }
    
    @IBAction func startAndStop(_ sender: Any) {
        //start -> stop
        if stopFlag{
            setStartButton()
            timerOff()
        }
        //stop -> start
        else{
            setStopButton()
            timerOn()
        }
        stopFlag = !stopFlag
    }
    
    @IBAction func lapAndReset(_ sender: Any) {
        if stopFlag{
            //랩 누르면 tableView에 정보 저장
            //reload
            guard let currentTime = currentTime else { return }
            laps.append(currentTime)
            table.reloadData()
        }else{
            //삭제할거 있으면
            //tableview 정보삭제
            laps.removeAll()
            table.reloadData()
            stopWatch.text = "00:00.00"
            centiSecond = 0
            second = 0
            minute = 0
            resetResetButton()
        }
    }
    
    @objc func timeLabelChange(){
        centiSecond += 1
        if centiSecond >= 100{
            centiSecond = 0
            second += 1
        }
        if second >= 60{
            minute += 1
        }
        currentTime = String(format: "%02d:%02d.%02d",minute, second, centiSecond)
        stopWatch.text = currentTime
    }
    
    func timerOn(){
        timer = Timer(timeInterval: 0.01, target: self, selector: #selector(timeLabelChange), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    func timerOff(){
        timer?.invalidate()
    }
}

extension ViewController{
    func setButtonCircular(){
        startAndStop.layer.cornerRadius = startAndStop.bounds.width / 2
        lapAndReset.layer.cornerRadius = lapAndReset.bounds.width/2
        startAndStop.backgroundColor = startBackgroundColor
        startAndStop.tintColor = startTintColor
    }
    
    func setStartButton(){
        startAndStop.setTitle("시작", for: .normal)
        startAndStop.backgroundColor = startBackgroundColor
        startAndStop.tintColor = startTintColor
        setResetButton()
    }
    
    func setResetButton(){
        lapAndReset.setTitle("재설정", for: .normal)
        lapAndReset.tintColor = UIColor.white
    }
    
    func resetResetButton(){
        lapAndReset.setTitle("랩", for: .normal)
        lapAndReset.tintColor = UIColor.systemGray
    }
    
    func setStopButton(){
        startAndStop.setTitle("정지", for: .normal)
        startAndStop.backgroundColor = stopBackgroundColor
        startAndStop.tintColor = stopTintColor
    }

}
