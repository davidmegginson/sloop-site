#!/bin/bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
SCRIPTS=$ROOT_DIR/scripts
SOURCE=$ROOT_DIR/source
SITE=$ROOT_DIR/site

rsync -av --delete --exclude='*.xhtml' --exclude=fragments --exclude='.git' $SOURCE/ $SITE/

cd $SOURCE
for file in `find -name '*.xhtml'`; do
    export OUTPAGE=`basename $file | sed -e s/\.xhtml$/.html/`
    echo Generating $OUTPAGE ...
    cat fragments/header.html | perl $SCRIPTS/prepare.pl > $SITE/$OUTPAGE
    cat $file | perl $SCRIPTS/prepare.pl >> $SITE/$OUTPAGE
    cat fragments/footer.html | perl $SCRIPTS/prepare.pl >> $SITE/$OUTPAGE
done

