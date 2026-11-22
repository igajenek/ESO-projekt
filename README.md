## Projekt z wykorzystaniem CIS Benchmarks w ramach przedmiotu Efektywne strategie ochrony organizacji

### Czego dotyczy hardening i audyt?

System: Ubuntu Linux 14.04 LTS

Na podstawie: CIS Ubuntu Linux 26.04 LTS Benchmark (v1.0.0 - 08-26-2026)

### Lista zaleceń
Większosć zaleceń z sekcji **3 Network**:

**3.1 Configure Network Devices**
- 3.1.1 Ensure IPv6 status is identified

**3.2 Configure Network Kernel Modules**
- 3.2.1 Ensure atm kernel module is not available 
- 3.2.2 Ensure can kernel module is not available 
- 3.2.3 Ensure dccp kernel module is not available 
- 3.2.4 Ensure rds kernel module is not available 
- 3.2.5 Ensure sctp kernel module is not available 
- 3.2.6 Ensure tipc kernel module is not available 
- 3.2.7 Ensure unneeded network protocol kernel modules are not available 

**3.3.1 Configure IPv4 parameters**
- 3.3.1.1 Ensure net.ipv4.ip_forward is configured 
- 3.3.1.2 Ensure net.ipv4.conf.all.forwarding is configured 
- 3.3.1.3 Ensure net.ipv4.conf.default.forwarding is configured 
- 3.3.1.4 Ensure net.ipv4.conf.all.send_redirects is configured 
- 3.3.1.5 Ensure net.ipv4.conf.default.send_redirects is configured 
- 3.3.1.6 Ensure net.ipv4.icmp_ignore_bogus_error_responses is configured 
- 3.3.1.7 Ensure net.ipv4.icmp_echo_ignore_broadcasts is configured 
- 3.3.1.8 Ensure net.ipv4.conf.all.accept_redirects is configured 
-  3.3.1.9 Ensure net.ipv4.conf.default.accept_redirects is configured 
-  3.3.1.10 Ensure net.ipv4.conf.all.secure_redirects is configured
- 3.3.1.11 Ensure net.ipv4.conf.default.secure_redirects is configured 
-  3.3.1.12 Ensure net.ipv4.conf.all.rp_filter is configured
- 3.3.1.13 Ensure net.ipv4.conf.default.rp_filter is configured 
- 3.3.1.14 Ensure net.ipv4.conf.all.accept_source_route is configured
- 3.3.1.15 Ensure net.ipv4.conf.default.accept_source_route is configured
-  3.3.1.16 Ensure net.ipv4.conf.all.log_martians is configured
- 3.3.1.17 Ensure net.ipv4.conf.default.log_martians is configured 
- 3.3.1.18 Ensure net.ipv4.tcp_syncookies is configured
-  3.3.1.19 Ensure net.ipv4.conf.all.route_localnet is configured 
    
i sekcja **4 Host Based Firewall**
- 4.1.1 Ensure ufw is installed
- 4.1.2 Ensure ufw service is configured 
- 4.1.3 Ensure ufw incoming default is configured 
- 4.1.5 Ensure ufw routed default is configured

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

#### Aby przeprowadzić hardening wszystkich zaleceń, których dotyczy ten projekt, należy:

1. nadać plikowi uprawnienia, `chmod +x run_hardening_scripts.sh`
2. uruchomić skrypt jako root (niektóre zalecenia wymagają tego, aby zadziałać), np. `sudo ./run_hardening_scripts.sh`
