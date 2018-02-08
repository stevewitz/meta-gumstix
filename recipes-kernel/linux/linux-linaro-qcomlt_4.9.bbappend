# Downgrade kernel version from 4.9.56 to 4.9.39, fixed the bluetooth issue temporarily
SRCREV = "8165c999c87f1fe205e6fad779ded1f3e9bc382f"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://fragment.cfg \
    file://Add-ov5640-support-dragonboard.patch \
    file://Add-ov5640-devicetree.patch \
"

do_configure_append () {
    ${S}/scripts/kconfig/merge_config.sh -m -O ${WORKDIR}/build ${WORKDIR}/build/.config ${WORKDIR}/*.cfg
    yes '' | make oldconfig
}