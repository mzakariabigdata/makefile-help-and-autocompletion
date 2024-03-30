# Activation de l'Auto-Complétion pour Makefile

Ce guide explique comment activer l'auto-complétion pour les cibles définies dans un `Makefile` sous Windows, en utilisant Git Bash.

## Prérequis

- Git Bash installé (pour les utilisateurs Git Bash) ou
- `make` installé dans l'environnement de votre choix

## Configuration pour Git Bash

### Étape 1: Créer ou Modifier `.bashrc`

Ouvrez votre fichier `.bashrc` dans votre éditeur de texte préféré. Ce fichier se trouve généralement dans votre répertoire utilisateur (`~` ou `$HOME`).

```bash
nano ~/.bashrc
```

### Étape 2: Ajouter la Fonction d'Auto-Complétion

Copiez et collez la fonction d'auto-complétion suivante dans votre `.bashrc` :

```bash
_make()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "`make -qp | grep -oE '^[a-zA-Z0-9_-]+:' | sed 's/://'`" -- $cur) )
}
complete -F _make make
```

### Étape 3: Recharger `.bashrc` Depuis `.bash_profile`

1. **Ouvrez Git Bash.**
2. **Naviguez vers votre répertoire personnel avec `cd ~`.**
3. **Vérifiez si `.bash_profile` existe déjà en tapant `ls -a` et en cherchant dans la liste.**

Si `.bash_profile` n'existe pas, vous pouvez le créer en utilisant la commande suivante :

```bash
touch .bash_profile
```

### Étape 4: Modifier `.bash_profile` pour Charger `.bashrc`

1. **Ouvrez `.bash_profile` avec votre éditeur de texte préféré.** Si vous êtes déjà dans Git Bash, vous pouvez utiliser `nano` ou `vi` :

   ```bash
   nano .bash_profile
   ```

2. **Ajoutez la ligne suivante au fichier :**

   ```bash
   if [ -f ~/.bashrc ]; then source ~/.bashrc; fi
   ```

   Cette ligne de commande vérifie si `.bashrc` existe (`[ -f ~/.bashrc ]`) et, dans l'affirmative, il exécute le fichier (`source ~/.bashrc`).

3. **Enregistrez le fichier et quittez l'éditeur.** Si vous utilisez `nano`, vous pouvez le faire en appuyant sur `Ctrl + O`, `Entrée` pour enregistrer, puis `Ctrl + X` pour quitter.

### Étape 5: Tester les Modifications

Pour tester si `.bashrc` est correctement chargé au démarrage de Git Bash, vous pouvez ajouter une commande de test dans `.bashrc`, comme un simple `echo` :

```bash
echo "Le fichier .bashrc a été chargé."
```

Après avoir ajouté cette ligne à `.bashrc`, fermez Git Bash si c'est ouvert et relancez-le. Vous devriez voir le message "Le fichier .bashrc a été chargé." s'afficher, indiquant que `.bashrc` est correctement chargé au démarrage.

En suivant ces étapes, vous vous assurez que votre fichier `.bashrc` est automatiquement chargé à chaque lancement de Git Bash, vous permettant de maintenir vos configurations et personnalisations Bash dans `.bashrc` et de les avoir appliquées à chaque session.
