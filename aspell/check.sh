OUTPUT=aspell.txt
LANG=$(cat ./aspell/lang.txt)
#jargon pour langue specific
if [ ${LANG} == 'en' ]; then
  JARGON_LANG=./aspell/jargon_en.txt 
elif [ ${LANG} == 'fr' ]; then
  JARGON_LANG=./aspell/jargon_fr.txt
fi
JARGON_COMMON=./aspell/jargon_common.txt
cat ${JARGON_LANG} ${JARGON_COMMON} > jargon_tmp.txt
rm -f ${OUTPUT} && touch ${OUTPUT};
for f in `find ./docs -iname "*.md"`; do echo $f: $(cat $f | aspell -l ${LANG} --personal=./jargon_tmp.txt list) >> ${OUTPUT}; done;
rm jargon_tmp.txt
cat aspell.txt
