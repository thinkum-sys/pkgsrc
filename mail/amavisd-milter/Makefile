# $NetBSD: Makefile,v 1.5 2020/05/21 07:08:07 rillig Exp $
#

DISTNAME=	amavisd-milter-1.6.1
PKGREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=amavisd-milter/}

MAINTAINER=	kivinen@iki.fi
HOMEPAGE=	http://amavisd-milter.sourceforge.net/
COMMENT=	Sendmail milter program for amavisd-new
LICENSE=	modified-bsd

.include "options.mk"

GNU_CONFIGURE=		yes

RCD_SCRIPTS=	amavisd-milter

.include "../../mail/libmilter/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
