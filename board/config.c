#include "config_common.h"

#define VENDOR_ID       0x6969
#define PRODUCT_ID      0x6969
#define DEVICE_VER      0x0001
#define MANUFACTURER    ArchUsr64
#define PRODUCT         12x4_Nugget

#define MATRIX_ROWS 4
#define MATRIX_COLS 12

/* key matrix pins */
#define MATRIX_ROW_PINS { F6, B3, B2, B6 }
#define MATRIX_COL_PINS { F4, F5, B5, B4, E6, D7, C6, D4, D0, D1, D2, D3 }
#define UNUSED_PINS

#define DIODE_DIRECTION COL2ROW

#define DEBOUNCE 5

#define LOCKING_SUPPORT_ENABLE

#define USB_POLLING_INTERVAL_MS 1

#define FORCE_NKRO

#define MK_3_SPEED
#define MK_MOMENTARY_ACCEL
