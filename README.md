# phpdocumentor-markdown

I looked at [phpdoc-md](https://github.com/evert/phpdoc-md) and I did get it to work but didn't have some of the tags 
I needed. phpdocumentor-markdown is a standard template along with a shell script.  The shell script is needed because of

1. phpdocumentor templates seem to work best in `vendor/phpdocumentor/phpdocumentor/data/templates/`
2. Wasn't able to get twig `Writer` to save as .md
3. Twig caches a lot so shell script cleans things up

# Install

1. Clone this repository
2. Modify `phpdoc.dist.xml` to your needs
3. Run `sh apibuild`

# template.xml

I've left all the original twig html templates in.  These can be used for reference on how to get information from phpdocumentor 
about your classes, interfaces etc..  I'm only interested in classes.

```ext
    <transformationX query="indexes.namespaces" writer="twig" source="templates/responsive-twig/namespace.html.twig" />
    <transformationX query="indexes.packages" writer="twig" source="templates/responsive-twig/package.html.twig" />
    <transformation  query="indexes.classes" writer="twig" source="templates/docsify-twig/class.md.twig" />
```

If you need namespaces, copy the transformation**X** line, remove the **X** and change html to md.   Make a copy of the
template and have it output markdown instead of HTML.
    

