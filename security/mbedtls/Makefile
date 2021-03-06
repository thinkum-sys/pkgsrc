# $NetBSD: Makefile,v 1.18 2020/07/07 11:16:38 nia Exp $

DISTNAME=	mbedtls-2.23.0
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=ARMmbed/}
GITHUB_TAG=	${DISTNAME}

MAINTAINER=	nia@NetBSD.org
HOMEPAGE=	https://tls.mbed.org/
COMMENT=	Lightweight, modular cryptographic and SSL/TLS library
LICENSE=	apache-2.0

CONFLICTS+=	polarssl-[0-9]*
SUPERSEDES+=	polarssl-[0-9]*

USE_CMAKE=	yes
USE_LANGUAGES=	c99
USE_TOOLS+=	pkg-config

GCC_REQD+=	4.4

CMAKE_ARGS+=	-Wno-dev
CMAKE_ARGS+=	-DUSE_SHARED_MBEDTLS_LIBRARY=ON
CMAKE_ARGS+=	-DENABLE_PROGRAMS=ON

# Fails to build full suite on NetBSD due to strange tricks with stdout
CMAKE_ARGS+=	-DENABLE_TESTING=OFF

CMAKE_ARGS+=	-DMBEDTLS_FATAL_WARNINGS=OFF

MAKE_ENV+=	RANLIB=${RANLIB:Q}

LDFLAGS.SunOS+=	-lsocket

PYTHON_FOR_BUILD_ONLY=	tool

PYTHON_VERSIONS_INCOMPATIBLE=	27

# Prefix bundled programs so they don't conflict with other packages
post-install:
	cd ${DESTDIR}${PREFIX}/bin && ${FIND} * -type f -exec \
	    ${MV} '{}' mbedtls_'{}' ';'

do-test:
	LD_LIBRARY_PATH=${WRKSRC}/library \
	    ${WRKSRC}/programs/test/selftest

.include "options.mk"
.include "../../lang/python/tool.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
