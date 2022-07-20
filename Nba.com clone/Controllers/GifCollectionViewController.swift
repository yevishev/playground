//
//  GifCollectionViewController.swift
//  Nba.com clone
//
//  Created by oberoya on 09/07/2022.
//

import UIKit

class GifCollectionViewController: UIViewController {
    
    weak var collectionView: UICollectionView!
    
    private let data: [String] = [
        "test",
        "test101",
        "test102",
        "test103",
        "test104",
        "test105",
        "test106",
        "test107",
    ]
    
    private var countOfCells: Int = 10
    
    override func loadView() {
        super.loadView()
        
        //инициализирую объект UICollectionView с констрейнтами
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        //устанавливаю параметр false, чтобы дочерние элементы влияли на размер при изменении autosizing сетки
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
        
        self.collectionView.register(GifSearchCollectionViewCell.self, forCellWithReuseIdentifier: "GifSearchCollectionViewCell")
    }
    
    //в методе, который отрабатывает тогда, когда въюха уже загрузилась я устанавлю цвет задника UICollectionView, также назначу делегата и dataSource, для того чтобы в extension переписать нужные мне функции под свои нужды (если я правильно понял)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
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
        return self.countOfCells
    }
    
    //метод нужен для отрисовки конкретной ячейки с определенными параметрами
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "GifSearchCollectionViewCell", for: indexPath) as! GifSearchCollectionViewCell
                cells.frame.size.height = 70
            return cells
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GifCollectionViewCell", for: indexPath) as! GifCollectionViewCell
            cell.textLabel.text = String(indexPath.row + 1) + "test font"
            cell.textLabel.textColor = .white
            cell.textLabel.font = UIFont(name: "DevanagariSangamMN-Bold", size: 20.0)
            return cell
        }
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
        switch indexPath.row {
        case 0:
            return CGSize(
                width: 400,
                height: 50)
        default:
            return CGSize(
                width: 120,
                height: 120)
        }
        
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

