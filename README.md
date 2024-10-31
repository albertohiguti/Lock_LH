# Fechadura VHDL

Este projeto implementa um sistema simplificado de uma fechadura eletrônica. O sistema permite que o usuário coloque a senha e, caso a senha esteja correta e o timer seja maior que zero, a fechadura é destravada. Caso contrário, a fechadura permanece travada.

## Visão Geral

O projeto foi dividido em duas etapas principais: a modelagem de componentes digitais em VHDL (VHSIC Hardware Description Language) e a síntese/prototipação em FPGA (Field-Programmable Gate Array).

Os principais componentes implementados foram:

- Entidade trava: Responsável por controlar o desbloqueio da fechadura mediante a inserção de uma senha binária de 8 bits. Além de um temporizador para limitar o tempo de tentativas de senha.
- Entidade binto7seg: Um decodificador binário que converte a entrada de um número binário em sua representação hexadecimal, exibindo o valor em um display de 7 segmentos. 

Além da modelagem dos componentes, o trabalho envolveu a criação de testbenches para validar as funcionalidades das entidades, tanto em simulação quanto no hardware físico. Para a prototipação, foi utilizada a FPGA Altera DE-0, disponível no laboratório da disciplina, onde os componentes foram interligados e testados em tempo real.

## Tecnologias Utilizadas

- VHDL (VHSIC Hardware Description Language)
- Quartus Prime Lite Edition
- FPGA Altera DE-0

## Autores
|  [<img src="https://github.com/edu010101.png?size=460&u=071f7791bb03f8e102d835bdb9c2f0d3d24e8a34&v=4" width=115><br><sub>Eduardo Lopes</sub>](https://github.com/edu010101) |  [<img src="https://github.com/albertohiguti.png?size=460&u=071f7791bb03f8e102d835bdb9c2f0d3d24e8a34&v=4" width=115><br><sub>Alberto Higuti</sub>](https://github.com/albertohiguti) 
| :---: | :---: |