import Foundation
import UIKit
import PlaygroundSupport

public class StartViewController : UIViewController {
    public override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 100, y: 200, width: 200, height: 80)
        titleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 60)
        titleLabel.text = "Sort-It!"
        titleLabel.textColor = .black
        
        let subtitleLabel = UILabel()
        subtitleLabel.frame = CGRect(x: 65, y: 205, width: 275, height: 200)
        subtitleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        subtitleLabel.text = "an educational game about recycling ♻"
        subtitleLabel.textColor = .black
        
        let button = UIButton()
        button.frame = CGRect(x:93, y:350, width:200, height: 20)
        button.setTitle("Test your knowledge!",  for: UIControl.State.normal)
        button.setTitleColor(UIColor(red: 0.0824, green: 0.749, blue: 0.2235, alpha: 1.0), for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
        button.addTarget(self, action:#selector(startGame(sender:)), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)

        view.addSubview(button)

        self.view = view
    }

    @IBAction func startGame(sender: UIButton) {
        self.navigationController?.pushViewController(DirectionsViewController(), animated: true)
    }

}
