import UIKit
import PlaygroundSupport
import SpriteKit

public class GameViewController : UIViewController {
    
    public override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .white

        let skView = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 875))
        let scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        view.addSubview(skView)

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: nil, action: #selector(howToPlay(sender:)))
        self.view = view
    }
    @IBAction func howToPlay(sender: UIButton) {
        self.navigationController?.pushViewController(DirectionsViewController(), animated: true)
    }
}

