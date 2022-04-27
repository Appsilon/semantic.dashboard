#!/bin/bash

cd examples/$1
R -e 'shiny::runApp()'
