# $NetBSD: Makefile,v 1.39 2020/01/18 23:32:12 rillig Exp $
#

DISTNAME=	goocanvas-1.0.0
PKGREVISION=	25
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/goocanvas/1.0/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://live.gnome.org/GooCanvas
COMMENT=	Cairo-based canvas widget for GTK+
LICENSE=	gnu-lgpl-v2

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_TOOLS+=		pkg-config msgfmt
USE_PKGLOCALEDIR=	yes

PKGCONFIG_OVERRIDE+=	goocanvas.pc.in

.include "../../devel/glib2/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk2+=	gtk2+>=2.12.0
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
