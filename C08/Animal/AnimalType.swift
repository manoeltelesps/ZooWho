//
//  AnimalPackage.swift
//  C08
//
//  Substituicao local do pacote externo Animal-Package (repositorio removido).
//

import Foundation

class AnimalType {

    private let animalMap: [(descricao: String, animal: String)] = [
        ("Tem quatro patas e é peludo", "cachorro"),
        ("Tem escamas e vive na água", "peixe"),
        ("Tem asas e canta pela manhã", "passaro"),
    ]

    func whatAnimal(descricao: String, nome: String) -> String {
        for entry in animalMap {
            if descricao.contains(entry.descricao) || entry.descricao.contains(descricao) {
                return entry.animal
            }
        }
        return nome
    }
}
