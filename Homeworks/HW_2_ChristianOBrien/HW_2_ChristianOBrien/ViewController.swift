import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    
    var ageValue : Int = 0
    var userName : String = ""
    

    @IBAction func buttonClicked(sender: AnyObject) {
        userName = {
        return nameText.text!
    }()
        ageValue = Int(ageText.text!)!

        if (ageValue >= 16 && ageValue < 18) {
            labelView.text = "Hi \(userName), you're \(ageValue). You can drive."
        } else if (ageValue >= 18 && ageValue < 21) {
            labelView.text = "Hi \(userName), you're \(ageValue). You can drive and vote."
        } else if (ageValue >= 21) {
            labelView.text = "Hi \(userName), you're \(ageValue). You can drive, vote, and drink."
        } else if (ageValue < 16){
            labelView.text = "Hi \(userName), you're \(ageValue). You cannot drive, vote, or drink."
        }        
    }
}

