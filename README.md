# docsify-twig

`docsify-twig` is a [phpDocumentor](https://www.phpdoc.org/) template that outputs [markdown][1].  You don't have to use it in [Docsify]() but the combination free form markdown served by Docsify + auto generated api reference is a great solution for project documentation. 

I've looked at various ways to accomplish this using [Dokuwiki](https://www.dokuwiki.org/dokuwiki) or [ApiGen](https://github.com/ApiGen/ApiGen) and phpDocumentor + Docsify is the winner.

I found inspiration with [phpdoc-md](https://github.com/evert/phpdoc-md) and I did work but I needed access to some informaiton that wasn't being sent to the [twig](https://twig.symfony.com/) templates. it to work but didn't have some 
of the tags (@author?) I needed. 

docsify-twig is a "real" phpDocumentor template based on responsive-twig along with a shell script.  The shell script is needed because I couldn't figure a few things out

1. phpdocumentor templates seem to work best in `vendor/phpdocumentor/phpdocumentor/data/templates/`.  Getting template file not found otherwise
2. Wasn't able to get twig `Writer` to save as .md extension
3. Twig caches a lot so shell script cleans things up for you

# Install

1. Clone this repository
2. Modify `phpdoc.dist.xml` to your needs
3. Run `sh apibuild`

# template.xml

I've left all the original responsive-twig html templates in.  These can be used for reference on how to get information from phpdocumentor about your classes, methods, properties, interfaces etc..  I'm was only interested in classes so that is the only transformation I used.

```ext
    <transformationX query="indexes.namespaces" writer="twig" source="templates/responsive-twig/namespace.html.twig" />
    <transformationX query="indexes.packages" writer="twig" source="templates/responsive-twig/package.html.twig" />
    <transformation  query="indexes.classes" writer="twig" source="templates/docsify-twig/class.md.twig" />
```

If you need namespaces or other transformations copy the transformation**X** line, remove the **X** and change html to md.   Create a new file for the .md version (or copy the html to start) and modify it to output [markdown][1].
    

[1]: https://daringfireball.net/projects/markdown/syntax
