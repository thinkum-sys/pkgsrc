# $NetBSD: Makefile,v 1.19 2020/08/14 20:01:35 bsiegert Exp $

DISTNAME=	godirwalk-1.7.3
PKGNAME=	go-${DISTNAME}
PKGREVISION=	18
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=karrick/}
GITHUB_PROJECT=	godirwalk
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	https://github.com/karrick/godirwalk
COMMENT=	Fast directory traversal for Golang
LICENSE=	2-clause-bsd

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/karrick/godirwalk

.include "../../devel/go-errors/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
