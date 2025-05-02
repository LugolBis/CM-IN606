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
#align(center, [#image("img/img1.png", height: 10%)])

#jump(2)
== Topologies -- Physique
#jump(2)

- Bus
- Etoile
- Anneau

Topologies construites : dérivés des réseaux en étoiles
#align(center, [#image("img/img2.png", height: 10%)])

#pagebreak()
== Modes de mise en relation
#jump(2)

Deux modes de fonctionnement pour transiter les informations
#jump(1)
- Mode non connnecté (Datagramme)
    - Une seule phase (Transfert des données)
    - Simple
    - Plusieurs chemins possibles
#align(center, [#image("img/img3.png", height: 10%)])
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
#align(center, [#image("img/img4.png", height: 10%)])
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
#align(center, [#image("img/img5.png", height: 15%)])
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

#align(center, [#image("img/img6.png",height: 40%)])

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

#my_grid([#image("img/img7.png",width: 100%)],content_right, 10, 28)

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

#let content_left = [
    == Electronic Mail
    #jump(5)
    #image("img/img8.png", height: 30%)
]

#let content_right = [
    == Web et HTTP
    #jump(5)
    - #span("Page web") composée des #span("objets")
    - #span("Objets") $->$ fichiers HTML, JPEG, applet Java, ...
    - Web page composée de #span("base HTML-file") qui inclut plusieurs objets référencés
    - Chaque objet est adressé par un #span("URL")
    #jump(1)
    *#span("HTTP")* : hypertext transfer protocole
    - Protocole de la #span("couche application") Web
    - Modèle *Client / Serveur*
        - #span("Client", color: blue) : navigateur qui demande/affiche les *objets* Web
        - #span("Serveur", color: blue) : serveur qui envoie les *objets* demandés
]

#my_grid(content_left,content_right,0,35)

== HTTP (Suite)
#jump(5)

#let content_left = [
    Utilise #span("TCP")
    - Client initiailise *TCP* connection (crée une socket) au serveur, port 80
    - Serveur accepte le connection
    - Messages *HTTP* échangés entre le navigateur et le serveur
    - *TCP*
]

#let content_right = [
    #span("HTTP") : protocole sans mémoire
    - Le *serveur* ne maintient pas l'information concernant les demandes passées du *client*
]

#my_grid(content_left,content_right,0,0)

#pagebreak()
#span("Protocoles avec mémoire sans complexes !")
- Historique (state) doit être maintenu
- Si le *serveur / client* crashent, on garde une image de l'historique pour rétablir l'état d'avant

== HTTP connections
#jump(5)

#let content_left = [
    #span("Non-persistant")
    - Un seul *objet* Web peut être transféré à la fois sur une connexion TCP
    - HTTP/1.0 utilise des connexions non persistantes
    - 2 RTTs / objet $->$ temps de réponse
    - Le système alloue des ressources pour chaque connexion TCP
    - Le navigateur ouvre des connections en parallèle
]

#let content_right = [
    #span("Persistant HTTP")
    - Plusieurs *objet* Web peuvent emprunter la même connexion TCP
    - HTTP/1.1 utilise les connexions persistants par défaut avec pipelinage
    - Le serveur maintient la connexion ouverte même après l'envoi de la réponse
    - Les messages successif entre le client/serveur sont envoyés sur la même connexion
]

#my_grid(content_left,content_right,10,23)

Le #span("Pipelinage") (option par défaut de HTTP/1.1), envoie des requêtes dès qu'il rencontre une référence à un objet $->$ 1 RTT $forall$ les objets référencés *$!=$* #span("Sans Pipelanange") $->$ dépend de l'attente de la réponse à la précédente requête, 1 RTT/objet.\ \
#span("HTTP/1.0") $->$ GET, POST, HEAD (le serveur doit quitter l'objet après la réponse)\
#span("HTTP/1.0") $->$ GET, POST, HEAD, PUT (charge un objet vers un chemin spécifié dans l'URL), DELETE (permet d'effacer un objet d'un serveur web)\
*HTTP* : codes d'état $->$ #span("200-OK", color:green) ; #span("301-Moved Permanently", color:rgb("#eb9641")) ; #span("400-Bad request") ; #span("404-Not found") ; #span("505-HTTP version not supported")

#jump(2)
== FTP : File Transfer Protocole
#jump(5)

Transfert de fichiers vers un hôte distant, utilise le modèle *Client / Serveur* $->$ utilise le port 21. Utilise le protocole #span("TCP") pour le transport,

