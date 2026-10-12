# Bash Scripting Mastery

A structured, hands-on repository covering foundational to advanced **Bash Shell Scripting**, Linux automation, and command-line programming.

---

## 📂 Repository Structure

The scripts are organized into modular, progressive learning modules:

```plaintext
Bash_Scripting/
├── 01_Basics/                  # Variables, user input, arguments, comments
├── 02_Conditionals_and_Logic/  # if-else, case statements, file tests, comparison operators
├── 03_Arithmetic_and_Arrays/   # Integer math, floating point (bc), indexed arrays
├── 04_Loops/                   # while, until, for, select loops, file reading, break/continue
├── 05_Functions/               # Function definitions, parameter passing, local variables
├── 06_Advanced_and_Debugging/  # Signals & traps, readonly variables, debugging techniques
├── Exercise/                   # Hands-on problem sets & mini-projects (Sysinfo, Digital Clock, etc.)
└── practice/                   # Practice task solutions & test outputs
```

---

## 📚 Module Overview

### `01_Basics`
* `1_hello.sh` – Shebang (`#!/bin/bash`) and basic script output (`echo`)
* `2_comments.sh` – Single-line (`#`) and multi-line comments
* `3_variables.sh` – Variable assignment, naming rules, and expansion
* `4_user_input.sh` – Reading interactive terminal input (`read`)
* `4_user_input_sameline.sh` – Prompting input on the same line (`read -p`)
* `4_read_without_var.sh` – Utilizing the default `$REPLY` variable
* `4_multipleinput_stored_array.sh` – Reading space-separated values into an array (`read -a`)
* `5_pass_arguments.sh` – Positional parameters (`$1`, `$2`), argument count (`$#`), and all arguments (`$@`, `$*`)

### `02_Conditionals_and_Logic`
* `6_if_statement.sh` – Basic conditional tests
* `6_if_else_statement.sh` – Two-way conditional branching
* `6_if_elif_statement.sh` – Multi-branch decision ladders
* `7_integer_comparsion.sh` – Integer comparison operators (`-eq`, `-ne`, `-gt`, `-lt`, `-ge`, `-le`)
* `7_string_comparsion.sh` – String equality, inequality, and empty checks (`-z`, `-n`, `=`, `!=`)
* `8_file_test.sh` – File attribute checks (`-e`, `-f`, `-d`, `-r`, `-w`, `-x`)
* `8_append_text_toEOF.sh` – Appending output and Here-Documents (`cat << EOF`)
* `9_logical_and.sh` – Logical AND evaluation (`&&`, `-a`)
* `9_logical_or.sh` – Logical OR evaluation (`||`, `-o`)
* `11_case_statement.sh` – Multi-branch pattern matching using `case`
* `11_case_example.sh` – Practical menu-driven selection using `case`

### `03_Arithmetic_and_Arrays`
* `10_arithmetic_operations.sh` – Integer arithmetic evaluation (`$(( ... ))`, `expr`)
* `10_arithmetic_op_float.sh` – Floating-point calculations via `bc` (basic calculator)
* `12_array.sh` – Array indexing, length (`${#arr[@]}`), slicing, and iteration

### `04_Loops`
* `13_while_loop.sh` – Standard condition-driven `while` iteration
* `13_sleep.sh` – Execution delays with `sleep` inside loops
* `13_open_terminal.sh` – Process launching and multi-terminal spawns
* `13_read_file.sh` – Reading files line-by-line using a `while` loop
* `13_readfile_IFS.sh` – Preserving whitespace with custom Internal Field Separator (`IFS`)
* `13_factorial.sh` & `14_factorial.sh` – Iterative factorial calculations
* `14_until_loop.sh` – Running loops until a condition evaluates to true
* `15_for_loops.sh` – Range (`{1..10}`) and list-based `for` iteration
* `15_forloop_cmds.sh` – Iterating over command output
* `16_select_loop.sh` – Generating interactive numbered menus with `select`
* `17_break.sh` & `17_continue.sh` – Loop interruption and cycle skipping

### `05_Functions`
* `18_functions.sh` – Function syntax and call semantics
* `18_passing_argument_fun.sh` – Function arguments and return status
* `19_local_variable.sh` – Scope isolation with `local` variables
* `19_Example.sh` – Modular function architecture

### `06_Advanced_and_Debugging`
* `20_read_only_cmd.sh` – Locking variable and function mutability (`readonly`)
* `21_signals_traps.sh` – Intercepting OS signals (`SIGINT`, `SIGTERM`) with `trap`
* `22_debug_script.sh` – Shell debugging modes (`set -x`, `set -e`, `bash -x`)

### `Exercise` & `practice`
* Contains 19 challenge scripts: System Information tool (`19_sysinfo.sh`), Digital Clock (`17_Digital_Clock.sh`), Command-line flag parsing (`14_getopts_statement.sh`), Number reversal, and text search tools.
* 10 multi-step practice tasks for shell automation workflows.

---

## 🚀 How to Run

1. Make any script executable:
   ```bash
   chmod +x 01_Basics/1_hello.sh
   ```
2. Run directly:
   ```bash
   ./01_Basics/1_hello.sh
   ```
   or with bash:
   ```bash
   bash 01_Basics/1_hello.sh
   ```

