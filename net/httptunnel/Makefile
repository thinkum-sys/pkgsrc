# $NetBSD: Makefile,v 1.12 2019/11/03 11:45:37 rillig Exp $
#

DISTNAME=	httptunnel-3.3
CATEGORIES=	net
MASTER_SITES=	http://www.nocrew.org/software/httptunnel/

MAINTAINER=	pkgsrc-users@NetBSD.org
#HOMEPAGE=	http://www.nocrew.org/software/httptunnel.html
COMMENT=	Encapsulate TCP/IP connections in HTTP requests
LICENSE=	gnu-gpl-v2

HAS_CONFIGURE=		YES
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--mandir=${PREFIX}/${PKGMANDIR}

.include "../../mk/bsd.pkg.mk"
