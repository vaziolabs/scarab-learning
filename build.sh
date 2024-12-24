#!/bin/bash

# Default RISC-V toolchain settings
RISCV_PREFIX="riscv64-elf-"
RISCV_GCC="${RISCV_PREFIX}gcc"
RISCV_OBJCOPY="${RISCV_PREFIX}objcopy"
RISCV_OBJDUMP="${RISCV_PREFIX}objdump"

# QEMU settings
QEMU_SYSTEM="qemu-system-riscv64"
QEMU_FLAGS="-machine virt -nographic -bios none"

# Build settings
BUILD_DIR="build"
CFLAGS="-march=rv64gc -mabi=lp64d -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -O2"

function print_usage() {
    echo "Usage: $0 <section> <example> [run|build|clean]"
    echo "Example: $0 1 calculator build"
    echo "         $0 3 bootloader run"
    exit 1
}

# Check arguments
if [ $# -lt 2 ]; then
    print_usage
fi

SECTION=$1
EXAMPLE=$2
ACTION=${3:-"build"}  # Default action is build

# Setup paths
EXAMPLE_PATH="${SECTION}/${EXAMPLE}"
SRC_DIR="${EXAMPLE_PATH}/src"
TEST_DIR="${EXAMPLE_PATH}/tests"
OUTPUT_DIR="${BUILD_DIR}/${EXAMPLE_PATH}"

# Create build directory
mkdir -p "${OUTPUT_DIR}"

function build_example() {
    echo "Building ${EXAMPLE_PATH}..."
    
    # Check if src directory exists
    if [ ! -d "${SRC_DIR}" ]; then
        echo "Error: Source directory ${SRC_DIR} not found!"
        exit 1
    fi

    # Compile all .c and .S files
    for src in ${SRC_DIR}/*.{c,S}; do
        if [ -f "$src" ]; then
            filename=$(basename -- "$src")
            object="${OUTPUT_DIR}/${filename%.*}.o"
            echo "Compiling $src..."
            ${RISCV_GCC} ${CFLAGS} -c "$src" -o "$object"
        fi
    done

    # Link
    echo "Linking..."
    ${RISCV_GCC} ${CFLAGS} ${OUTPUT_DIR}/*.o -T "${SRC_DIR}/link.ld" -o "${OUTPUT_DIR}/${EXAMPLE}.elf"
    
    # Create binary
    ${RISCV_OBJCOPY} -O binary "${OUTPUT_DIR}/${EXAMPLE}.elf" "${OUTPUT_DIR}/${EXAMPLE}.bin"
    
    # Generate assembly listing
    ${RISCV_OBJDUMP} -D "${OUTPUT_DIR}/${EXAMPLE}.elf" > "${OUTPUT_DIR}/${EXAMPLE}.lst"
}

function run_example() {
    if [ ! -f "${OUTPUT_DIR}/${EXAMPLE}.bin" ]; then
        echo "Binary not found. Building first..."
        build_example
    fi
    
    echo "Running ${EXAMPLE_PATH}..."
    ${QEMU_SYSTEM} ${QEMU_FLAGS} -kernel "${OUTPUT_DIR}/${EXAMPLE}.bin"
}

function clean_example() {
    echo "Cleaning ${EXAMPLE_PATH}..."
    rm -rf "${OUTPUT_DIR}"
}

# Execute requested action
case ${ACTION} in
    "build")
        build_example
        ;;
    "run")
        run_example
        ;;
    "clean")
        clean_example
        ;;
    *)
        echo "Invalid action: ${ACTION}"
        print_usage
        ;;
esac
