Recurcec: A Compiler for the Esoteric Language Recurse
======================================================

The [Recurse][recurse] language is an two-dimensional programming
language.  Some years ago, I wrote an [interpreter][interpreter] in
Python.  A random Internet user stumbled upon it and asked me a
question about it.  I had totally forgotten that I had written it
until he pointed me to my web page on my website in my 2007 web style
with my 2007 Python style in it and the [blog post][blog] comment that
I made when I wrote it.

  [recurse]: http://esolangs.org/wiki/Recurse
  [interpreter]: http://www.csh.rit.edu/~pat/hack/quickies/recurse/
  [blog]: http://scienceblogs.com/goodmath/2007/02/09/rectangular-programming-for-wa-1/

It was actually in February-ish of 2007 that I dove into Lisp and
abandoned Python.  Now, I'm looking at the Recurse specification again
and thinking that it would be really fun to make a Recurse compiler
rather than an interpreter.

Following along in Git
----------------------

I've fallen out of practice on Test Driven Development (TDD).  Since
this project is going to take significantly longer than the
[Bowling Game Kata][kata], I am opting not to create a video.
However, for others interested in examples of TDD, I thought I would
obsessively commit the source code to git each time I add a new test,
each time I make a broken test work, and each time I refactor.

  [kata]: http://nklein.com/tags/code-kata/

The [Git repository][git] is available online.  Each commit message
shows the last successful test run or the compiler warning or failed
test message at that point in time.

  [git]: https://github.com/nklein/recursec/commits/master

For example, the following [Git message][dc03233] was right after I had
added the function to the testing package which runs all of the tests
in the testing package.

    commit dc0323320c016517a391e649ce387f2fec360974
    Author: Patrick Stein <pat@nklein.com>
    Date:   Fri Feb 27 03:09:36 2015 -0600

        CL-USER> (asdf:test-system :recursec)
        Running package "RECURSEC-TESTS"
        TOTAL: 0 of 0 passed (0 failed, 0 errors, 0 warnings)

  [dc03233]: https://github.com/nklein/recursec/commit/f780101f787ba5ff5d29b4ed18a6ba6d031b16fd

In the [next commit][50f99d4], I added a test to the testing package
which checked to make sure that the `RECURSEC` package exists.  At
this point, the `RECURSEC` ASDF system file existed but contained no
component files (i.e. no source code for the actual `RECURSEC`
package).

    commit 50f99d4dcc26e41e43ffb280996d649707e216df
    Author: Patrick Stein <pat@nklein.com>
    Date:   Fri Feb 27 03:14:34 2015 -0600

        CL-USER> (asdf:test-system :recursec)
        Running package "RECURSEC-TESTS"
        Running group RECURSEC-TESTS::RECURSEC-EXPORTS
        Package RECURSEC-TESTS: 0 of 1 passed
         - Group RECURSEC-EXPORTS: 0 of 1 passed
            - Check PACKAGE-EXISTS failed
              - Expected non-null, got: NIL
        TOTAL: 0 of 1 passed (1 failed, 0 errors, 0 warnings)

  [50f99d4]: https://github.com/nklein/recursec/commit/50f99d4dcc26e41e43ffb280996d649707e216df

In the [commit after that][d330c34], I added the file `package.lisp` into the
`RECURSEC` directory and ASDF system definition.  At that point then,
all of the tests passed again.

    commit d330c34d3a85a991c6578b717aa25e68e94bc41e
    Author: Patrick Stein <pat@nklein.com>
    Date:   Fri Feb 27 03:33:47 2015 -0600

        CL-USER> (asdf:test-system :recursec)
        Running package "RECURSEC-TESTS"
        Running group RECURSEC-TESTS::RECURSEC-EXPORTS
        Package RECURSEC-TESTS: 1 of 1 passed
         - Group RECURSEC-EXPORTS: 1 of 1 passed
        TOTAL: 1 of 1 passed (0 failed, 0 errors, 0 warnings)

[d330c34]: https://github.com/nklein/recursec/commit/d330c34d3a85a991c6578b717aa25e68e94bc41e
