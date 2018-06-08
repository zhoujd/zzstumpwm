ASDF
====

1. Default Installation Paths

    > No need to configure if you use defaults
      ~/.local/share/common-lisp/source/
      /usr/local/share/common-lisp/source/
      /usr/share/common-lisp/source/
    > FASLs under ~/.cache/common-lisp/

2. Source Registry, via config file

    > ~/.config/common-lisp/source-registry.conf
      (:source-registry
       (:directory "/myapp/src")
       (:tree "/home/tunes/cl")
       :inherit-configuration)
    > Unlike ASDF 1, forgiving of no final /

3. Source Registry, via modular config file

    > ~/.config/common-lisp/source-registry.conf.d/my.conf
      (:directory "/myapp/src")

4. Source Registry, via environment

    export CL_SOURCE_REGISTRY=/myapp/src/:/home/tunes/cl//:

5. Source Registry, via Lisp evaluation

    (asdf:initialize-source-registry
        `(:source-registry
        (:directory ,appdir)
        (:tree ,librootdir)
        :inherit-configuration))

6. Old Style central registry

    > (pushnew #p"/myapp/src/" asdf:*central-registry*
        :test 'equal)
    > Catch: ASDF 1 was unforgiving if you forgot the trailing /
    > Magic: argument actually evaluated.
    > ASDF 2 has asdf::getenv, now uiop:getenv
    > No portable place to do it with ASDF 1.
        > e.g. ~/.sbclrc on SBCL.
    > source-registry can be configured in a decentralized way
        > Each can specify what he knows,
        > none need specify what he doesn't

