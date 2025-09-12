static int topbar = 1;

static const int user_bh = 0;

static const char *fonts[] = {
	"Iosevka Nerd Font:size=11:style=Bold",
	"JoyPixels:pixelsize=11:antialias=true:autohint=true:style=Bold",
};

static const char *prompt = NULL;

static const unsigned int bgalpha = 0xe0;
static const unsigned int fgalpha = OPAQUE;

static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
[SchemeNorm] = { "#c0caf5", "#1a1b26" },
[SchemeSel]  = { "#1a1b26", "#7aa2f7" },
[SchemeOut]  = { "#000000", "#1a1b26" },
};
static const unsigned int alphas[SchemeLast][2] = {
	/*		fgalpha		bgalphga	*/
	[SchemeNorm] = { fgalpha, bgalpha },
	[SchemeSel] = { fgalpha, bgalpha },
	[SchemeOut] = { fgalpha, bgalpha },
};

static unsigned int lines = 10;
static int columns = 1; 

static const char worddelimiters[] = " ";
