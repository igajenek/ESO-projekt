#!/bin/bash
[ "$EUID" -ne 0 ] && exit 1

DIR="hardening_scripts"

# podaj numery zaleceń do przeprowadzenia hardeningu
TASKS=("3-1-1" "3-2-1" "3-2-2" "3-2-3" "3-2-4" "3-2-5" "3-2-6" "3-2-7" "3-3-1-1" "3-3-1-2" "3-3-1-3" "3-3-1-4" "3-3-1-5" "3-3-1-6" "3-3-1-7" "3-3-1-8" "3-3-1-9" "3-3-1-10" "3-3-1-11" "3-3-1-12" "3-3-1-13" "3-3-1-14" "3-3-1-15" "3-3-1-16" "3-3-1-17" "3-3-1-18" "3-3-1-19" "4-1-1" "4-1-2" "4-1-3" "4-1-5" )

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