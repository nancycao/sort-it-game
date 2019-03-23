import Foundation
import UIKit
import PlaygroundSupport

public class DirectionsViewController : UIViewController {
    public override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white
        
        // title & subtitle
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 110, y: 60, width: 200, height: 50)
        titleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        titleLabel.text = "How To Play"
        titleLabel.textColor = .black
        
        let subtitleLabel = UILabel()
        subtitleLabel.frame = CGRect(x: 60, y: 100, width: 275, height: 50)
        subtitleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        subtitleLabel.text = "Click to sort each item of trash into its correct bin!"
        subtitleLabel.textColor = .black
        subtitleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        subtitleLabel.numberOfLines = 0

        // images
        let blueBinImage = UIImage(named: "BlueBin.png")
        let blueBinImageView = UIImageView(image: blueBinImage!)
        blueBinImageView.frame = CGRect(x:60, y:165, width: 48, height: 79)
        
        let greenBinImage = UIImage(named: "GreenBin.png")
        let greenBinImageView = UIImageView(image: greenBinImage!)
        greenBinImageView.frame = CGRect(x:60, y:265, width: 48, height: 79)
        
        let brownBinImage = UIImage(named: "BrownBin.png")
        let brownBinImageView = UIImageView(image: brownBinImage!)
        brownBinImageView.frame = CGRect(x:60, y:365, width: 48, height: 79)
        
        let blackBinImage = UIImage(named: "BlackBin.png")
        let blackBinImageView = UIImageView(image: blackBinImage!)
        blackBinImageView.frame = CGRect(x:60, y:465, width: 48, height: 79)
        
        // captions for images
        let blueBinLabel = UILabel()
        blueBinLabel.frame = CGRect(x: 135, y: 155, width: 180, height: 100)
        blueBinLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        blueBinLabel.text = "Metals, glass, rigid plastics and beverage cartons belong in the blue recycling bin."
        blueBinLabel.textColor = .black
        blueBinLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        blueBinLabel.numberOfLines = 0
        
        let greenBinLabel = UILabel()
        greenBinLabel.frame = CGRect(x: 135, y: 250, width: 180, height: 100)
        greenBinLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        greenBinLabel.text = "Paper items belong in the green recycling bin."
        greenBinLabel.textColor = .black
        greenBinLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        greenBinLabel.numberOfLines = 0
        
        let brownBinLabel = UILabel()
        brownBinLabel.frame = CGRect(x: 135, y: 350, width: 180, height: 100)
        brownBinLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        brownBinLabel.text = "Food items belong in the brown compost bin."
        brownBinLabel.textColor = .black
        brownBinLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        brownBinLabel.numberOfLines = 0
        
        let blackBinLabel = UILabel()
        blackBinLabel.frame = CGRect(x: 135, y: 450, width: 180, height: 100)
        blackBinLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        blackBinLabel.text = "Everything else belongs in the black trash bin."
        blackBinLabel.textColor = .black
        blackBinLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        blackBinLabel.numberOfLines = 0
        
        // button
        let button = UIButton()
        button.frame = CGRect(x:145, y: 570, width:100, height: 20)
        button.setTitle("Let's play!",  for: UIControl.State.normal)
        button.setTitleColor(UIColor(red: 0.0824, green: 0.749, blue: 0.2235, alpha: 1.0), for: UIControl.State.normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
        button.addTarget(self, action:#selector(startGame(sender:)), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(blackBinImageView)
        view.addSubview(brownBinImageView)
        view.addSubview(blueBinImageView)
        view.addSubview(greenBinImageView)

        view.addSubview(blueBinLabel)
        view.addSubview(greenBinLabel)
        view.addSubview(brownBinLabel)
        view.addSubview(blackBinLabel)

        view.addSubview(button)        
        self.view = view
    }
    
    @IBAction func startGame(sender: UIButton) {
        self.navigationController?.pushViewController(GameViewController(), animated: true)
    }
}
