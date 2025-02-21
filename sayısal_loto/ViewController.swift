import UIKit

class ViewController: UIViewController {

    // IBOutlets: UI elemanları ile bağlantılar
    @IBOutlet weak var lotoLabel1: UILabel!
    @IBOutlet weak var lotoLabel2: UILabel!
    @IBOutlet weak var lotoLabel3: UILabel!
    @IBOutlet weak var lotoLabel4: UILabel!
    @IBOutlet weak var lotoLabel5: UILabel!
    @IBOutlet weak var lotoLabel6: UILabel!
    
    @IBOutlet weak var lotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Arka planı özel pembe gradient ile ayarla
        setGradientBackground()
        
        // Başlangıçta etiketlerin metinleri boş olabilir ya da bir açıklama metni gösterilebilir.
        resetLabels()
    }
    
    // Arka planı pembe gradient yapmak için fonksiyon
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 1.0).cgColor,  // Açık pastel pembe
            UIColor(red: 1.0, green: 0.4, blue: 0.6, alpha: 1.0).cgColor   // Sıcak koyu pembe
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)  // Üst sol
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)    // Alt sağ
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)  // En arkaya ekle
    }

    // Sayısal loto fonksiyonu
    func sayisalLoto() -> [Int] {
        let toplamRakamlar = 6
        let lotoAraligi = 1...49
        
        var secilenSayilar: Set<Int> = []
        
        while secilenSayilar.count < toplamRakamlar {
            let rastgeleSayi = Int.random(in: lotoAraligi)
            secilenSayilar.insert(rastgeleSayi)
        }
        
        return Array(secilenSayilar).sorted()
    }

    // Etiketleri sıfırlama (Başlangıçta gösterilecek metinleri sıfırlayalım)
    func resetLabels() {
        lotoLabel1.text = "?"
        lotoLabel2.text = "?"
        lotoLabel3.text = "?"
        lotoLabel4.text = "?"
        lotoLabel5.text = "?"
        lotoLabel6.text = "?"
    }

    // Butona tıklanınca tetiklenecek fonksiyon
    @IBAction func lotoButtonTapped(_ sender: UIButton) {
        // Sayısal loto sonucunu al
        let lotoSonucu = sayisalLoto()
        
        // Sonuçları her bir label'a yerleştir
        lotoLabel1.text = "\(lotoSonucu[0])"
        lotoLabel2.text = "\(lotoSonucu[1])"
        lotoLabel3.text = "\(lotoSonucu[2])"
        lotoLabel4.text = "\(lotoSonucu[3])"
        lotoLabel5.text = "\(lotoSonucu[4])"
        lotoLabel6.text = "\(lotoSonucu[5])"
    }
}
