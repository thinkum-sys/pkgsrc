# $NetBSD: Makefile,v 1.27 2020/08/14 20:01:37 bsiegert Exp $

DISTNAME=	go-md2man-1.0.8
MASTER_SITES=	${MASTER_SITE_GITHUB:=cpuguy83/}
PKGREVISION=	18
CATEGORIES=	textproc
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/cpuguy83/go-md2man/
COMMENT=	Uses blackfriday to process markdown into man pages
LICENSE=	mit

GO_DIST_BASE=	${DISTNAME}
GO_SRCPATH=	github.com/cpuguy83/go-md2man

REPLACE_SH=	script/setup/dev-tools script/validate/vendor

post-install:
	${RM} -rf ${DESTDIR}${PREFIX}/gopkg/pkg/${GO_PLATFORM}/${GO_SRCPATH}/vendor

.include "../../devel/go-blackfriday/buildlink3.mk"
.include "../../devel/go-sanitized_anchor_name/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
