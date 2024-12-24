# scarab-learning
Learning Risc-V through OS Dev

# RISC-V OS Development Curriculum

## Phase 1: Fundamentals
1. **RISC-V ISA and Assembly Basics**
   - Register set, instruction formats
   - Basic arithmetic, logic operations
   - Memory access patterns
   - Build: Simple calculator program

2. **Memory and Stack Management**
   - Stack operations, calling conventions
   - Memory layout, sections
   - Build: Function call framework with parameter passing

3. **Bare Metal Programming**
   - Boot sequence
   - CSR manipulation
   - UART initialization
   - Build: Bootloader with UART output

4. **Privilege Levels and Exceptions**
   - M/S/U modes
   - Trap handling
   - CSR programming
   - Build: Exception handler framework

## Phase 2: Core OS Components
5. **Memory Management Unit**
   - Page tables setup
   - Virtual memory mapping
   - TLB management
   - Build: Basic virtual memory system

6. **Device Discovery**
   - Device tree parsing
   - MMIO handling
   - PCI enumeration
   - Build: Hardware discovery subsystem

7. **Interrupt Controller**
   - PLIC/CLINT setup
   - IRQ handling
   - Timer configuration
   - Build: Interrupt management system

8. **Process Management**
   - Context switching
   - Process states
   - Scheduling algorithms
   - Build: Cooperative multitasking

## Phase 3: Hardware Integration
9. **Device Drivers Framework**
   - Driver model
   - Device abstraction
   - Resource management
   - Build: Driver registration system

10. **GPU/Graphics Discovery**
    - Graphics hardware detection
    - Framebuffer setup
    - Basic acceleration probing
    - Build: Graphics subsystem initialization

11. **AI Accelerator Integration**
    - Neural engine detection
    - Acceleration interfaces
    - Resource allocation
    - Build: AI hardware abstraction layer

12. **Custom Hardware Support**
    - Custom MMIO handling
    - Hardware-specific drivers
    - Extension discovery
    - Build: Custom hardware integration framework

## Phase 4: Language and Runtime Support
13. **C/Rust Integration**
    - FFI interfaces
    - ABI compatibility
    - Memory models
    - Build: Language runtime support

14. **Package Management**
    - Package format
    - Dependency resolution
    - Version management
    - Build: Basic package manager

15. **Dynamic Loading**
    - ELF parsing
    - Dynamic linking
    - Symbol resolution
    - Build: Dynamic loader

16. **System Calls**
    - Syscall interface
    - Parameter passing
    - Return handling
    - Build: Syscall framework

## Phase 5: Advanced Features
17. **Networking Stack**
    - Protocol integration
    - Network device management
    - Custom protocol support
    - Build: Network subsystem

18. **Filesystem Integration**
    - VFS layer
    - Custom FS support
    - Buffer management
    - Build: Filesystem framework

19. **Resource Management**
    - Memory pools
    - Device sharing
    - Power management
    - Build: Resource manager

20. **System Integration**
    - Component integration
    - Boot sequence
    - Configuration
    - Build: Complete OS

Each lesson includes:
- Theory component
- Hands-on implementation
- Testing framework
- Integration with previous components
- Documentation requirements

Final project combines all components into a functional OS with:
- Hardware discovery
- Resource management
- Language support
- Package management
- Custom protocol handling
- Graphics/AI acceleration support
