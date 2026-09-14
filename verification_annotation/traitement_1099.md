# Traitement des 1 099 annotations non conformes

Ce document explique comment les 1 099 annotations repérées par l'audit
déterministe (`verify_annotation_span_diff.ipynb`) ont été traitées, et
donne les prompts qui ont permis de conduire ce travail avec Claude Code,
pour qu'il soit reproductible ou repris sur un autre corpus.

## 1. Le point de départ

L'audit compare chaque annotation `[entité = valeur]` au texte qui la
précède immédiatement. Sur l'ensemble du corpus :

| | |
|---|---|
| Annotations vérifiées | 119 731 |
| Non conformes au départ | **1 099** |
| Espèces concernées | 918 |

Quatre causes possibles, classées automatiquement par le notebook :

| Catégorie | Description |
|---|---|
| `malformed` | crochet imbriqué dans un autre, ou tronqué |
| `valeur_en_lettres` | valeur en chiffres dans le crochet, en toutes lettres dans le texte |
| `paraphrase` | le texte dit autre chose que ce que le crochet annonce |
| `formulation_differente` | proche du texte, mais pas identique mot pour mot |

## 2. Le traitement, étape par étape

| Étape | Fichier(s) produit(s) | Cas traités |
|---|---|---|
| Réparation des `malformed` | `reparations_malformed.csv` | 387 |
| Repositionnement scriptable | `plan_corrections_scriptables.csv`, `corrections_appliquees.csv`, `alignees_sur_prose.csv` | 549 planifiés, 277 appliqués, 85 alignés sur la prose |
| Corrections manuelles par lots | `corrections_manuelles.csv`, `lettres_corriges_script.csv`, `lettres_pour_llm.csv` | 123 + 52 + 112 |
| Reformulations | `reformulations_faites.csv` | 116 |
| Repositionnement final | `corrections_position_faites.csv` / `corrections_position_rejets.csv` | 67 faites, 32 rejetées |
| Cas non alignables identifiés | `non_alignables.csv` | 52 |
| **Arbitrage humain** | `cas_arbitrage_humain.csv` | **164**, dont 157 tranchés |

Chaque étape a été vérifiée indépendamment de la précédente avant de
passer à la suivante : un échantillon de corrections était relu contre
le texte source, jamais supposé correct du seul fait d'avoir été
appliqué.

## 3. Le résultat final

Recompte direct sur l'état actuel de `species_non_conformes_json/`,
avec le même contrôle que l'audit initial :

| | |
|---|---|
| Annotations désormais conformes | 16 574 |
| **Annotations encore non conformes** | **2** |
| Espèces concernées | 2 |

Les deux cas restants sont structurellement irréparables : deux crochets
adjacents partagent une seule valeur écrite une seule fois dans le
texte, si bien qu'aucun des deux ne peut avoir un span qui lui soit
propre.

| Espèce | Fichier | Entités | Raison |
|---|---|---|---|
| Cyclops_vicinus | `1835_Cyclops_vicinus_abp.json` | `Li`, `Lp` | valeur unique (`0.1627 cm`) partagée par deux crochets adjacents |
| Microtus_arvalis | `4104_Microtus_arvalis_stx.json` | `tp`, `tx` | valeur unique (`13.7 days from birth`) partagée par deux crochets adjacents |

Ce sont deux des trois espèces citées dans la limite « Three unconverted
mentions » de l'article ; la troisième (`Xiphophorus_montezumae`, `T`)
a été résolue au stade `malformed` (`reparations_malformed.csv`) mais
reste, elle, non convertible en BIO pour une raison différente (espace
insécable entre le chiffre et `°C`).

## 4. Prompts utilisés

Le travail a été conduit avec Claude Code, en sept passes successives.
Chaque prompt ci-dessous reconstitue l'instruction effectivement suivie
à cette étape ; ils sont réutilisables tels quels sur un autre corpus
annoté de la même façon.

