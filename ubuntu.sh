#!/bin/bash

#Author: Edvaldo Siqueira - contato.edvaldosiqueira@gmail.com
#Discribe: Script Automatizado para atualização em distribuições Linux baseadas em Debian.
#Version: 3.0
#License: GPL

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

#-------------------------------------------------------------------------------------------------------

#Atualização de sistema
echo -e "${BLUE}   *** ÍNICIO DA ATUALIZAÇÃO DE SISTEMA ***${NC}";sleep 1

   apt-get update &> /dev/null
   apt-get upgrade -y &> /dev/null
   apt-get dist-upgrde -y &> /dev/null
   pkcon update -y &> /dev/null

echo -e "${GREEN}   *** ATUALIZAÇÃO CONCLUÍDA ***${NC}";sleep 2

#-------------------------------------------------------------------------------------------------------

# Instalando o nala -Download de pacotes mais rapidos-
sudo apt install -y nala

echo -e "${GREEN}   *** INSTALAÇÃO NALA CONCLUIDA ***${NC}";sleep 2

#-------------------------------------------------------------------------------------------------------

# Atualizando o sistema usando o nala
sudo nala update
sudo nala upgrade

echo -e "${GREEN}   *** ATUALIZAÇÃO (NALA) CONCLUIDA ***${NC}";sleep 2

#-------------------------------------------------------------------------------------------------------

# instalando pacotes basicos usando o nala
sudo nala install timeshift stacer preload prelink neovim ubuntu-restricted-extras ubuntu-drivers-common tlp curl git vlc wget

echo -e "${GREEN}   *** INSTALAÇÃO DE PACOTES BASICOS E DRIVERS CONCLUIDA ***${NC}";sleep 2

#-------------------------------------------------------------------------------------------------------

# Instalando navegador brave
sudo nala install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser

echo -e "${GREEN}   *** INSTALAÇÃO NAVEGADOR BRAVE CONCLUIDA ***${NC}";sleep 2

#-------------------------------------------------------------------------------------------------------

# Baixando apps onlyoffice / vscode / anydesk 
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
wget https://az764295.vo.msecnd.net/stable/b3e4e68a0bc097f0ae7907b217c1119af9e03435/code_1.78.2-1683731010_amd64.deb
wget https://download.anydesk.com/linux/anydesk_6.2.1-1_amd64.deb

# Instalando apps 
sudo dpkg -i *.deb
sudo nala install -f

echo -e "${GREEN}   *** INSTALAÇÃO ONLYOFFICE/VSCODE/ANYDESK CONCLUIDA ***${NC}";sleep 2

#--------------------------------------------------------------------------------------------------------

#Atualização dos flatpak
echo -e "${BLUE}   *** ATUALIZAÇÃO DOS FLATPAK ***${NC}";sleep 1

   flatpak update &> /dev/null

echo -e "${GREEN}   *** ATUALIZAÇÃO DOS FLATPAK CONCLUÍDA ***${NC}";sleep 2

#-------------------------------------------------------------------------------------------------------

#Atualização dos snap
echo -e "${BLUE}   *** ATUALIZAÇÃO DOS SNAP ***${NC}";sleep 1
   
   snap refresh &> /dev/null

 echo -e "${GREEN}   *** ATUALIZAÇÃO DOS SNAP CONCLUÍDA ***${NC}";sleep 2

#-------------------------------------------------------------------------------------------------------

#Limpeza de repositório, remover arquivos absoletos e desnessários.
echo -e "${BLUE}   *** INICIANDO LIMPEZA DE SISTEMA ***${NC}";sleep 1

   apt-get autoremove -y &> /dev/null 
   apt-get autoclean -y &> /dev/null 
   apt-get clean -y &> /dev/null 

echo -e "${GREEN}   *** LIMPEZA CONCLUÍDA ***${NC}";sleep 2
#-------------------------------------------------------------------------------------------------------

echo -e "${BLUE}   *** Deseja reiniciar o sistema, para atualizações sujam efeito digite \"Sim(s)\" ou \"Não(n)\" para encerar ***${NC}"
read CONFIRMA

case $CONFIRMA in 
    "s")
        reboot 
    ;;

    "n")
        reset            
    ;;

    *)
        echo -e "${RED}   *** OPÇÃO INVÁLIDA ***${NC}"
    ;;
esac 
