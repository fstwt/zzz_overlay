# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A strongly-typed functional programming language that compiles to JavaScript"
HOMEPAGE="https://www.purescript.org/"
SRC_URI="https://registry.npmjs.org/${PN}/-/${P}.tgz"
S="${WORKDIR}/package"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64"

RDEPEND="
	net-libs/nodejs
"
BDEPEND="
	>=net-libs/nodejs-16[npm]
"

src_compile() {
	# Skip, nothing to compile here.
	:
}

src_install() {
	local -a myopts=(
		--audit false
		--color false
		--foreground-scripts
		--global
		--offline
		--omit dev
		--prefix "${ED}/usr"
		--progress false
		--verbose
	)
	npm "${myopts[@]}" install "${DISTDIR}/${P}.tgz" || die "npm install failed"

	dodoc *.md *.txt
}