#let content_left = [
    #span("Simples commandes") :
    - Format ASCII à 7 bits
    - User (username)
    - PASS (password)
    - LIST (comme ```bash ls```)
    - RETR filename (obtenir un fichier à partir du répertoire distant)
    - STOR filename (stocke le fichier dans le répertoire distant)
]

#let content_right = [
    #span("Simples codes de retour") :
    - Code d'état et phrase (comme pour HTTP)
    - #span("331", color:rgb("#eb9641")) Username Ok, password required
    - #span("125", color:green) data connection already open; transfer starting
    - #span("425") Can’t open data connection
    - #span("452") Error writing file
]

#jump(2)
#my_grid(content_left,content_right,10,20, fleft:1.5,fright:1)

#pagebreak()
== Couche de Transport
#jump(5)

Fournit une #span("communication logique") sur des processus d’application exploités sur des serveurs différents. Les protocoles de transport s’exécutent aux extrémités :
- Les messages sont découpés en #span("segments") par l’émetteur
- Le récepteur: reassembles ces #span("segments") en messages
Principaux protocoles de transport pour internet : #span("TCP") et #span("UDP").
#jump(2)

Quelle est la relation entre les couches *Transport* et *Réseau* ?\
*Couche Réseau* : Communication logique entre les machines.\
*Couche Transport* : Communication logique entre les processus.
#jump(2)

#span("TCP") : Délivrance fiable et dans l'ordre
- Contrôle de congestion
- Contrôle de flux
- Initialisation de la connection
*$!=$* #span("UDP") : Délivrance non fiable et en désordre
#jump(2)

== Multiplexage / Démultiplexage
#jump(1)

\ #span("Démultiplexage à rcv host") : Orientation des segments reçus vers la bonne interface "socket".\
#span("Multiplexage à send host") : Rassemblement des données Création des segments en les associant les en-têtes.

=== Démultiplexage sans connexion
#jump(2)

#let content_left = [
    L'hôte reçoit l'#span("IP datagrams") :
    - Chaque datagram a une source adresse *IP* et une destination adresse *IP*
    - Chaque datagram contient un segment transport
    - Chaque segment a des numéros de ports source, destination
    - La machine utilise l'#span("adresse IP") et le #span("n° de port") pour diriger le *segment* au socket approprié
]

#let content_right = [
    #align(center, [
        *TCP* segment format
        #jump(1)
        $<--$ 32 bits $-->$
    ])
    #table(
        columns: 2,
        inset: 10pt,
        align: center,
        table.header(
            [*#span("Source Port")*], [*#span("Destination Port")*]
        ),
        Ccell("Other header fields", 2),
        Ccell("Application data (message)", 2)
    )
]

#my_grid(content_left, content_right, 10, 23)
#jump(2)

*UDP* socket est identifié par le tuple : (*destination IP*, *n° port destination*).\
Quand l'hôte reçoit *UDP* segment :
- Il contrôle le n° de port destination dans le segment
- Il dirige *UDP* segment vers la socket avec le n° de port

#pagebreak()
== Démultiplexage avec Connexion
#jump(5)
*TCP* socket identifiée par le tuple suivant : (*source IP address*, *source  n° port*, *destination IP address*, *ination n° port*). *recv host* utilise ce tuple pour orienter le segment vers la bonne socket.
- Server host peut supporter plusieurs TCP sockets simultanées.
- Web serveurs ont différents sockets pour chaque connexion d'un client.

#jump(2)
== UDP : User Datagram Protocol
#jump(5)

#let content_left = [
    #span("UDP") est un protocole "best effort".\
    Sans connection :
    - Pas d'accord en avance entre UDP sender, receiver
    - Chaque UDP segment est manipulé indépendamment des autres
]

#let content_right = [
    Avantages d'*UDP* :
    - Pas de connexion $->$ pas de délai
    - Simpe $->$ pas d'état de connexion à l'émetteur/récepteur
    - En-tête court de segment (8 octets)
    - Pas de contrôle de congestion
]

#my_grid(content_left,content_right,10,13)

=== Checksum
#jump(2)

#let content_left = [
    Le #span("Checksum") permet la détéection d'erreur sur le segment par le récepteur.\
    #span("Sender") :
    - *$sum "Mot"$*, tq les mots sont sur 16 bits et on élimine les overflow
    - On fait le complément à 1 du résultat
    #span("Rceiver") :
    - *$forall "Mot de" 16 "bits" : sum "Mot"$*
    - Si cette somme $= 1111111111111111 ->$ Pas d'erreur\
        Sinon $->$ Erreur détectée 
]

