# $NetBSD: Makefile,v 1.36 2020/08/14 20:01:37 bsiegert Exp $

DISTNAME=		go-text-0.3.0
PKGREVISION=		18
CATEGORIES=		textproc
MASTER_SITES=		${MASTER_SITE_GITHUB:=golang/}
GITHUB_PROJECT=		text
GITHUB_TAG=		v0.3.0

MAINTAINER=		bsiegert@NetBSD.org
HOMEPAGE=		https://golang.org/
COMMENT=		Supplementary text processing libraries for Go
LICENSE=		modified-bsd

GO_SRCPATH=		golang.org/x/text
GO_DIST_BASE=		${DISTNAME:S/go-//}

CHECK_RELRO_SKIP+=	bin/colcmp

pre-patch:
	${RM} -rf ${WRKSRC}/cmd/gotext ${WRKSRC}/message/pipeline

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
