# $NetBSD: Makefile,v 1.11 2020/08/14 06:56:24 adam Exp $

PKGNAME=	${DISTNAME:S/-/95-/}
COMMENT=	Robust, next generation, object-relational DBMS

DEPENDS+=	postgresql95-client>=${PKGVERSION_NOREV}:../../databases/postgresql95-client
DEPENDS+=	postgresql95-docs>=${PKGVERSION_NOREV}:../../databases/postgresql95-docs
DEPENDS+=	postgresql95-server>=${PKGVERSION_NOREV}:../../databases/postgresql95-server

META_PACKAGE=	yes

.include "Makefile.common"

.include "../../mk/bsd.pkg.mk"
