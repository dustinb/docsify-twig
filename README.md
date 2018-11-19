# TLDR;

To build some docs

1. git clone git@github.com:dustinb/docsify-twig.git
2. Modify api-build.sh to set SOURCE and TARGET
3. sh api-build.sh 
4. Modify template.xml and/or the class.md.twig template file

# docsify-twig

`docsify-twig` is a [phpDocumentor](https://www.phpdoc.org/) template that outputs [markdown][1].  You don't have to use it in [Docsify]() but the combination free form markdown served by Docsify + auto generated api reference is a great solution for project documentation. 

I've looked at various ways to accomplish this using [Dokuwiki](https://www.dokuwiki.org/dokuwiki) or [ApiGen](https://github.com/ApiGen/ApiGen) and phpDocumentor + Docsify is the winner.

I found inspiration with [phpdoc-md](https://github.com/evert/phpdoc-md) and I did get it to work but I needed access to some informaiton that wasn't being sent to the [twig](https://twig.symfony.com/) templates.

docsify-twig is a "real" phpDocumentor template based on responsive-twig along with a shell script.  The shell script is needed because I couldn't figure out some things.

1. phpdocumentor templates seem to work best in `vendor/phpdocumentor/phpdocumentor/data/templates/`.  Getting template file not found otherwise
2. Wasn't able to get twig `Writer` to save as .md extension
3. Twig caches a lot so shell script cleans things up for you

# template.xml

I've left all the original responsive-twig html templates in.  These can be used for reference on how to get information from phpdocumentor about your classes, methods, properties, interfaces etc..  I'm was only interested in classes so that is the only transformation I used.

```ext
    <transformationX query="indexes.namespaces" writer="twig" source="templates/responsive-twig/namespace.html.twig" />
    <transformationX query="indexes.packages" writer="twig" source="templates/responsive-twig/package.html.twig" />
    <transformation  query="indexes.classes" writer="twig" source="templates/docsify-twig/class.md.twig" />
```

If you need namespaces or other transformations remove the **X** and change html to md.  Create a new file for the .md version (or copy the html to start with) and modify it to output [markdown][1] instead of HTML.
    

[1]: https://daringfireball.net/projects/markdown/syntax
