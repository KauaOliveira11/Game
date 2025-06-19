local fundo_Menu
local fonte_Menu  -- nova variável para a fonte

function menu_load()
    selected = 1
    options = {"Jogar", "Sair"}

    fundo_Menu = love.graphics.newImage("Imagens/FundoMenu.png")

    -- Criar uma fonte maior
    fonte_Menu = love.graphics.newFont(48)  -- você pode ajustar o tamanho aqui
end

function menu_update(dt)
    -- movimentação do menu
end

function menu_draw()
    love.graphics.setColor(1,1,1)
    love.graphics.draw(fundo_Menu, 0, 0)

    -- Definir a fonte antes de desenhar o texto
    love.graphics.setFont(fonte_Menu)

    love.graphics.printf("Nome do game", 0, 100, love.graphics.getWidth(), "center")

    for i, option in ipairs(options) do
        local y = 200 + i * 70  -- aumentei um pouco o espaçamento também
        if i == selected then
            love.graphics.setColor(1, 1, 0)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.printf(option, 0, y, love.graphics.getWidth(), "center")
    end
end

function menu_keypressed(key)
    if key == "down" then
        selected = selected % #options + 1
    elseif key == "up" then
        selected = (selected - 2) % #options + 1
    elseif key == "return" then
        if options[selected] == "Jogar" then
            state = "game"
        elseif options[selected] == "Sair" then
            love.event.quit()
        end
    end
end