#let content_right = [
    #align(center, [
        *UDP* segment format
        #jump(1)
        $<--$ 32 bits $-->$
    ])
    #table(
        columns: 2,
        inset: 10pt,
        align: center,
        table.header(
            [*#span("Source Port")*], [*#span("Destination Port")*]
        ),
        [length (in bytes of the segment, including header)], [#span("checksum")],
        Ccell("Application data (message)", 2)
    )
]

#my_grid(content_left,content_right,10,26)

== Principes du transfert de données fiables
#jump(5)

#image("img/img9.png", height: 20%)

#pagebreak()
== Reliable data transfer : initial
#jump(5)

- Développement de façon indépendantes les rdt
de l’émetteur et de récepteur
- On considère seulement unidirectionnel data transfer (le contrôle de flux est bidirectionnel)
- Utilise FSM, un automate avec un nombre fini d'états pour spécifier sender/receiver

#let content_left = [
    == Transfert fiable sur un canal fiable
    #jump(5)

    - Au dessous un canal parfaitement fiable :
        - pas d’ erreurs bit
        - pas de pertes de paquets
    - Séparation des FSMs de sender et receiver:
        - sender envoie des data sur le canal de dessous
        - receiver lit les data de canal de dessous
]

#let content_right = [
    == Transfert sur un canal avec des erreurs de bits
    #jump(5)

    Au dessous un cana qui laisse introduire des erreurs de bits. Comment détecter ces erreurs ?
    - #span("Acknowledgements")  (#span("ACKs")) : Le destinataire notifie
    explicitement l’ émetteur que le paquet est reçu
    - #span("Negative Acknowledgements")  (#span("NACKs")): Le récepteur envoie une
    notification explicitement à l’émetteur qu’il y a une erreur
    dans le paquet
    - Sender retransmet les paquets sur réception d’un NAK
]

#jump(2)
#my_grid(content_left,content_right,6,30,fleft:1,fright:1.5)

=== Erreur fatale !
#jump(3)

Que se passe-t-il si #span("ACK/NAK") erronés ?
- L'émetteur ne sait pas qu'est ce qui se passe chez le destinataire
- Ne peut pas simplement retransmettre à cause de la possibilité de duplication
#jump(1)
Pour éviter la *duplication* :
- L'émetteur ajoute sequence number pour chaque paquet
- L'émetteur retransmet le paquet courant si ACK/ NAK corrompus
- le destinataire écarte le paquet dupliqué
#jump(1)
#span("Stop and wait") : L'émetteur envoie un paquet, puis attend la réponse du récepteur.

#let content_left = [
    #image("img/img10.png", width:100%)
]

#let content_right = [
    #image("img/img11.png", width:100%)
]

#jump(2)
#my_grid(content_left,content_right,6,18,fleft:1,fright:1.1)

#pagebreak()
== TCP segment structure
#jump(5)

#table(
    columns: 9,
    inset: 6pt,
    align: center,
    table.header(
        Ccell([*Source Port*], 8),
        [*Destination Port*]
    ),
    Ccell("Sequence number", 9),
    Ccell("Acknowledgement number", 9),
    [Head len], [_Empty_], [Urgent], [#span("ACK")], [PSH : push data now], [RST], [SYN], [FIN], [Receive window (rcvr disposé pour accepter)],
    Ccell([#span("Checksum")], 8), [Urg data pnter],
    Ccell("Options (variable length)", 9),
    Ccell("Application data (variable length)",9),
)

#jump(2)
== TCP seq. number et ACKs
#jump(5)

#span("Numéro de séquence") :
- Le numéro dans le flux d'octets du premier octet de chaque segment.
#jump(1)
#span("ACKs") :
- Seq. number du prochain octet expédié de l'autre côté
- En cas de perte d'un segment un cumulative ACK cumulatif est envoyé
#jump(1)
#span("Q") : Comment TCP résout le problème de perte de segment hors séquence ?
- Le choix de le détruire ou de le conserver est libre au programmeur

== TCP : RTT (Round Trip Time) et Timout
#jump(5)

Fixer le Timeout :
- $>$ RTT $->$ impossible car le RTT varie
- Court $->$ prématuré, retransmissions non nécessaire
- Long $->$ TCP tardera à retransmettre le segments
#jump(1)
Comment estimer le RTT ?
- SampleRTT : temps écoulé entre son envoi et l'#span("ACK") renvoyé par le destinataire. Ignore les segments retransmits. Varie d'un segment à l'autre, une mesure moyenne s'avère nécessaire appelée *EstimatedRTT*

#pagebreak()
== TCP : Flow control
#jump(5)

L’objectif est d’équilibrer le rythme d’envoi de l'émetteur à la vitesse de lecture de destinataire. Le processus d'application peut être lent pour lire dans le buffer.
#image("img/img12.png", width: 50%)