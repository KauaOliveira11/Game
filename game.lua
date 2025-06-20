-- game.lua

-- Variáveis globais do game

--player
local playerX, playerY
local tamanhoNormal = 200
local tamanhoAbaixado = 100
local tamanhoAtual = tamanhoNormal

local velocidade = 100
local velocidade_corrida = 200

local abaixando = false
local estavaAbaixando = false

--tamanho tela

arenaLargura = 800
arenaAltura = 600

local imagem

function game_load()
    playerX = 100
    playerY = 100
    imagem = love.graphics.newImage("Imagens/Personagem.png")
end

function game_update(dt)
    abaixando = love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")

    if abaixando and not estavaAbaixando then
        playerY = playerY + (tamanhoNormal - tamanhoAbaixado)
        tamanhoAtual = tamanhoAbaixado
    elseif not abaixando and estavaAbaixando then
        playerY = playerY - (tamanhoNormal - tamanhoAbaixado)
        tamanhoAtual = tamanhoNormal
    end

    estavaAbaixando = abaixando

    local velocidadeAtual = love.keyboard.isDown("lshift") and velocidade_corrida or velocidade

    if love.keyboard.isDown("d") then 
        playerX = playerX + velocidadeAtual * dt % velocidade -- % normaliza pro máximo ser a
    end                                           -- var velocidade(por ser hipotenusa)
    if love.keyboard.isDown("a") then 
        playerX = playerX - velocidadeAtual * dt % velocidade
    end
    if love.keyboard.isDown("w") then 
        playerY = playerY - velocidadeAtual * dt % velocidade
    end
    if love.keyboard.isDown("s") then 
        playerY = playerY + velocidadeAtual * dt % velocidade
    end
end

function game_draw()
    love.graphics.setColor(1, 1, 1) 
    love.graphics.draw(imagem, playerX, playerY, 0, tamanhoAtual / imagem:getWidth(), tamanhoAtual / imagem:getHeight())
end

function game_keypressed(key)
    if key == "escape" then
        state = "menu"  -- Volta pro menu
    end
end
