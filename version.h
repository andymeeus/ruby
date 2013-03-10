#define RUBY_VERSION "2.1.0"
#define RUBY_RELEASE_DATE "2013-03-10"
#define RUBY_PATCHLEVEL -1
#define RUBY_BRANCH_NAME "trunk"

#define RUBY_RELEASE_YEAR 2013
#define RUBY_RELEASE_MONTH 3
#define RUBY_RELEASE_DAY 10

#include "ruby/version.h"

#if !defined RUBY_LIB_VERSION && defined RUBY_LIB_VERSION_STYLE
# if RUBY_LIB_VERSION_STYLE == 3
#   define RUBY_LIB_VERSION STRINGIZE(RUBY_API_VERSION_MAJOR)"."STRINGIZE(RUBY_API_VERSION_MINOR)"."STRINGIZE(RUBY_API_VERSION_TEENY)
# elif RUBY_LIB_VERSION_STYLE == 2
#   define RUBY_LIB_VERSION STRINGIZE(RUBY_API_VERSION_MAJOR)"."STRINGIZE(RUBY_API_VERSION_MINOR)
# endif
#endif

#if RUBY_PATCHLEVEL == -1
#define RUBY_PATCHLEVEL_STR "dev"
#else
#define RUBY_PATCHLEVEL_STR "p"STRINGIZE(RUBY_PATCHLEVEL)
#endif

#ifndef RUBY_REVISION
# include "revision.h"
#endif
# ifndef RUBY_REVISION
# define RUBY_REVISION 0
#endif

#if RUBY_REVISION
# ifdef RUBY_BRANCH_NAME
#  define RUBY_REVISION_STR " "RUBY_BRANCH_NAME" "STRINGIZE(RUBY_REVISION)
# else
#  define RUBY_REVISION_STR " revision "STRINGIZE(RUBY_REVISION)
# endif
#else
# define RUBY_REVISION_STR ""
#endif

# define RUBY_DESCRIPTION	    \
    "ruby "RUBY_VERSION		    \
    RUBY_PATCHLEVEL_STR		    \
    " ("RUBY_RELEASE_DATE	    \
    RUBY_REVISION_STR") "	    \
    "["RUBY_PLATFORM"]"
# define RUBY_COPYRIGHT		    \
    "ruby - Copyright (C) "	    \
    STRINGIZE(RUBY_BIRTH_YEAR)"-"   \
    STRINGIZE(RUBY_RELEASE_YEAR)" " \
    RUBY_AUTHOR
