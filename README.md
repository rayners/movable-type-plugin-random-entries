# Random Entries plugin for Movable Type

This plugin provides a single argument to be used with the
[Entries](http://www.movabletype.org/documentation/appendices/tags/entries.html)
block tag to return a random entry each time a template is published. A simple
example that returns all entries in a random order:

    <mt:Entries random="1">
        <p>Random entry: <a href="<mt:EntryPermalink>"><mt:EntryTitle></a></p>
    </mt:Entries>

Any of the Entries block tag attributes can be specified as valid arguments,
which makes it easy to retreive less random and more targeted entries. An
example to show one entry in the Movies category:

    <mt:Entries category="Movies" random="1" limit="1">
        <p>Random movie review: <a href="<mt:EntryPermalink>"><mt:EntryTitle></a></p>
    </mt:Entries>


# Prerequisites

Movable Type 4.x or 5.x

# Installation

To install this plugin follow the instructions found here:

http://tinyurl.com/easy-plugin-install
