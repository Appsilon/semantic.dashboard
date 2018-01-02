
<link href="http://fonts.googleapis.com/css?family=Lato:300,700,300italic|Inconsolata" rel="stylesheet" type="text/css"> <link href='docs/style.css' rel='stylesheet' type='text/css'>

semantic.dashboard
==================

Dashboard with Semantic UI Support for Shiny

Basic functions for creating dashboard with Semantic UI.

<!-- #Basic tutorial article is available on [Appsilon Data Science blog](your_future_art_link). -->
<!-- Live demo link below -->
<p style="text-align: center; font-size: x-large;">
<a href="http://appsilondatascience.com/demo">Live demo</a>
</p>

Source code
-----------

This library source code can be found on [Appsilon Data Science's](http://appsilondatascience.com) Github: <br> <http://appsilondatascience.com/repo>

How to install?
---------------

**Note! This library is still in its infancy. Api might change in the future.**

At the moment it's possible to install this library through [devtools](https://github.com/hadley/devtools).

    devtools::install_github("Appsilon/semantic.dashboard")

To install [previous version]() you can run:

    devtools::install_github("Appsilon/semantic.dashboard", ref = "0.1.0")

Example
-------

How to contribute?
------------------

If you want to contribute to this project please submit a regular PR, once you're done with new feature or bug fix.<br>

**Changes in documentation**

Both repository **README.md** file and an official documentation page are generated with Rmarkdown, so if there is a need to update them, please modify accordingly a **README.Rmd** file and run a **build\_readme.R** script to compile it.

Troubleshooting
---------------

We used the latest versions of dependencies for this library, so please update your R environment before installation.

However, if you encounter any problems, try the following:

1.  Up-to-date R language environment
2.  Installing specific dependent libraries versions
    -   shiny.semantic

            devtools::install_github("Appsilon/shiny.semantic")

Future enhacements
------------------

-   CRAN release

Appsilon Data Science
=====================

Get in touch [dev@appsilondatascience.com](dev@appsilondatascience.com)
