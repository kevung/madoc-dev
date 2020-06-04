CWD=`readlink -f .` #chemin du dossier courant
ROOT=${CWD}/.. #dossier racine du projet
if [ -z "$1" ]; then
   FORMAT=docx #format par defaut
else
   FORMAT=$1
fi
if [ -z "$2" ]; then
   NAME=madoc
else
   NAME=$2 #nom du fichier de sortie
fi
OUTPUT_FILE=${NAME}.${FORMAT}
OUTPUT="-o ${CWD}/${OUTPUT_FILE}"
TEMPLATES_FOLDER=${CWD}/templates #dossier de templates
FILES=`cat ./files.md | sed 's/\r$//' | tr '\n' ' '` #listes des fichiers sources

## PANDOC OPTIONS
PANDOC_FLAGS="" 
# table des matieres
PANDOC_FLAGS=${PANDOC_FLAGS}"--toc --standalone " 
# permet de faire fonctionner les liens avec des fichier markdown separes
PANDOC_FLAGS=${PANDOC_FLAGS}"--lua-filter ${CWD}/supprime-nom-fichier-dans-lien-markdown.lua "
# permet de trouver les images lors de la conversion
PANDOC_FLAGS=${PANDOC_FLAGS}"--lua-filter ${CWD}/corrige-chemin-dans-image-markdown.lua "

# FLAGS SPECIFIQUE AU FORMAT
if [ ${FORMAT} == "docx" ]; then
   FORMAT_FLAGS=""
   FORMAT_FLAGS=${FORMAT_FLAGS}"--reference-doc ${TEMPLATES_FOLDER}/onera.docx "
elif [ ${FORMAT} == "html" ]; then
   FORMAT_FLAGS="" 
   FORMAT_FLAGS=${FORMAT_FLAGS}"--self-contained "
elif [ ${FORMAT} == "pdf" ]; then
   FORMAT_FLAGS="" 
   FORMAT_FLAGS=${FORMAT_FLAGS}" --number-sections "
fi

echo "Conversion Pandoc....."
cd ${ROOT}
echo "pandoc ${PANDOC_FLAGS} ${FILES} ${FORMAT_FLAGS} ${OUTPUT}"
pandoc ${PANDOC_FLAGS} ${FILES} ${FORMAT_FLAGS} ${OUTPUT}
cd ${CWD}

