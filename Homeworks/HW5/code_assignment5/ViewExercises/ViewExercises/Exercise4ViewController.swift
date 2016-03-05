import UIKit

class Exercise4ViewController: UIViewController {
    
    @IBOutlet weak var myGreenButton: UIButton!
    @IBOutlet weak var greenButtonHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myGreenButton.layer.borderWidth = 1.0
        myGreenButton.layer.borderColor = UIColor.redColor().CGColor
    }

    @IBAction func greenButtonPressed(sender: UIButton) {
    
        greenButtonHeightConstraint.constant = 75
        view.setNeedsUpdateConstraints()
        if sender.backgroundColor == UIColor.redColor(){
            sender.backgroundColor = UIColor.greenColor()
        } else {
            sender.backgroundColor = UIColor.redColor()
        }
    }

}
