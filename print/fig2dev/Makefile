# $NetBSD: Makefile,v 1.6 2020/05/16 02:15:06 joerg Exp $

DISTNAME=	fig2dev-3.2.7b
CATEGORIES=	graphics print
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=mcj/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://mcj.sourceforge.net/
COMMENT=	Convert .fig files to graphical or printable formats

GNU_CONFIGURE=	yes

LDFLAGS.SunOS+=	-liconv

DEPENDS+=	rgb-[0-9]*:../../x11/rgb
CONFIGURE_ARGS+=--with-rgbfile=${PREFIX}/share/X11/rgb.txt

.include "../../graphics/png/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
