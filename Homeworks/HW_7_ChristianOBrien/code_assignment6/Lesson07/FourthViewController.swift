import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextView!
    
    var textFromPreviousVC = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textBox.text = textFromPreviousVC
        
    }
    
    
}
