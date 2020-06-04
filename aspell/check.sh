OUTPUT=mispelled.txt
rm -f ${OUTPUT} && touch ${OUTPUT};
for f in `find ./docs -iname "*.md"`; do echo $f: $(cat $f | aspell list) >> ${OUTPUT}; done;
