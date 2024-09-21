# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit nodejs-pack

DESCRIPTION="ts-node"
HOMEPAGE="https://www.typescriptlang.org/
	https://github.com/microsoft/TypeScript/"
SRC_URI="https://registry.npmjs.org/${PN}/-/${P}.tgz"

S="${WORKDIR}"/package
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64"
