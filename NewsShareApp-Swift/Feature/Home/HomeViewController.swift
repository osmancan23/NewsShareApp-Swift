import UIKit
import SnapKit

class HomeViewController: UIViewController {
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       let homeView = HomeView()
        homeView.delegate = self
        self.view = homeView
        
        
            
        
    }
    
    
}

extension HomeViewController : HomeViewProtocol {
    
    func goToCreateNewsView() {
        let view = CreateNewsViewController()
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    
}
/*
#Preview {
    HomeViewController()
}
*/

