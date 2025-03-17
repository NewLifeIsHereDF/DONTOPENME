# **Are You Open Me ?**

### **Description**

"DONT OPEN ME" est un script Batch (`.bat`) **extrêmement destructeur**, conçu pour illustrer, à des fins strictement éducatives, les risques majeurs associés à l'exécution de scripts malveillants non vérifiés. Ce script peut **complètement détruire un système Windows**, entraînant une perte totale des données et une panne irrécouvrable du système.

> **Avertissement** :\
> Ce script est dangereux et doit être utilisé uniquement dans des environnements isolés, comme une machine virtuelle. **Ne l'exécutez jamais sur un système réel ou avec des données importantes**. L'auteur décline toute responsabilité en cas d'usage inapproprié ou malveillant.

---

### **Fonctionnalités**

- **Suppression massive de fichiers système** : Le script cible et détruit des fichiers critiques nécessaires au fonctionnement de Windows.
- **Altérations permanentes** : Modifie le registre et d'autres paramètres système de manière irrécouvrable.
- **Comportements destructeurs en boucle** : Provoque des plantages constants et rend la machine inutilisable.

---

### **Prérequis**

1. **Machine virtuelle (VM)** : Ce script ne doit être testé que dans un environnement isolé.
2. **Aucune donnée importante** : Assurez-vous que la machine utilisée ne contient aucun fichier ou information de valeur.
3. **Système Windows** : Ce script cible les systèmes Windows et peut entraîner une destruction totale du système d'exploitation.

---

### **Risques Associés**

Le script provoque :

1. **Destruction totale du système** :
   - Suppression de fichiers critiques nécessaires au démarrage et à l'exécution de Windows.
   - Corruption irrécouvrable des paramètres système.
2. **Perte complète des données** :
   - Toutes les données utilisateur et système peuvent être effacées.
3. **Dysfonctionnements permanents** :
   - Nécessite une réinstallation complète du système d'exploitation pour restaurer le fonctionnement.

---

### **Clause de Non-Responsabilité**

1. Ce script est fourni à des fins éducatives uniquement et **n'a pas pour objectif d'être utilisé sur des systèmes réels**.
2. L'auteur **décline toute responsabilité** en cas d'usage malveillant, inapproprié ou frauduleux du script. Cela inclut, sans s'y limiter :
   - Le partage du script sans avertissement explicite.
   - L'exécution sur des machines réelles ou des systèmes non isolés.
3. Si quelqu'un exécute ce script sur une machine sans être pleinement conscient de ses conséquences, **l'entire responsabilité revient à celui qui a partagé ou exécuté le fichier**.

---

### **Avertissement**

> **NE LANCEZ PAS CE SCRIPT SUR UNE MACHINE RÉELLE.**\
> Toute exécution de ce script en dehors d'un environnement isolé causera une perte complète et irrémédiable de données et rendra le système inutilisable.

---

### **Objectif**

- **Éduquer** : Illustrer les conséquences graves des scripts malveillants sur un système d'exploitation.
- **Sensibiliser** : Souligner l'importance de ne jamais exécuter de fichiers `.bat` non vérifiés.
- **Prévenir** : Enseigner à identifier, analyser et désamorcer des menaces de ce type.

---

### **openme.bat : Tentative d'Arrêt Partiel**

Un script nommé `openme.bat` est fourni pour tenter de limiter les dégâts causés par "DONT OPEN ME". Ce script peut effectuer les opérations suivantes :

- **Tuer les processus destructeurs** : Il arrête les instances de `cmd.exe` ou `powershell.exe` potentiellement malveillantes.
- **Restauration partielle** : Si une sauvegarde est disponible, il tente de restaurer des fichiers critiques.
- **Annuler les redémarrages forcés** : Arrête toute tentative de redémarrage planifié.
- **Nettoyage du registre** : Supprime les modifications communes faites par le script destructeur.

> **Limitations** : `openme.bat` ne peut pas restaurer totalement un système gravement endommagé. Une sauvegarde préalable est essentielle pour minimiser les pertes.

---

### **Responsabilité Éthique**

> La création, la diffusion et l'utilisation de programmes destructeurs sont illégales dans de nombreux pays. Ce projet vise uniquement à sensibiliser et éduquer dans un cadre sécurisé. Toute utilisation à des fins malveillantes est une infraction éthique et légale, passible de sanctions pénales et civiles.

---

### **Important**

Ce script est destiné uniquement à des développeurs, chercheurs, amateurs du risque ou éducateurs souhaitant démontrer les impacts d'un script destructeur dans un environnement contrôlé. **Ne partagez ce script qu'avec des avertissements explicites et ne l'exécutez jamais sur un système réel.**

