#!/bin/sh

# Install phpDocumentor if vendor directory does not exist
if [ ! -d "vendor" ]; then
  composer update
fi

# Copy our phpDocumentor template to vendor area
mkdir vendor/phpdocumentor/phpdocumentor/data/templates/docsify-twig
cp -a base graphs reports *.twig template.xml vendor/phpdocumentor/phpdocumentor/data/templates/docsify-twig

# Clear twig cache and phpdocumentor cache
rm -rf /tmp/phpdoc-twig-cache/
rm -rf "/tmp/phpdocumentor"

rm -rf ../docs/api

# Build documentation
vendor/bin/phpdoc

# Rename all *.html to *.md
# cd "$TARGET/classes"
# for f in *.html; do mv $f "${f%.html}.md"; done

