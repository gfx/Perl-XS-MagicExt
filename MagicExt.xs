#define PERL_NO_GET_CONTEXT
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#include "ppport.h"

#define  XS_MAGIC_EXT_DECL EXTERN_C
#include "magic_ext.h"

MODULE = XS::MagicExt	PACKAGE = XS::MagicExt

PROTOTYPES: DISABLE

VERSIONCHECK: DISABLE

