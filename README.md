## Projekt z wykorzystaniem CIS Benchmarks w ramach przedmiotu Efektywne strategie ochrony organizacji

### Czego dotyczy hardening i audyt?

System: Ubuntu Linux 14.04 LTS

Na podstawie: CIS Ubuntu Linux 26.04 LTS Benchmark (v1.0.0 - 08-26-2026)

### Lista zaleceń
Większosć zaleceń z sekcji **3 Network**:

**3.1 Configure Network Devices** (1 zalecenie dla level 1 workstation)

**3.2 Configure Network Kernel Modules** (7 zaleceń dla level 1 workstation)

**3.3.1 Configure IPv4 parameters** (19 zaleceń dla level 1 workstation)
    
i sekcja **4 Host Based Firewall** (4 zaleceń dla level 1 workstation)

### Na co pozwalają skrypty?
Zautomatyzowany audyt i hardening w/w zaleceń

Zalecenie *3.2.7 Ensure unneeded network protocol kernel modules are not available* można zweryfikować i zastosować częściowo. Według benchmarku powinno się stworzyć listę niepotrzebnych modułów, a następnie uniemożliwić ich wykorzystanie. Ze względu na to, że zakładam hipotetycznie do czego ten system mógłby być wykorzystywany, trudno mi stworzyć taką kompletną listę. Zarówno 
audyt jak i hardening zautomatyzowałam dla kilku modułów, o których znalazłam informacje, że są przestarzałe lub mają bardzo wąskie zastosowanie. Audyt pokaże wynik "wdrożone" jeśli wszystkie wymienione moduły będą zablokowane:
- appletalk
- ax25
- netrom
- x25
- rose

### Audyt
#### Aby przeprowadzić audyt danego zalecenia należy:

1. w folderze `audit_scripts` znaleść plik dotyczący danego zalecenia
2. nadać plikowi uprawnienia, np. `chmod +x nazwa_skryptu.sh`
3. uruchomić skrypt jako root (niektóre zalecenia wymagają tego, aby zadziałać), np. `sudo ./nazwa_skryptu.sh`

#### Aby przeprowadzić audyt wszystkich zaleceń, których dotyczy ten projekt, należy:

1. nadać plikowi uprawnienia, `chmod +x run_audit_scripts.sh`
2. uruchomić skrypt jako root (niektóre zalecenia wymagają tego, aby zadziałać), np. `sudo ./run_audit_scripts.sh`

### Hardening
#### Aby przeprowadzić herdening danego zalecenia należy:

1. w folderze `hardening_scripts` znaleść plik dotyczący danego zalecenia
2. nadać plikowi uprawnienia, np. `chmod +x nazwa_skryptu.sh`
3. uruchomić skrypt jako root (niektóre zalecenia wymagają tego, aby zadziałać), np. `sudo ./nazwa_skryptu.sh`

#### Aby przeprowadzić audyt wszystkich zaleceń, których dotyczy ten projekt, należy:

1. nadać plikowi uprawnienia, `chmod +x run_hardening_scripts.sh`
2. uruchomić skrypt jako root (niektóre zalecenia wymagają tego, aby zadziałać), np. `sudo ./run_hardening_scripts.sh`
