#!/bin/bash
clear

function titulo() {
    echo -e "\033[38;2;0;255;0m   _______    ________  _________       __  __    ______    \033[m"
    echo -e "\033[38;2;0;255;0m  /______/\  /_______/\/________/\     /_/\/_/\  /_____/\   \033[m"
    echo -e "\033[38;2;0;255;0m  \::::__\/__\__.::._\/\__.::.__\/     \:\ \:\ \ \:::_ \ \  \033[m"
    echo -e "\033[38;2;0;255;0m   \:\ /____/\  \::\ \    \::\ \        \:\ \:\ \ \:(_) \ \ \033[m"
    echo -e "\033[38;2;0;255;0m    \:\|_  _\/  _\::\ \_   \::\ \   ____ \:\ \:\ \ \: ___\/ \033[m"
    echo -e "\033[38;2;0;255;0m     \:\_\ \ \ /__\::\__/\  \::\ \ /___/\ \:\_\:\ \ \ \ \   \033[m"
    echo -e "\033[38;2;0;255;0m      \_____\/ \________\/   \__\/ \_::\/  \_____\/  \_\/   \033[m"
    echo -e "\033[38;2;0;255;0m==============================================================\033[m"
    echo -e "\033[38;2;0;255;0m|                     Qual comando?                          |\033[m"
    echo -e "\033[38;2;0;255;0m==============================================================\033[m"
    echo -e "\033[38;2;0;255;0m==============================================================\033[m"
    echo -e "\033[38;2;0;255;0m|                                                            |\033[m"
    echo -e "\033[38;2;0;255;0m|                [01] Permissão a pasta                      |\033[m"
    echo -e "\033[38;2;0;255;0m|                [02] Apagar a linha de tempo .git           |\033[m"
    echo -e "\033[38;2;0;255;0m|                [03] Iniciar uma linha de tempo             |\033[m"
    echo -e "\033[38;2;0;255;0m|                [04] Atualizar projeto add .                |\033[m"
    echo -e "\033[38;2;0;255;0m|                [05] Atualizar email de acesso              |\033[m"
    echo -e "\033[38;2;0;255;0m|                                                            |\033[m"
    echo -e "\033[38;2;0;255;0m==============================================================\033[m"
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
        emailG
    fi

}

function /titulo() {
    echo "======================================================================="
    echo "|                           Concuido o envio do Git_UP                |"
    echo "======================================================================="
}



function Permissao() {
    sudo chown -R -v "ascoid" /Git_Up
    /titulo
}

function apaga_git() {
    # Apaga o .git para iniciar um novo
    sudo rm -r .git
    /titulo
}

function inicio_git() {

    # Inicio de um nova linha de tempo
    echo -e "\033[38;2;255;0;0m[+] Iniciado init\033[m"
    git init
    echo ""
    echo -e "\033[38;2;255;0;0m[+] Iniciado add .\033[m"
    git add .
    echo ""
    echo -e "\033[38;2;0;255;0m[+]Qual comentario do commit?\033[m"
    read commit
    echo ""
    echo -e "\033[38;2;0;255;0m[+] Qual linha 1 - [main] or 2 - [master]\033[m"
    read origen

    if [ "$origen" -eq 1 ];
    then
        origen="main"
    else
        origen="master"
    fi

    echo ""
    echo -e "\033[38;2;255;0;0m[+] Iniciado commit\033[m"
    echo ""
    git commit -m "$commit"
    echo ""
    echo -e "\033[38;2;255;0;0m[+] Iniado branch -M [ $origen ]\033[m"
    echo ""
    git branch -M main
    echo ""


    echo -e "\033[38;2;0;255;0m[+]Qual diretorio remoto?\033[m"
    read gitlocal


    echo -e "\033[38;2;255;0;m[+] Iniciado remote add origin\033[m"
    echo ""
    git remote add origin "$gitlocal"
    echo ""
    echo -e "\033[38;2;255;0;m[+] Iniciado push -f origen\033[m"
    echo ""
    git push -f origin main
    echo ""

}

function atualiza_git() {
    # Atualizaçao simples de envio/atualzaçao
    git add .
    echo "======================================================================="
    echo "|                           Qual comentario do commit?                |"
    echo "======================================================================="
    read commit
    git commit -m "$commit"

    echo "======================================================================="
    echo "|                               Pasta que vc esta!                    |"
    echo "======================================================================="
    pwd
    echo ""

    echo "======================================================================="
    echo "|                           Origin que esta informado                 |"
    echo "======================================================================="
    git remote -v 
    echo ""

    echo "======================================================================="
    echo "|                        Qual mudar a Origin? [s] ou [n]              |"
    echo "======================================================================="
    read res
    echo ""

    if [ $res = "s" ];
    then
        echo "======================================================================="
        echo "|            Qual origin? exp.git@github.com:Ascoid/Doc.git           |"
        echo "======================================================================="
        read origin
        git remote add origin "$origin"
        git push -f origin main
    elif [ $res = "n" ];
    then
        git push -f origin master
        /titulo
    else
        echo "======================================================================="
        echo "|                          Erro na resposta!!                         |"
        echo "======================================================================="
    fi
}

function emailG() {
    echo ""
    echo -e "\033[38;2;0;255;0m[+]Qual email?\033[m"
    read emailG
    git config --global user.email "$emailG"
    echo -e "\033[38;2;0;255;0m[+]Qual usuario?\033[m"
    read user
    git config --global user.name "$user"
    echo -e "\033[38;2;255;0;0m[+] Concluido!\033[m"

}

################# Chamado de Funcrtion ##################
titulo



