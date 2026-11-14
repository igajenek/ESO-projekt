#!/usr/bin/env bash

AUDIT_DIR="audit_scripts"

passed=0
partial=0
failed=0
total=0

if [ ! -d "$AUDIT_DIR" ]; then
    echo "Błąd: Folder '$AUDIT_DIR' nie istnieje"
    exit 1
fi

for script in "$AUDIT_DIR"/*.sh; do
    if [ -f "$script" ]; then
        total=$((total + 1))
        script_name=$(basename "$script")
        
        echo -n "Testowanie [$script_name]... "
        
        bash "$script"
        status=$?

        case $status in
            0)
                echo -e "\033[32m[SPEŁNIONE]\033[0m"
                passed=$((passed + 1))
                ;;
            2)
                echo -e "\033[33m[CZĘŚCIOWO SPEŁNIONE]\033[0m"
                partial=$((partial + 1))
                ;;
            *)
                echo -e "\033[31m[NIESPEŁNIONE]\033[0m"
                failed=$((failed + 1))
                ;;
        esac
    fi
done

echo "             PODSUMOWANIE                 "
echo " Łączna liczba testów: $total"
echo -e " Spełnione:     \033[32m$passed\033[0m"
echo -e " Częściowo:  \033[33m$partial\033[0m"
echo -e " Niespełnione:  \033[31m$failed\033[0m"
