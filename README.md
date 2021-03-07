# 18240 Assembler for the RISC240 ISA
The RISC240 ISA has been taught in 18-240 ever since Spring 2019.
This repo holds the assembler for the RISC240 ISA

Written in Python3, by Bill Nace

## Repository Organization
The repository is organized into the following branches:

| Branch Name    | Description                                                         |
| -------------: | ------------------------------------------------------------------- |
| `master`       | Track overall project, some example files, etc |
| `dev/staff`    | Development branch for staff-facing files                           |
| `dev/student`  | Development branch for student-facing files                         |
| `prod/staff`   | Production branch for staff-facing files (to host on AFS)           |
| `prod/student` | Production branch for student-facing files (to host on AFS          |

All development is to be done on the `dev/*` branches. Once new features are
complete **and have been tested**, they may be merged to their respective `prod/*`
branch.

The `master` branch is just here to document the roadmap of the project as a
whole (i.e. both student and staff branches). 

## TODOs
### Overall TODOs
- Decide if I really need student and staff brnches.
- Write different READMEs for both staff and student branches, if necessary
- Update argument parsing to use ArgParser

### Staff TODOs
- Add any staff TODOs

### Student TODOs
- Add any student TODOs

## Installation in AFS
1. `cd` to the folder where the **student** scripts should be deployed
2. Clone the student repo

```bash
$ cd $STUDENT_BIN_DIR
$ git clone https://github.com/CMU-18240/as240.git -b prod/student
```
3. `cd` to the folder where the **staff** scripts should be deployed
4. Clone the staff repo

```bash
$ cd $STAFF_BIN_DIR
$ git clone https://github.com/CMU-18240/as240.git -b prod/staff
```
