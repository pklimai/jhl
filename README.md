# Junos CLI output highlighter

This script is an attempt to automatically highlight some of the values in Junos CLI output.
Not fully working yet, so help is welcome!

The basic idea is that the script retrieves the same output as text and XML, then it retrieves 
text nodes from XML and highlights that values in the text command output.

The show-stopping problem so far is that when we execute the same RPC twice, some values (such as 
interface counters) get changed so we can't match on that values anymore.

Ideas to fix that problem will be highly appreciated.