### Prompt 1 — Construire l'audit

```
Écris un notebook Python qui, pour chaque annotation [ENTITE = valeur]
d'un corpus de fiches JSON, vérifie que la valeur est une sous-chaîne
verbatim du texte qui précède immédiatement le crochet. Pour chaque
annotation non conforme, classe la cause : crochet imbriqué (malformed),
valeur en chiffres dans le crochet mais en lettres dans le texte
(valeur_en_lettres), texte qui dit autre chose (paraphrase), ou
formulation proche mais non identique (formulation_differente).
Produis un tableau récapitulatif par entité : nombre d'annotations,
nombre de non-conformes, taux en pourcentage.
```

### Prompt 2 — Exécuter sur l'ensemble du corpus et établir la ligne de base

```
Exécute le notebook sur l'ensemble du corpus. Donne le nombre total
d'annotations vérifiées, le nombre de non-conformes, et le nombre
d'espèces concernées. Avant toute correction, vérifie que le dossier
original n'est jamais modifié : travaille uniquement sur une copie.
```

### Prompt 3 — Réparer les crochets malformés

```
Pour chaque annotation classée "malformed", répare le crochet imbriqué
ou tronqué de façon à ce que la valeur redevienne une sous-chaîne
verbatim du texte. Ne supprime jamais un crochet, corrige seulement sa
position ou son contenu. Après réparation, prends un échantillon aléatoire
de 10 cas et vérifie chacun manuellement contre le texte source avant de
poursuivre.
```

### Prompt 4 — Traiter les valeurs en lettres, par lots

```
Pour chaque annotation classée "valeur_en_lettres", propose la correction
qui aligne le crochet sur la forme exacte du texte (chiffres ou lettres,
selon ce que dit la prose). Applique par lots de taille raisonnable,
vérifie le résultat de chaque lot avant de passer au suivant, et isole
les cas rejetés pour un nouveau traitement plutôt que de les laisser en
l'état.
```

### Prompt 5 — Cas complexes (repositionnement, reformulation)

```
Pour les annotations qui restent non conformes après les étapes
précédentes, identifie si la valeur existe ailleurs dans le texte sous
une forme correcte (repositionnement possible) ou si la phrase doit être
reformulée pour inclure la valeur exacte. Construis les corrections à
partir du texte réel, jamais d'une valeur supposée. Applique, vérifie,
recompte les cas restants.
```

### Prompt 6 — Isoler ce qui ne peut pas être corrigé automatiquement

```
Pour les annotations qui résistent à toute correction scriptable,
détermine si le problème est résoluble (formulation à choisir parmi
plusieurs options légitimes, équivalence sémantique) ou structurellement
irréparable (deux annotations distinctes partageant une seule valeur
écrite une seule fois dans le texte, sans second span possible). Exporte
les deux catégories séparément, avec la raison précise pour chaque cas.
```

### Prompt 7 — Nettoyage final et vérification de clôture

```
Recherche les doublons stricts et les cas mal relocalisés issus des
étapes précédentes, corrige-les. Puis relance l'audit initial sur l'état
actuel du corpus et donne le nombre exact d'annotations qui restent non
conformes. Pour chaque cas résiduel, confirme par une inspection directe
du texte que la non-conformité est réelle et explique pourquoi elle ne
peut pas être corrigée davantage.
```

## 5. Fichiers de ce dossier

| Fichier | Rôle |
|---|---|
| `verify_annotation_span_diff.ipynb` | le notebook d'audit, déterministe, sans appel de modèle |
| `conformity_per_entity.csv` | le tableau de conformité par entité, cité dans l'article |
| `cas_arbitrage_humain.csv` | les 164 cas renvoyés à l'arbitrage humain |
| `species_non_conformes_json/` | les fiches des 918 espèces concernées, dans leur état final |
| tous les autres `.csv` | la trace détaillée de chaque étape du traitement décrit ci-dessus |
