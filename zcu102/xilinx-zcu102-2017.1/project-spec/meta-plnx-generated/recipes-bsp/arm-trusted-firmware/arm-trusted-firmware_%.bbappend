
EXTRA_OEMAKE_append = " ${extra_settings} PRELOADED_BL33_BASE=${atf_bl33_load} ZYNQMP_ATF_MEM_BASE=${atf_mem_base} ZYNQMP_ATF_MEM_SIZE=${atf_mem_size}"
sysconf = "${TOPDIR}/../project-spec/configs"
FILESEXTRAPATHS_append := ":${sysconf}"
SRC_URI_append ="\
    file://config\
"
atf_mem_size = "0x16000"
atf_bl33_load = "0x8000000"
atf_mem_base = "0xFFFEA000"
extra_settings = ""
