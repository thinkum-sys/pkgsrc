# $NetBSD: Makefile,v 1.2 2020/01/18 23:33:21 rillig Exp $

PYDNS_VER=	2.3.6
DISTNAME=	pydns-${PYDNS_VER}
PKGNAME=	${PYPKGPREFIX}-pydns-${PYDNS_VER}
CATEGORIES=	net python
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=pydns/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://pydns.sourceforge.net/
COMMENT=	Python DNS library
LICENSE=	python-software-foundation

PYDISTUTILSPKG=			yes
PYTHON_VERSIONS_ACCEPTED=	27

.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
