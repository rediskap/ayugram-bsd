PORTNAME=	ayugram-desktop
DISTVERSION=	7.2.9
CATEGORIES=	net-im

MAINTAINER=	dimred@icloud.com
COMMENT=	Telegram Desktop fork with Ghost mode (AyuGram)
WWW=		https://github.com/AyuGram/AyuGramDesktop

LICENSE=	GPLv3

BUILD_DEPENDS=	boost-libs>0:devel/boost-libs \
		microsoft-gsl>0:devel/microsoft-gsl \
		range-v3>0:devel/range-v3 \
		tl-expected>0:devel/tl-expected \
		toomanycooks>0:devel/toomanycooks \
		v4l_compat>0:multimedia/v4l_compat \
		vulkan-headers>0:graphics/vulkan-headers \
		yasm:devel/yasm \
		git:devel/git \
		${LOCALBASE}/lib/libtde2e.a:net-im/tde2e \
		${LOCALBASE}/lib/libtg_owt.a:net-im/tg_owt \
                ${LOCALBASE}/lib/libtlottie.a:graphics/tlottie

LIB_DEPENDS=	libabsl_base.so:devel/abseil \
		libada.so:devel/libada \
		libavformat.so:multimedia/ffmpeg \
		libcrc32c.so:devel/crc32c \
		libdbus-1.so:devel/dbus \
		libdispatch.so:devel/libdispatch \
		libfido2.so:security/libfido2 \
		libfmt.so:devel/libfmt \
		libheif.so:graphics/libheif \
		libhunspell-1.7.so:textproc/hunspell \
		libjxl.so:graphics/libjxl \
		liblz4.so:archivers/liblz4 \
		libopenh264.so:multimedia/openh264 \
		libopus.so:audio/opus \
		libpipewire-0.3.so:multimedia/pipewire \
		libqrcodegencpp.so:graphics/qr-code-generator \
		librnnoise.so:audio/rnnoise \
		libsrtp2.so:net/libsrtp2 \
		libxxhash.so:devel/xxhash \
		libvpx.so:multimedia/libvpx \
		libxcb-keysyms.so:x11/xcb-util-keysyms \
		libxkbcommon.so:x11/libxkbcommon

USES=		cmake compiler:c++20-lang desktop-file-utils gl gnome jpeg kde:6 \
		localbase minizip openal pkgconfig python:build qt:6 ssl xorg
USE_QT=		5compat base declarative imageformats lottie shadertools svg \
		wayland tools:build
USE_KDE=	coreaddons kimageformats
USE_GL=		gl
USE_GNOME=	glib20 glibmm26 introspection
USE_XORG=	x11 xcb xcomposite xdamage xext xfixes xrandr xtst

CMAKE_ARGS=	-DTDESKTOP_API_ID=209235 \
		-DTDESKTOP_API_HASH=169ee702e1df4b6e66d80311db36cc43 \
		-DQT_VERSION_MAJOR=6 \
		-DLINUX=true \
		-Dtde2e_DIR=${LOCALBASE}/lib/cmake/tde2e
# 
CMAKE_ON=	DESKTOP_APP_USE_PACKAGED \
		DESKTOP_APP_DISABLE_CRASH_REPORTS \
		DESKTOP_APP_DISABLE_QT_PLUGINS

LDFLAGS+=	-lBlocksRuntime

NO_CHECKSUM=	yes
WRKSRC=		${WRKDIR}/AyuGramDesktop

do-fetch:
	@${DO_NADA}

do-extract:
	@${MKDIR} ${WRKDIR}
	git clone --branch v${DISTVERSION} --depth 1 \
		--recurse-submodules --shallow-submodules \
		https://github.com/AyuGram/AyuGramDesktop.git ${WRKSRC}

post-extract:
	${RM} -rf \
		${WRKSRC}/Telegram/ThirdParty/GSL \
		${WRKSRC}/Telegram/ThirdParty/QR \
		${WRKSRC}/Telegram/ThirdParty/TooManyCooks \
		${WRKSRC}/Telegram/ThirdParty/dispatch \
		${WRKSRC}/Telegram/ThirdParty/expected \
		${WRKSRC}/Telegram/ThirdParty/fcitx5-qt \
		${WRKSRC}/Telegram/ThirdParty/hime \
		${WRKSRC}/Telegram/ThirdParty/hunspell \
		${WRKSRC}/Telegram/ThirdParty/jemalloc \
		${WRKSRC}/Telegram/ThirdParty/jimf \
		${WRKSRC}/Telegram/ThirdParty/kcoreaddons \
		${WRKSRC}/Telegram/ThirdParty/kimageformats \
		${WRKSRC}/Telegram/ThirdParty/lz4 \
		${WRKSRC}/Telegram/ThirdParty/minizip \
		${WRKSRC}/Telegram/ThirdParty/plasma-wayland-protocols \
		${WRKSRC}/Telegram/ThirdParty/range-v3 \
		${WRKSRC}/Telegram/ThirdParty/wayland \
		${WRKSRC}/Telegram/ThirdParty/wayland-protocols \
		${WRKSRC}/Telegram/ThirdParty/xxHash

post-patch:
	${REINPLACE_CMD} -e '/-Wno-maybe-uninitialized/d' \
		-e '/-fstack-clash-protection/d' \
		${WRKSRC}/cmake/options_linux.cmake

.include <bsd.port.mk>
