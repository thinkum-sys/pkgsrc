# $NetBSD: Makefile,v 1.11 2020/08/12 08:31:13 adam Exp $

.include "../../databases/openldap/Makefile.version"

# get the version from libraries/liblmdb/lmdb.h
PKGNAME=	lmdb-0.9.26
CATEGORIES=	databases

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Symas Lightning Memory-Mapped Database

USE_GCC_RUNTIME=	yes
USE_TOOLS+=		gmake

BUILD_DIRS=		libraries/liblmdb
MAKE_FLAGS+=		CC=${CC:Q}
MAKE_FLAGS+=		XCFLAGS=${CFLAGS:Q}\ -D_SEM_SEMUN_UNDEFINED
INSTALL_MAKE_FLAGS+=	prefix=${PREFIX}

INSTALLATION_DIRS+=	bin
INSTALLATION_DIRS+=	include
INSTALLATION_DIRS+=	lib
INSTALLATION_DIRS+=	${PKGMANDIR}/man1

TEST_TARGET=		test

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "Darwin"
MAKE_FLAGS+=	SOEXT=.dylib
MAKE_FLAGS+=	SOLIBS=-install_name\ ${PREFIX}/lib/liblmdb.dylib
.endif

.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
