#!/bin/bash
clear

function titulo() {
echo "   _______     ________    _________            __  __     ______    "
echo "  /______/\   /_______/\  /________/\          /_/\/_/\   /_____/\   "
echo "  \::::__\/__ \__.::._\/  \__.::.__\/          \:\ \:\ \  \:::_ \ \  "
echo "   \:\ /____/\   \::\ \      \::\ \             \:\ \:\ \  \:(_) \ \ "
echo "    \:\|_  _\/   _\::\ \__    \::\ \    _______  \:\ \:\ \  \: ___\/ "
echo "     \:\_\ \ \  /__\::\__/\    \::\ \  /______/\  \:\_\:\ \  \ \ \   "
echo "      \_____\/  \________\/     \__\/  \__::::\/   \_____\/   \_\/   "
echo "======================================================================="
echo "|                              Qual comando?                          |"
echo "======================================================================="
echo "======================================================================="
echo "|                                                                     |"
echo "|                         [01] Permissão a pasta                      |"
echo "|                         [02] Apagar a linha de tempo .git           |"
echo "|                         [03] Iniciar uma linha de tempo             |"
echo "|                         [04] Atualizar projeto add .                |"
echo "|                         [05] Instando o Git hub                     |"
echo "|                                                                     |"
echo "======================================================================="
read dado

if [ "$dado" -eq 1 ];
then
    Permissao
elif [ "$dado" -eq 2 ];
then
    apaga_git
elif [ "$dado" -eq 3 ];
then
    inicio_git  
elif [ "$dado" -eq 4 ];
then
    atualiza_git
else
    Install_git
fi

}

function /titulo() {
echo "======================================================================="
echo "|                                 Envio do Git_UP                     |"
echo "======================================================================="
}

function Permissao() {
echo "======================================================================="
echo "|                               Pasta de destino!                     |"
echo "======================================================================="
echo ""
pwd
echo ""
echo "======================================================================="
echo "|                      Qual pasta vc quer dar a permissão?            |"
echo "======================================================================="
read commit
echo ""
sudo chown -R -v "ascoid" "$commit"
echo ""
/titulo
}

function apaga_git() {
echo ""
# Apaga o .git para iniciar um novo
sudo rm -r .git
echo ""
/titulo
}

function inicio_git() {               # [03] Iniciar uma linha de tempo 
# Inicio de um nova linha de tempo
echo "======================================================================="
echo "|                           Qual comentario do commit?                |"
echo "======================================================================="
read commit
echo ""
echo "$commit"
echo "======================================================================="
echo "|                           Qual o seu email do Git hub?              |"
echo "======================================================================="
read git_email
echo ""
echo "======================================================================="
echo "|                           Qual o seu nome do Git hub?              |"
echo "======================================================================="
read name_git
echo ""
echo "======================================================================="
echo "|            Qual origin? exp.git@github.com:rafpneves/Doc.git           |"
echo "======================================================================="
read origin
echo ""

git init
git add .
git config --global user.email "$git_email"
git config --global user.name "$name_git"
git commit -m "$commit"
git branch -M main
git remote add origin "$origin"
git push -u origin main

echo ""
/titulo
}

function atualiza_git() {
# Atualização simples de envio/atualização
git add .
echo "======================================================================="
echo "|                           Qual comentario do commit?                |"
echo "======================================================================="
read commit
echo ""
git commit -m "$commit"
echo ""
echo "======================================================================="
echo "|                               Pasta de destino!                     |"
echo "======================================================================="
echo ""
pwd
echo ""

echo "======================================================================="
echo "|                                    Origin!                          |"
echo "======================================================================="
echo ""
git remote -v 
echo ""

echo "======================================================================="
echo "|                        Qual mudar a Origin? [s] ou [n]              |"
echo "======================================================================="
read res

if [ $res = "s" ];
then
    echo "======================================================================="
    echo "|            Qual origin? exp.git@github.com:rafpneves/Doc.git        |"
    echo "======================================================================="
    read origin
    echo ""
    git remote add origin "$origin"
    git push -u origin main
    echo ""
elif [ $res = "n" ];
then
    echo ""
	git push -u origin main
    echo ""
    /titulo
else
    echo "======================================================================="
    echo "|                          Erro na resposta!!                         |"
    echo "======================================================================="
fi

}

function Install_git() {
    echo "======================================================================="
    echo "|                                 Iniciando instalação                |"
    echo "======================================================================="
    sudo apt update
    sudo apt install git
    echo ""
    echo ""
    git --version
}

#################
titulo
