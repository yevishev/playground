class GifSearchCollectionView: UIViewController {
    
    weak var collectionView: UICollectionView!
    weak var searchInput: UITextField!
    weak var buttonIncreaseCells: UIButton!
    weak var buttonDecreaseCells: UIButton!
    lazy var textValueSearch: String = ""
    
    private var data: [String] = [
        "test",
        "test101",
        "test102",
        "test103",
        "test104",
        "test105",
        "test106",
        "test107",
    ]
    
    private var countOfCells: Int = 30
    
    override func loadView() {
        super.loadView()
        
        //инициализирую объект UICollectionView с констрейнтами
        let collectionView = UICollectionView(frame: CGRect(x: 10, y: 120, width: 400, height: 600), collectionViewLayout: UICollectionViewFlowLayout())
        //устанавливаю параметр false, чтобы дочерние элементы влияли на размер при изменении autosizing сетки
        collectionView.translatesAutoresizingMaskIntoConstraints = true
        //добавляю на экран въюху
        self.view.addSubview(collectionView)
        //здесь указываю, что у въюхи UICollectionView верхние и нижние грацицы будут совпадать констрейнтами родительской вьюхи, и тоже самое с левой и правой констрейнтами (если текст справа налево, то наоборот)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.collectionView = collectionView
        //регистрация класса ячейки
        self.collectionView.register(GifCollectionViewCell.self, forCellWithReuseIdentifier: "GifCollectionViewCell")
        //searchInput
        let searchInput = UITextField(frame: CGRect(x: 10, y: 60, width: 400, height: 50))
        searchInput.clipsToBounds = true
        searchInput.layer.cornerRadius = 6
        searchInput.layer.borderColor = UIColor(white: 0.75, alpha: 1).cgColor
        searchInput.layer.borderWidth = 1
        searchInput.borderStyle = .roundedRect
        searchInput.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchInput.keyboardType = .default
        searchInput.placeholder = "try find some gif"
        searchInput.delegate = self
        
        self.searchInput = searchInput
        self.view.addSubview(searchInput)
        
        //button`s +/-
        let btnIncrease: UIButton = UIButton(frame: CGRect(x: 100, y: 720, width: 100, height: 50))
        btnIncrease.backgroundColor = .systemGreen
        btnIncrease.setTitle("+1", for: .normal)
        self.buttonIncreaseCells = btnIncrease
        self.view.addSubview(self.buttonIncreaseCells)
        btnIncrease.addTarget(self, action: #selector(increaseCells), for: UIControl.Event.touchUpInside)
        let btnDecrease: UIButton = UIButton(frame: CGRect(x: 210, y: 720, width: 100, height: 50))
        btnDecrease.backgroundColor = .systemRed
        btnDecrease.setTitle("-1", for: .normal)
        btnDecrease.addTarget(self, action: #selector(decreaseCells), for: UIControl.Event.touchUpInside)
        self.buttonDecreaseCells = btnDecrease
        self.view.addSubview(self.buttonDecreaseCells)
    }
    
    @objc func increaseCells() {
        self.data.append("yesey")
    }
    
    @objc func decreaseCells() {
        self.data.removeLast()
    }
    
    //в методе, который отрабатывает тогда, когда въюха уже загрузилась я устанавлю цвет задника UICollectionView, также назначу делегата и dataSource, для того чтобы в extension переписать нужные мне функции под свои нужды (если я правильно понял)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

extension GifCollectionViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: string) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            self.textValueSearch = updatedText
            print(self.textValueSearch)
        }
        return true
    }
}

//работа с количество ячеек
extension GifCollectionViewController: UICollectionViewDataSource {
    //устанавливаю колличество секций (в данном случае будет одна и в ней будет несколько ячеек
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //количество элементов в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    //метод нужен для отрисовки конкретной ячейки с определенными параметрами
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GifCollectionViewCell", for: indexPath) as! GifCollectionViewCell
        if data.indices.contains(indexPath.row) {
            cell.textLabel.text = self.data[indexPath.row]
        } else {
            cell.textLabel.text = "text is undefined"
        }
        cell.textLabel.textColor = .white
        cell.textLabel.font = UIFont(name: "DevanagariSangamMN-Bold", size: 20.0)
        return cell
    }
}

//работы с отрисовка данных в ячейке
extension GifCollectionViewController: UICollectionViewDelegate {
    //в данной функции записываются действия, которые выполняются в случае нажатия на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if data.indices.contains(indexPath.row) {
            print(data[indexPath.row])
        } else {
            print("data is not exists")
        }
    }
}

//установка констрейнтов и размеров ячеек
extension GifCollectionViewController: UICollectionViewDelegateFlowLayout {
    //установка размеров ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: 120,
            height: 120)
    }
    
    //расстояние между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    //минимальный наследуемое расстояние для секции (хз зачем, в гуиде так написано)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //установка маржина указанной въюхи
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 14, bottom: 8, right: 14)
    }
    
}


