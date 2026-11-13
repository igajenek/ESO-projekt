#!/bin/bash
[ "$EUID" -ne 0 ] && exit 1

DIR="hardening_scripts"

# podaj numery zaleceń do przeprowadzenia hardeningu
TASKS=("3-2-1" "3-2-2" "3-2-6" "3-2-7")

for TASK in "${TASKS[@]}"; do
    SCRIPT_NAME="$DIR/${TASK}.sh"
    echo "Uruchamianie zalecenia: $TASK ($SCRIPT_NAME)"
    if [ -f "$SCRIPT_NAME" ]; then
        bash "$SCRIPT_NAME"
        if [ $? -eq 0 ]; then
            echo "[SUKCES] zalecenie $TASK wprowadzone."
        else
            echo "[BŁĄD] zalecenie $TASK zakończyło się błędem"
        fi
    else
        echo "[POMINIĘTO] plik $SCRIPT_NAME nie istnieje"
    fi
    echo ""
done
echo "Koniec"