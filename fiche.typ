#set page(
    numbering: "1"
)

#set align(left)
#set text(
    lang: "en",
    size: 12pt
)

#set par(
    first-line-indent: (
        amount: 1.5em,
        all: true,
    ),
    spacing: 0.65em,
    justify: false,
)

#show link: underline

#let jump = (x) => [#line(start: (0pt, x*1pt), length: 0%)]

#let span  = (content, color: red) => [#text(fill:color,content)]

#let Rcell = (content, x) => [#table.cell(content, rowspan: x, align: center + horizon)]

#let Ccell = (content, x) => [#table.cell(content, colspan: x, align: center + horizon)]

#let my_grid = (content_left, content_right, s, l, fleft: 1, fright: 1) => [
    #grid(
        columns: (fleft*1fr, 0.1fr, fright*1fr),
        [#content_left],
        [#line(start: (s*1pt, 0pt), length: l*1%, angle: 90deg)],
        [#content_right]
    )
]

= IN606 -- Fiche de révision

#jump(5)
== Classification des réseaux
#jump(2)

#table(
    columns: 5,
    align: center,
    inset: 10pt,
    table.header(
        [*Name*], [*Abréviation*], [*Couverture*], [*Débit*], [*Exemples*]
    ),
    [Réseaux Personnels], [#span("PAN")], [10-100m], [quelques Mbits/s], [Bluetooth, Homeref, ...],
    [Réseaux Locaux], [#span("LAN")], [100-1000m], [quelques dizaines de Mbits/s], [Ethernet, Token Ring, Wifi, HipperLan],
    [Réseaux Métropolitains], [#span("MAN")], [la taille d'une ville], [quelques  dizaines Mbits/s], [FDDI, DQDB, ATM, WiMax, ...],
    [Réseaux Locaux], [#span("WAN")], [Mondiale], [quelques Mbits/s], [RNIS, IP, ATM, WATM, GSM, ...],
)

#jump(2)
== Topologies
#jump(2)

- Logique: le mode d’échange des messages dans le réseau

- Physique: raccordement des machines $->$ deux types de liaisons: point-à-point ou multipoints
#align(center, [#image("img1.png", height: 10%)])

#jump(2)
== Topologies -- Physique
#jump(2)

- Bus
- Etoile
- Anneau

Topologies construites : dérivés des réseaux en étoiles
#align(center, [#image("img2.png", height: 10%)])

#pagebreak()
== Modes de mise en relation
#jump(2)

Deux modes de fonctionnement pour transiter les informations
#jump(1)
- Mode non connnecté (Datagramme)
    - Une seule phase (Transfert des données)
    - Simple
    - Plusieurs chemins possibles
#align(center, [#image("img3.png", height: 10%)])
#jump(2)
- Mode connnecté (Circuit virtuel,CV/circuit physique)
    - Etablissement d’une connexion
    - Transfert des données
    - Libération de la connexion
        - Service fiable
        - Complexe
        - Chemin dédié
        - Circuits commutés (SVC)
        - ou Circuits permanent(PVC)
#align(center, [#image("img4.png", height: 10%)])
#jump(2)
- Technique de commutation la manière d’interconnecter 2 correspondants
- Le fonctionnement d’un nœud (routeur/switch)
- Nombre de liens=N(N+1)/2 (N: nombre de nœuds)
- Temps de traversée du réseau Tp : $"Tp" = (L + "pH")(1+ N/p)/D$\
    #span("L") : longueur de mesage\
    #span("N") : nombre de nœuds\
    #span("p") : nombre de paquets\
    #span("H") : entête protocole\
    #span("D") : débit

#jump(2)
- Techniques de commutation
    - Commutation de circuit $(p=1, N=0)$
    - Commutation de messages $(p=1, N>0)$
    - Commutation de paquets
    - Commutation de trames
    - Commutation de cellules

#pagebreak()
== Le réseau Coeur
#jump(2)
- Réseau maillés de routeurs
- #span("La question fondamentale") :\
    Comment les données sont transférées à travers le réseau ?
    - #span("Commutation de circuits") :\
        circuit dédié par appel : réseau téléphonique
    - #span("Commutation de paquets") :\
        données envoyées sur le réseau par “morceaux”

#jump(2)
== Fonction du Protocole dans le réseau de communication
#jump(2)

- L'importance des protocoles et comment ils sont utilisés pour faciliter la communication sur les réseaux de données
    - Un protocole est un ensemble de règles prédéterminées
#jump(1)
- Les protocoles réseau sont utilisés pour permettre aux périphériques de communiquer avec succès
#jump(1)
- Les suites du protocole et les normes de l'industrie
    - Une norme est un processus ou un protocole qui a été approuvé par l'industrie des réseaux et ratifié par un organisme de normalisation
#jump(1)
- Interactions entre protocoles
#align(center, [#image("img5.png", height: 15%)])
#jump(1)
- Indépendance du matériel (dispositif)
    - Beaucoup de divers types de dispositifs peuvent communiquer en utilisant les mêmes ensembles de protocoles. C'est parce que les protocoles spécifient les fonctionnalités du réseau, pas la technologie sous-jacente à la charge cette fonctionnalité.

#pagebreak()
== Les couches de protocoles : modèle OSI et modèle TCP/IP
#jump(5)

#table(
    columns: 3,
    align: center,
    inset: 10pt,
    table.header(
        [*Couches OSI*], [*Fonctions*], [*Modèle TCP/IP*]
    ),
    [Application], [Applications réseaux : transfert de fichiers.], [#Rcell("Application",3)],
    [Présentation], [Formatage et cryptage des données],
    [Session], [Etablissement et maintien des sessions],
    [Transport], [Transport de bout en bout, fiable et non fiable], [Transport],
    [Réseau], [Envoi et routage des paquets de données], [Internet *--* Interface],
    [Liaison], [Transfert des unités d’informations et contrôle d’erreurs], [#Rcell("Matériel",2)],
    [Physique], [Transmission des données binaires],
)

#jump(5)

#table(
    columns: 7,
    align: center,
    inset: 10pt,
    table.header(
        [Application], [File Transfer], [Mail], [Terminal Emulation], [File Transfer], [Client Server], [Réseau Mgmt], 
    ),
    [Présentation], [#Rcell([#span("FTP")],2)], [#Rcell([#span("SMTP")],2)], [#Rcell([#span("TELNET")],2)], [#Rcell([#span("TFTP")],2)], [#Rcell([#span("NFS")],2)], [#Rcell([#span("SNMP")],2)],
    [Session],
    [Transport], [#Ccell([#span("TCP")],3)], [#Ccell([#span("UDP")],3)],
    [Réseau], [#span([ARP\ *------*\ RARP])], [#span([ARP\ *------*\ RARP\ *------* \ IP])], [#Ccell([#span("IP")],2)], [#span([IP\ *------*\ ICMP])], [#span("ICMP")],
    [Liaison], [#Ccell([Ethernet *--* Token ring *--* Starlan *--* Arcnet *--* FDDI *--* SMDS],6)],
    [Physique], [#Ccell([#span("TP") *--* #span("STP") *--* #span("FO") *--* #span("Satellite") *--* #span("Micro-ondes")], 6)],
)

#align(center, [#image("img6.png",height: 40%)])

#jump(5)
#let content_left = [#table(
    columns: 3,
    align: center,
    inset: 10pt,
    [#Ccell([
        #table(
            columns:4,
            align:center,
            inset: 5pt,
            [#span("SMTP")], [#span("TELNET")], [#span("FTP")], [#span("HTTP")],
            [#span("DNS")], [#span("RIP")], [#span("OSPF")], [#span("SNMP")],
            [#span("PING")], [#span("NFS")], [#span("X11")], [],
        )
    ], 3)],
    [#span("TCP")], [#span("UDP")], [#span("SPX")],
    [#span([IPv4\ *--*\ IPv6])], [#span([ICMP\ *--*\ IGMP])], [#span("IPX")],
    [#Rcell([#span([ARP\ *--*\ RARP])],2)], [#Rcell([#span("ATM")],2)], [#span("SLIP PPP")],
    [#span("RTC ISDN")]
)]

#let content_right = [
    == Les couches et les données Encapsulation/Décapsulation
    #jump(5)
    Lors du passage d'une couche à l'autre des *en-têtes* (Headers) sont utilisés pour encapsuler le message.

    #table(
        columns: 3,
        align: center,
        inset: 10pt,
        table.header(
            [*Couche*], [*État*], [*En-tête courante*]
        ),
        [Application], [Message], [$M$],
        [Transport], [Segment], [$M$*-*$H_t$],
        [Réseau], [Datagram], [$M$*-*$H_t$*-*$H_r$],
        [Liaison], [Frame], [$M$*-*$H_t$*-*$H_r$*-*$M_l$],
        [Physique], [], [*---------*],
    )
]

#my_grid(content_left,content_right, 0, 45)

#pagebreak()
== Applications réseau
#jump(5)

#let content_left = [
    #span("Processus") : Programme s'éxécutant sur un hôte (host).
    - Sur le même hôte, deux processus interagissent en utilisant la #span("communication interprocessus").
    - Processus sur deux machines différentes communiquent par message à travers un protocole de la #span("couche application")
]

#let content_right = [
    #span("Agent utilisateur") : Interfaces avec l'utilisateur au dessus et le réseau en dessous.
    - Implémentations interface utilisateur et le protocole du niveau application
        - Web : navigateur
        - E-mail : lecteur de mail
        - Streaming audio/vidéo: lecteur multimédia
]

#my_grid(content_left,content_right, 10, 20)

#let content_left = [
    #span("Processus distribués") :
    - E-mail, Web, telnet
    - S’exécutant sur les terminaux (hosts)
    - Échangent des messages pour implémenter l’application
]

#let content_right = [
    *#span("Protocole de la couche application")* :
    - Définissent des messages échangés par les applications et les actions prises
    - Utilisent les services de communication fournis par les protocoles de la couche inférieure (#span("TCP"), #span("UDP"))
]

#my_grid(content_left,content_right, 10, 14)

== Protocole de la couche application
#jump(5)

- Types de messages échangés, exemple $->$ Messages de demande et de réponse
- La syntaxe adoptée par les différents types de message : soit les différents champs qu’il contiennent et leur délimitation
- La sémantique des différents champs, c’est à dire le sens des informations qu’ils contiennet
- Les règles utilisées pour déterminer quand et comment un processus doit envoyer ou répondre à un message
#jump(2)
#span("Protocoles domaines publics") :
- Définis dans les RFCs
- Permettent l'interopérabilité
- #span("HTTP"), #span("SMTP"), ...
#span("Protocoles propriétaires") :
- #span("KaZaA"), ...

#jump(2)
== Paradigme Client-Serveur
#jump(5)

#let content_left = [
    #span("Client")
    - Initialise le contact avec le serveur
    - Demande de service au serveur
    - Web: client implementé dans le navigateur, e-mail dans lecteur de mails
]

#let content_right = [
    #span("Serveur")
    - Fournit le service demandé par le client
    - Web server envoie la page Web demandée, mail server délivre e-mail
]

#my_grid(content_left,content_right, 10, 12)

#pagebreak()
== Processus de communication à travers le réseau
#jump(5)

#let content_right = [
    - #span("API") $->$ le choix du protocole de transport
    - La possibilité de définirs quelques paramètres

    == Processus d'adressage :
    #jump(1)
    - Un #span("processus local") à besoin d'identifier le #span("processus distant")
    - Chaque host à une unique adresse #span("IP")
    - Plusieurs processus peuvent être éxécutés sur la même machine. L'identificateur inclut l'#span("IP") et le numéro de #span("port") associé à l'hôte.
]

#my_grid([#image("img7.png",width: 100%)],content_right, 10, 28)

#jump(2)
== Services nécessaires à une application
#jump(5)

#let content_left = [
    #span("Data loss (transfert fiable)")
    - Certaines apps (audio, ...) tolèrent la perte de paquets
    - D'autres apps (file transfer, telnet, ...) exigent 100% transfert des paquets
    #jump(1)
    #span("Contraintes de temps")
    - Certaines apps (Internet telephony, interactive games) demandent un bas délai
]

#let content_right = [
    #span("Bandwidth (débit)")
    - Certaines apps (multimédia, téléphonie par internet, ...) exigent un débit minimal disponible
    - Autres apps (“elastic apps, comme ftp et web”) peuvent s’adapter aux débits disponibles
]

#my_grid(content_left, content_right, 10, 21)

== Fonctionnement de quelques applications de réseau
#jump(5)

#table(
    columns: 4,
    align: center,
    inset: 10pt,
    table.header(
        [*Application*], [*Data loss tolerent*], [*Bandwidth*], [*Time Sensitive*]
    ),
    [File transfer *--* Mails *--* Web documents], [#span("Non", color: rgb("#e84545"))], [Elastic], [#span("Non", color: rgb("#e84545"))],
    [Realtime audio/video], [#span("Oui", color: green)], [audio : 5kbps-1Mbps], [100’s msec],
    [Stored audio/video], [#span("Oui", color: green)], [10kbps-5Mbps], [few secondes],
    [Interactive games], [#span("Oui", color: green)], [10kbps-5Mbps], [100’s msec],
    [Instant messaging], [#span("Non", color: rgb("#e84545"))], [few kbps up], [#span("Oui", color: green) et #span("Non", color: rgb("#e84545"))],
)

#pagebreak()
== DNS : Domain Name System
#jump(5)
Le #span("DNS") est simplement un surnom utilisé pour désigner des les adresse #span("IP") $->$ google.com au lieu de 001011100...\
#span("DNS") :
- #span("Datatbase distribuée", color:blue) implémentée en hiérarchie dans plusieurs name servers
- #span("Protocole couche application") host, routeurs, name servers communiquent pour résoudre noms (translation adresse/ name)
#jump(1)
Pourquoi le DNS est décentralisé ?
Problèmes classiques de débits, scalabilité et de maintenance de la base de données.
#jump(1)
#span("Name serveur locaux") :
- Chaque ISP a son #span("local default serveur", color:blue)
- Host #span("DNS") consulte en premier le name serveur local
#jump(1)
#span("Name server de source autorisée") :
- Pour un hôte : stocke son adresse IP, nom
- Peut accomplir la translation name/address IP

#jump(2)
== Electronic Mail
#jump(5)
#image("img8.png", width: 40%)
