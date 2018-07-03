[![Build Status](https://travis-ci.org/mplauman/spent.svg?branch=master)](https://travis-ci.org/mplauman/spent)

# Spent Build Environment

A dockerized build infrastructure used by [Spent|https://github.com/mplauman/spent].

This makes it a lot easier to reproduce builds in different environments. For
example both devs and the CI build system (travis-ci for now) can be sure they
will both be using the same versions of node, make, google cloud, etc.

