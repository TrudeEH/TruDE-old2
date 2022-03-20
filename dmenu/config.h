/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#d8dee9", "#2e3440" },
	[SchemeSel] = { "#d8dee9", "#5e81ac" },
	[SchemeSelHighlight] = { "#ebcb8b", "#5e81ac" },
	[SchemeNormHighlight] = { "#ebcb8b", "#2e3440" },
	[SchemeOut] = { "#2e3440", "#5e81ac" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 25;
static unsigned int min_lineheight = 25;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
