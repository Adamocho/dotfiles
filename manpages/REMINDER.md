# Manpages file hierarchy

A little reminder about the structure of manpages

> NOTE: Please read the man manpages for more information

```sh
man man
# OR 
man man-pages
```

## Quick recap

1.   Executable programs or shell commands
2.   System calls (functions provided by the kernel)
3.   Library calls (functions within program libraries)
4.   Special files (usually found in /dev)
5.   File formats and conventions, e.g. /etc/passwd
6.   Games
7.   Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7), man-pages(7)
8.   System administration commands (usually only for root)
9.   Kernel routines [Non standard]

## File tree in this directory

```
manpages/
├── man1
├── man2
├── man3
├── man4
├── man5
├── man6
├── man7
├── man8
└── REMINDER.md
```