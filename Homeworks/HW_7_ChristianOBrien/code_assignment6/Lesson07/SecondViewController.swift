import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var slideLabel: UILabel!
    
    
    let nameSetting = NSUserDefaults.standardUserDefaults().stringForKey("settings_name")
    let slideSetting = NSUserDefaults.standardUserDefaults().doubleForKey("settings_slider")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = String(nameSetting!)
        slideLabel.text = String(slideSetting)
    }
    
    
    
}
