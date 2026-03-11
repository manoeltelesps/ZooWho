//
//  C08UITests.swift
//  C08UITests
//
//  Created by Claude on 11/03/26.
//

import XCTest

final class C08UITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    // MARK: - Teste de UI: Elementos principais da tela estao visiveis
    func testElementosPrincipaisDaTelaExistem() {
        // Titulo do jogo
        XCTAssertTrue(
            app.staticTexts["O que é, O que é?"].waitForExistence(timeout: 5),
            "Titulo deve estar visivel"
        )

        // Subtitulo
        XCTAssertTrue(
            app.staticTexts["Adivinhe os animais pelas dicas!"].exists,
            "Subtitulo deve estar visivel"
        )

        // Secao de dicas
        XCTAssertTrue(
            app.staticTexts["Dicas"].exists,
            "Label de Dicas deve estar visivel"
        )

        // Botao de gravar
        XCTAssertTrue(
            app.staticTexts["Gravar resposta"].exists,
            "Botao de gravar resposta deve estar visivel"
        )
    }
}
