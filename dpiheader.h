#ifndef INCLUDED_DPIHEADER
#define INCLUDED_DPIHEADER

#ifdef __cplusplus
#define DPI_LINK_DECL extern "C"
#else
#define DPI_LINK_DECL
#endif

#include "svdpi.h"

#ifndef MTI_INCLUDED_TYPEDEF_uvm_hdl_path_slice
#define MTI_INCLUDED_TYPEDEF_uvm_hdl_path_slice

typedef struct {
    const char* path;
    int offset;
    int size;
} uvm_hdl_path_slice;

#endif

#ifndef MTI_INCLUDED_TYPEDEF_uvm_printer_row_info
#define MTI_INCLUDED_TYPEDEF_uvm_printer_row_info

typedef struct {
    int level;
    const char* name;
    const char* type_name;
    const char* size;
    const char* val;
} uvm_printer_row_info;

#endif

#ifndef MTI_INCLUDED_TYPEDEF_uvm_reg_bus_op
#define MTI_INCLUDED_TYPEDEF_uvm_reg_bus_op

typedef struct {
    int kind;
    svBitVecVal addr[SV_PACKED_DATA_NELEMS(64)];
    svBitVecVal data[SV_PACKED_DATA_NELEMS(64)];
    int n_bits;
    svBitVecVal byte_en[SV_PACKED_DATA_NELEMS(8)];
    int status;
} uvm_reg_bus_op;

#endif

DPI_LINK_DECL DPI_DLLESPEC
int
C_Program();

DPI_LINK_DECL DPI_DLLESPEC
const char*
uvm_dpi_get_next_arg_c();

DPI_LINK_DECL DPI_DLLESPEC
const char*
uvm_dpi_get_tool_name_c();

DPI_LINK_DECL DPI_DLLESPEC
const char*
uvm_dpi_get_tool_version_c();

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_dpi_regexec(
    void* preg,
    const char* str;
);

DPI_LINK_DECL DPI_DLLESPEC
void
uvm_dpi_regfree(
    void* preg);

DPI_LINK_DECL DPI_DLLESPEC
void
uvm_dump_re_cache();

DPI_LINK_DECL DPI_DLLESPEC
const char*
uvm_glob_to_re(
        const char* glob);

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_hdl_check_path(const char* path);

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_hdl_deposit(
        const char* path,
        const svLogicVecVal* value);

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_hdl_force(
        const char* path,
        const svLogicVecVal* value);

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_hdl_read(
        const char* path,
        const svLogicVecVal* value);

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_hdl_release(
        const char* path);

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_hdl_release(
        const char* path);

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_hdl_release_and_read(
        const char* path,
        svLogicVecVal* value);

DPI_LINK_DECL DPI_DLLESPEC
int
uvm_re_match(
        const char* re,
        const char* str);

DPI_LINK_DECL int
sv_read(
        int A,
        int* D);

DPI_LINK_DECL int
sv_write(
        int A,
        int D);
#endif
