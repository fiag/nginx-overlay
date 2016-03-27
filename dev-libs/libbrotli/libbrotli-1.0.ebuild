# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools-utils eutils libtool

MY_P="${PN}-${PN}-${PV}"
BROTLI_V="cfba2db7b3f78d6108d2228a535ef4f96ab086fb"

DESCRIPTION="Wrapper scripts and code around the brotli code base."
HOMEPAGE="https://github.com/bagder/libbrotli"
SRC_URI="https://github.com/bagder/libbrotli/archive/${P}.tar.gz
    https://github.com/google/brotli/archive/${BROTLI_V}.tar.gz -> brotli-${BROTLI_V}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_P}"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	rmdir "${S}/brotli" || die "rmdir brotli"
	mv "${WORKDIR}/brotli-${BROTLI_V}" "${S}/brotli" || die "die moving brotli"
}

src_prepare() {
	./autogen.sh || die
}

