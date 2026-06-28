#!/bin/bash

# 1. Lista Twoich 20 komend (wklej tu swoje prawdziwe nazwy)
options=("install" "update" "start" "stop" "info" "restart" "backup" "exit")

# Początkowy indeks wybranej pozycji (0 to pierwsza opcja, czyli "install")
selected=0

# Funkcja, która czyści ekran i rysuje menu od nowa przy każdym ruchu strzałką
show_menu() {
    clear
    echo "=== DTL MENU ==="
    echo "Użyj STRZAŁEK i naciśnij ENTER:"
    echo "----------------------------------------"
    
    # Pętla, która wyświetla każdą opcję z listy
    for i in "${!options[@]}"; do
        if [ $i -eq $selected ]; then
            # Jeśli element jest wybrany, wyświetl go w odwróconych kolorach (\e[7m) z kursorem '>'
            echo -e "\e[7m > ${options[$i]} \e[0m"
        else
            # Jeśli nie jest wybrany, wyświetl normalnie
            echo "   ${options[$i]}"
        fi
    done
}

# Główna pętla, która działa w nieskończoność, dopóki nie klikniesz ENTER
while true; do
    show_menu

    # Odczytaj 3 znaki z klawiatury (strzałki w terminalu wysyłają sekwencję 3 znaków, np. ESC + [ + A)
    read -rsn3 key
    
    case "$key" in
        # KOD STRZAŁKI W GÓRĘ
        $'\x1b[A') 
            if [ $selected -gt 0 ]; then
                ((selected--)) # Zmniejsz indeks (idź w górę)
            else
                selected=$((${#options[@]} - 1)) # Jeśli jesteś na samej górze, przeskocz na dół
            fi
            ;;
        # KOD STRZAŁKI W DÓŁ
        $'\x1b[B') 
            if [ $selected -lt $((${#options[@]} - 1)) ]; then
                ((selected++)) # Zwiększ indeks (idź w dół)
            else
                selected=0 # Jeśli jesteś na samym dole, przeskocz na górę
            fi
            ;;
        # KOD DLA ENTERA (pusta wartość lub znak nowej linii)
        ""|$'\x0a'|$'\x0d') 
            break # Wyjdź z pętli – zatwierdzono wybór
            ;;
    esac
done

# Przypisz tekst wybranej opcji do zmiennej (np. "install")
choice="${options[$selected]}"

clear
if [ "$choice" == "exit" ]; then
    echo "Wyjście."
    exit 0
fi

clear
if [ "$choice" == "info" ]; then
    ~/.DTL/launcher/dtl-info.sh
fi

# Uruchomienie Twojego właściwego skryptu z odpowiednią nazwą
~/.DTL/launcher/dtl-"$choice".sh