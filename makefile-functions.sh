#!/bin/bash
# generate-help.sh


generate_help() {
    current_section=""
    print_section_commands=0

    while IFS= read -r line; do
            # Détecte une section
            if [[ "$line" =~ ^####+\ (.+)\  ]]; then
                if [[ -n "$current_section" ]]; then
                    echo "" # Ajoute un espace entre les sections pour une meilleure lisibilité
                    section_displayed=true  # Marque que la section a été affichée
                fi
                current_section="${BASH_REMATCH[1]}"
                echo "##### $current_section #####"
            # Détecte et affiche une commande et sa description sous la section courante
            elif [[ "$line" =~ ^[a-zA-Z0-9_-]+:.*##.* ]]; then
                command="${line%%:*}"  # Extrait la commande en supprimant tout après le premier :
                description="${line##*##}"  # Extrait la description en supprimant tout avant le dernier ##
                description="${description#"${description%%[![:space:]]*}"}"  # Supprime les espaces inutiles au début
                if [[ -n "$description" ]]; then  # S'assure que la description n'est pas vide
                    printf "  make \033[36m%-30s\033[0m %s\n" "$command" "$description"
                fi
            fi
        done < "$1"

}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    generate_help "$1"
fi
