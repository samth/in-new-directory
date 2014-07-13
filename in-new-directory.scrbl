#lang scribble/doc

@require[scribble/manual
         scribble/eval
         scribble/basic
         (for-label file/in-new-directory)]

@title[#:tag "top"]{Utilities for Manipulating Directories}
@declare-exporting[file/in-new-directory]

@author["Dave Herman"
        @author+email["Sam Tobin-Hochstadt" "samth@cs.indiana.edu"]]

This package provides forms for managing what directory
code is run in. It is particularly useful for unit testing.


@defform[(in-this-directory body-form ...+)]{
An expression form that evaluates each @scheme[body-form] with the @scheme[current-directory]
@scheme[parameterize]d to the directory containing the module in which the expression appears.}

@defform[(in-new-directory dir-expr body-form ...+)]{
An expression form that creates the directory @scheme[dir-expr] and evaluates each @scheme[body-form]
with the @scheme[current-directory] @scheme[parameterize]d to the new directory. If
@scheme[keep-new-directories?] is @scheme[#f], the new directory is completely erased, including all
of its contents, after evaluation terminates.}

@defthing[keep-new-directories? (parameter/c boolean?)]{
Should @scheme[in-new-directory] allow created directories to persist after completing?}

