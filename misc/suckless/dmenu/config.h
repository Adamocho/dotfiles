static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Fira Code:size=12", "monospace:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#f56f6c", "#191C21" },
	[SchemeSel] = { "#191C21", "#ffffff" },
	[SchemeOut] = { "#191C21", "#252932" },
};

/* creates a vertical listing if nonzero */
static unsigned int lines      = 0;
static const char worddelimiters[] = " ";
