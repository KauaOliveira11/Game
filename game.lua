-- game.lua

-- Variáveis globais do game
local x, y
local tamanhoNormal = 200
local tamanhoAbaixado = 20
local tamanhoAtual = tamanhoNormal

local velocidade = 100
local velocidade_corrida = 200

local abaixando = false
local estavaAbaixando = false

local imagem

function game_load()
    x = 100
    y = 100
    imagem = love.graphics.newImage("Imagens/Personagem.png")
end

function game_update(dt)
    abaixando = love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")

    if abaixando and not estavaAbaixando then
        y = y + (tamanhoNormal - tamanhoAbaixado)
        tamanhoAtual = tamanhoAbaixado
    elseif not abaixando and estavaAbaixando then
        y = y - (tamanhoNormal - tamanhoAbaixado)
        tamanhoAtual = tamanhoNormal
    end

    estavaAbaixando = abaixando

    local velocidadeAtual = love.keyboard.isDown("lshift") and velocidade_corrida or velocidade

    if love.keyboard.isDown("d") then 
        x = x + velocidadeAtual * dt 
    end
    if love.keyboard.isDown("a") then 
        x = x - velocidadeAtual * dt     
    end
    if love.keyboard.isDown("w") then 
        y = y - velocidadeAtual * dt 
    end
    if love.keyboard.isDown("s") then 
        y = y + velocidadeAtual * dt 
    end
end

function game_draw()
    love.graphics.setColor(1, 1, 1) 
    love.graphics.draw(imagem, x, y, 0, tamanhoAtual / imagem:getWidth(), tamanhoAtual / imagem:getHeight())
end

function game_keypressed(key)
    if key == "escape" then
        state = "menu"  -- Volta pro menu
    end
end
