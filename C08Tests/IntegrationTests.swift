//
//  IntegrationTests.swift
//  C08Tests
//
//  Created by Claude on 11/03/26.
//

import XCTest
@testable import C08

final class IntegrationTests: XCTestCase {

    // MARK: - Teste de Integracao: Fluxo completo do jogo ate Game Over
    func testFluxoCompletoAteGameOver() {
        let viewModel = ViewModel()

        // Iniciar jogo
        let response = viewModel.startGame()
        viewModel.description = response[0]
        viewModel.animal = response[1]

        XCTAssertFalse(viewModel.animal.isEmpty, "Animal deve estar definido apos iniciar o jogo")
        XCTAssertFalse(viewModel.description.isEmpty, "Descricao deve estar definida apos iniciar o jogo")
        XCTAssertEqual(viewModel.lives, 2, "Deve comecar com 2 vidas")
        XCTAssertEqual(viewModel.points, 0, "Deve comecar com 0 pontos")

        // Resposta errada 1 - perde 1 vida
        viewModel.answer = "resposta_errada_xyz"
        viewModel.checkAnswer()
        XCTAssertEqual(viewModel.lives, 1, "Deve ter 1 vida apos primeiro erro")
        XCTAssertFalse(viewModel.description2.isEmpty, "Deve mostrar dica nivel 2 apos erro")

        // Resposta errada 2 - perde ultima vida, game over
        viewModel.answer = "resposta_errada_xyz"
        viewModel.checkAnswer()
        XCTAssertEqual(viewModel.lives, 0, "Deve ter 0 vidas apos segundo erro")
        XCTAssertTrue(viewModel.showGameOver, "Deve mostrar game over apos perder todas as vidas")

        // Reiniciar jogo
        viewModel.restartGame()
        XCTAssertEqual(viewModel.lives, 2, "Deve resetar vidas para 2 apos reiniciar")
        XCTAssertEqual(viewModel.points, 0, "Deve resetar pontos para 0 apos reiniciar")
        XCTAssertFalse(viewModel.animal.isEmpty, "Deve ter um novo animal apos reiniciar")
    }
}
