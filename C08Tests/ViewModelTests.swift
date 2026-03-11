//
//  ViewModelTests.swift
//  C08Tests
//
//  Created by Claude on 11/03/26.
//

import XCTest
@testable import C08

final class ViewModelTests: XCTestCase {

    var viewModel: ViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Teste Unitario 1: Resposta errada reduz vidas
    func testRespostaErradaReduzVidas() {
        viewModel.animal = "cachorro"
        viewModel.answer = "gato"
        viewModel.lives = 2

        viewModel.checkAnswer()

        XCTAssertEqual(viewModel.lives, 1, "Vidas devem diminuir em 1 ao errar")
        XCTAssertEqual(viewModel.correct, false, "correct deve ser false ao errar")
    }

    // MARK: - Teste Unitario 2: getDescriptionLevels retorna descricoes corretas por nivel
    func testGetDescriptionLevelsRetornaNivelCorreto() {
        let descricaoNivel1 = viewModel.getDescriptionLevels(animal: "cachorro", level: 1)

        let descricoesCachorroNivel1 = [
            "Gosto de brincar",
            "Posso ser usado em várias funções",
            "\u{2060}Não largo do seu pé se eu quiser atenção",
            "Alguns foram criados para ajudar pessoas em perigo",
            "Ouço frequências que humanos não percebem",
            "Minha temperatura média é de 38,5 °C",
            "Tenho glândulas sudoríparas nos membros inferiores",
            "Algumas raças sentem desastres naturais antes deles acontecerem",
            "O desenho do meu nariz é único",
            "Sou capaz de sonhar durante o sono REM",
            "Alguns percorrem grandes distâncias sem cansar",
            "Percebo açúcar dissolvido em uma piscina olímpica",
            "Tenho 42 dentes na fase adulta",
        ]

        XCTAssertTrue(
            descricoesCachorroNivel1.contains(descricaoNivel1),
            "Deve retornar uma descricao de nivel 1 para cachorro"
        )

        let descricaoNivel2 = viewModel.getDescriptionLevels(animal: "peixe", level: 2)

        let descricoesPeixeNivel2 = [
            "Posso ter muitas cores diferentes",
            "Meu corpo é recoberto por estruturas rígidas",
            "Sou fonte de alimento importante no mundo",
            "Respiro de uma forma diferente dos mamíferos",
            "Sou comum em rios, lagos e mares",
            "Sou representado em aquários domésticos",
            "Muitos vivem reunidos em grandes grupos",
            "Alguns sobem cachoeiras para se reproduzir",
            "Sou símbolo de prosperidade em algumas culturas",
            "Alguns se adaptam à água doce e salgada",
            "Estou entre os primeiros vertebrados do planeta",
        ]

        XCTAssertTrue(
            descricoesPeixeNivel2.contains(descricaoNivel2),
            "Deve retornar uma descricao de nivel 2 para peixe"
        )
    }
}
