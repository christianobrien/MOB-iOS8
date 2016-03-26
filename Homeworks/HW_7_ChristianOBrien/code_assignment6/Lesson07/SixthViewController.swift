import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var textBox: UITextView!
    
    var arrayFromFifthVC : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    textBox.text = arrayFromFifthVC.joinWithSeparator(" ")
    }
    
}
