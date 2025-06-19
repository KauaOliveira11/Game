require "menu"
require "game"

state = "intro"  -- Começa no estado "intro"
tempoIntro = 0
tempoIntroMax = 3  -- tempo em segundos da intro

function love.load()
    love.mouse.setVisible(false) -- para tirar o mouse da janela do jogo
    menu_load()
    game_load()
end

function love.update(dt)
    if state == "intro" then
        tempoIntro = tempoIntro + dt
        if tempoIntro >= tempoIntroMax then
            state = "menu"
        end
    elseif state == "menu" then
        menu_update(dt)
    elseif state == "game" then
        game_update(dt)
    end
end

function love.draw()
    if state == "intro" then
        -- tela preta com texto da intro
        love.graphics.clear(0, 0, 0)
        local fonteIntro = love.graphics.newFont(32)
        love.graphics.setFont(fonteIntro)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Produção", 0, love.graphics.getHeight()/2-50 , love.graphics.getWidth(), "center")
        love.graphics.printf("Kauã Silva Oliveira", 0, love.graphics.getHeight()/2+0 , love.graphics.getWidth(), "center")
        love.graphics.printf("Lemos", 0, love.graphics.getHeight()/2+50 , love.graphics.getWidth(), "center")
        love.graphics.printf("Gill", 0, love.graphics.getHeight()/2+100 , love.graphics.getWidth(), "center")

    elseif state == "menu" then
        menu_draw()
    elseif state == "game" then
        game_draw()
    end
end

function love.keypressed(key)
    if state == "intro" then
        -- se apertar uma tecla, pula a intro direto pro menu
        state = "menu"
    elseif state == "menu" then
        menu_keypressed(key)
    elseif state == "game" then
        game_keypressed(key)
    end
end
