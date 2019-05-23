import UIKit
import MessageUI
protocol HomeView {
    
    
}
class HomeViewController: UIViewController, HomeView, MFMailComposeViewControllerDelegate {
    var alarmDelegate: AlarmApplicationDelegate = AppDelegate()
    var alarmScheduler: AlarmSchedulerDelegate = Scheduler()
    var alarmModel: AlarmEntity = AlarmEntity()
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var viewBoundLivescore: UIView!
    @IBOutlet weak var viewHome: UIView!
    @IBOutlet weak var viewFavorites: UIView!
    @IBOutlet weak var viewWallpaper: UIView!
    @IBOutlet weak var viewSettings: UIView!
    @IBOutlet weak var viewLivescore: UIView!
    @IBOutlet weak var tbMenu: UITableView!
    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var viewContainerHome: UIView!
    @IBOutlet weak var viewContainerFavorites: UIView!
    @IBOutlet weak var viewContainerLivescore: UIView!
    @IBOutlet weak var viewContainerSettings: UIView!
    @IBOutlet weak var viewContainerTopscorers: UIView!
    @IBOutlet weak var viewContainerAlarm: UIView!
    @IBOutlet weak var viewContainerGroup: UIView!
    @IBOutlet weak var viewContainerAboutUs: UIView!
    var presenter: HomePresent!
    @IBOutlet weak var viewContainerWallpaper: UIView!
    var homeConfig: HomeConfiguaration = HomeConfiguarationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        homeConfig.configuration(homeViewController: self)
        setuplayout()
        initTableViewMenu()
        refeshColor()
        setColorMenu(active: Menu.home)
        alarmScheduler.checkNotification()
    }

    override func viewWillAppear(_ animated: Bool) {
        alarmModel = AlarmEntity()
    }
    
    func setuplayout() {
        viewBoundLivescore.layer.borderColor = UIColor.black.cgColor
        viewBoundLivescore.layer.cornerRadius = viewBoundLivescore.frame.height/2
        viewBoundLivescore.clipsToBounds = true
        viewBoundLivescore.layer.shadowColor = UIColor.black.cgColor
        viewBoundLivescore.layer.shadowOpacity = 1
        viewBoundLivescore.layer.shadowOffset = CGSize.zero
        viewBoundLivescore.layer.shadowRadius = 5
    }
    
    func initTableViewMenu() {
        tbMenu.delegate = self
        tbMenu.dataSource = self
        tbMenu.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        tbMenu.backgroundColor = #colorLiteral(red: 0.1138288751, green: 0.1331576705, blue: 0.2728530169, alpha: 1)
    }
    func setColorMenu(active:String){
        refeshColor()
        switch active {
        case Menu.home:
            viewHome.backgroundColor = #colorLiteral(red: 0.9069698453, green: 0.761492312, blue: 0.00318561797, alpha: 1)
            viewContainerHome.isHidden = false
        case Menu.favorites:
            viewFavorites.backgroundColor = #colorLiteral(red: 0.9069698453, green: 0.761492312, blue: 0.00318561797, alpha: 1)
            viewContainerFavorites.isHidden = false
        case Menu.livescore:
            viewLivescore.backgroundColor = #colorLiteral(red: 0.9069698453, green: 0.761492312, blue: 0.00318561797, alpha: 1)
            viewContainerLivescore.isHidden = false
        case Menu.wallpaper:
            viewWallpaper.backgroundColor = #colorLiteral(red: 0.9069698453, green: 0.761492312, blue: 0.00318561797, alpha: 1)
            viewContainerWallpaper.isHidden = false
        case Menu.settings:
            viewSettings.backgroundColor = #colorLiteral(red: 0.9069698453, green: 0.761492312, blue: 0.00318561797, alpha: 1)
            viewContainerSettings.isHidden = false
        case Menu.topScorers:
            viewContainerTopscorers.isHidden = false
        case Menu.alarm:
            viewContainerAlarm.isHidden = false
        case Menu.group :
            viewContainerGroup.isHidden = false
        case Menu.aboutUs:
            viewContainerAboutUs.isHidden = false
        default:
            viewHome.backgroundColor = #colorLiteral(red: 0.9069698453, green: 0.761492312, blue: 0.00318561797, alpha: 1)
        }
    }
    func refeshColor(){
        viewHome.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
        viewFavorites.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
        viewLivescore.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
        viewWallpaper.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
        viewSettings.backgroundColor = #colorLiteral(red: 0.4945881963, green: 0.6848531961, blue: 0.2634083331, alpha: 1)
        viewContainerHome.isHidden = true
        viewContainerFavorites.isHidden = true
        viewContainerWallpaper.isHidden = true
        viewContainerLivescore.isHidden = true
        viewContainerSettings.isHidden = true
        viewContainerAlarm.isHidden = true
        viewContainerTopscorers.isHidden = true
        viewContainerGroup.isHidden = true
        viewContainerAboutUs.isHidden = true
        
    }
    
    
    override func didReceiveMemoryWarning() {
    }
    @IBAction func hideMenu(_ sender: Any) {
        viewMenu.isHidden = true
    }
    @IBAction func showMenu(_ sender: Any) {
        viewMenu.isHidden = false
    }
    @IBAction func showViewHome(_ sender: Any) {
        setColorMenu(active: Menu.home)
        lbTitle.text = Menu.home
    }
    @IBAction func showViewFavorites(_ sender: Any) {
        setColorMenu(active: Menu.favorites)
        lbTitle.text = Menu.favorites
        NotificationCenter.default.post(name: notificationName.getFavorites.notification, object: nil)
    }
    @IBAction func showLivescore(_ sender: Any) {
        setColorMenu(active: Menu.livescore)
        lbTitle.text = Menu.livescore
        NotificationCenter.default.post(name: notificationName.livescore.notification, object: nil)
    }
    @IBAction func showWallpaper(_ sender: Any) {
        setColorMenu(active: Menu.wallpaper)
        lbTitle.text = Menu.wallpaper
    }
    @IBAction func showSettings(_ sender: Any) {
        setColorMenu(active: Menu.settings)
        lbTitle.text = Menu.settings
    }
    func sendEmail() {
        guard MFMailComposeViewController.canSendMail() else {
            let alert = UIAlertController(title: "No mail Accounts", message: "IPlease set up a Mail account in order to send email.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients(["\(SocialNetWorking.emailKolorFox)"])
        present(mail, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbMenu.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        presenter.setData(cell: cell, row: indexPath.row)
        cell.directMenu = { [weak self] in
            switch indexPath.row {
            case 0:
                self?.setColorMenu(active: Menu.home)
                break
            case 1:
                self?.setColorMenu(active: Menu.group)
                self?.lbTitle.text = Menu.group
                break
            case 2:
                self?.setColorMenu(active: Menu.favorites)
                self?.lbTitle.text = Menu.favorites
                NotificationCenter.default.post(name: notificationName.getFavorites.notification, object: nil)
                break
            case 3:
                self?.setColorMenu(active: Menu.alarm)
                self?.lbTitle.text = Menu.alarm
                NotificationCenter.default.post(name: notificationName.getAlarm.notification, object: nil)
                break
            case 4:
                self?.setColorMenu(active: Menu.livescore)
                self?.lbTitle.text = Menu.livescore
                NotificationCenter.default.post(name: notificationName.livescore.notification, object: nil)
                break
            case 5:
                self?.setColorMenu(active: Menu.topScorers)
                self?.lbTitle.text = Menu.topScorers
                break
            case 6:
                self?.setColorMenu(active: Menu.wallpaper)
                self?.lbTitle.text = Menu.wallpaper
                break
            case 7:
                self?.setColorMenu(active: Menu.settings)
                self?.lbTitle.text = Menu.settings
                break
            case 8:
                self?.setColorMenu(active: Menu.home)
                self?.lbTitle.text = Menu.home
                break
            case 9:
                self!.sendEmail()
                break
            case 10:
                self?.setColorMenu(active: Menu.aboutUs)
                self?.lbTitle.text = Menu.aboutUs
                break
            default:
                break
            }
            self?.viewMenu.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}

