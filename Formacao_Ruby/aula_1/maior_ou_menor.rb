def boas_vindas
  puts 'Bem vindo ao jogo da advinhação!'
  puts "\n\n\n"
  puts 'Qual é o seu nome?'
  nome = gets.strip
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
end

def sorteia_numero_secreto
  puts 'Escolhendo um número secreto entre 0 e 200'
  sorteado = 175
  puts "\n\n\n"
  puts 'Escolhido...quer adivinhar nosso número secreto?'
  sorteado
end

def pede_palpite(chutes, tentativas, limite_de_tentativas)
  puts "Tentativa #{tentativas}  de #{limite_de_tentativas}"
  puts "Chutes até agora:  #{chutes}" 
  puts 'Informe um número: '
  chute = gets.strip.to_i
  puts "\n\n\n"
  puts "Será que acertou??? Você chutou o número #{chute}"
  chute.to_i
end

def verifica_palpite(numero_secreto, chute)
  acertou = numero_secreto == chute
  if acertou
    puts "Você Acertou!"
    return true
  end

    maior = numero_secreto > chute
    if maior
    puts "O número secreto é maior!"
    puts "\n\n"
    else
    puts "O número secreto é menor!"
    puts "\n\n"
    end
  false
end

boas_vindas
numero_secreto = sorteia_numero_secreto

pontos_ate_agora = 1000
limite_de_tentativas = 3
chutes = []

for tentativas in 1..limite_de_tentativas
  chute = pede_palpite(chutes, tentativas, limite_de_tentativas)
  chutes << chute

  pontos_a_perder = (chute - numero_secreto)/2.0
  pontos_ate_agora -= pontos_a_perder

  if verifica_palpite(numero_secreto, chute)  
    break
  end
end

puts "Você ganhou #{pontos_ate_agora} pomtos."
