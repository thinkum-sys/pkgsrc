# $NetBSD: Makefile,v 1.10 2020/08/14 06:56:26 adam Exp $

PKGNAME=	${DISTNAME:S/-/96-plpython-/}
COMMENT=	PL/Python procedural language for the PostgreSQL backend

DEPENDS+=	postgresql96-server>=${PKGVERSION_NOREV}:../../databases/postgresql96-server

.include "../../databases/postgresql96/Makefile.common"

TOOLS_BROKEN+=		perl
CONFIGURE_ARGS+=	--with-python
CONFIGURE_ENV+=		PYTHON="${PYTHONBIN}"
BUILD_MAKE_FLAGS=	PGXS=1

BUILD_DIRS=		src/pl/plpython contrib/hstore_plpython

.include "../../databases/postgresql96-client/buildlink3.mk"
.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
