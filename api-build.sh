#!/bin/sh

TARGET="docs"
SOURCE="vendor/phpdocumentor"

# Install phpDocumentor
composer update

# Create target directory
mkdir "$TARGET"

# Copy our phpDocumentor template to vendor area
mkdir vendor/phpdocumentor/phpdocumentor/data/templates/docsify-twig
cp -a base graphs *.twig template.xml vendor/phpdocumentor/phpdocumentor/data/templates/docsify-twig

# Clear twig cache
rm -rf /tmp/phpdoc-twig-cache/

# Build documentation
vendor/bin/phpdoc -t $TARGET -d $SOURCE --template docsify-twig

# Remove phpdoc-cache dirs
rm -rf "$TARGET/phpdoc-cache*"

# Rename all *.html to *.md
cd "$TARGET/classes"
for f in *.html; do mv $f "${f%.html}.md"; done

