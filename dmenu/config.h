static int topbar = 1;
static const int user_bh = 8;
static unsigned int lines = 0;
static int columns = 1; 

static const char *fonts[] = {
	"Iosevka Nerd Font:size=11:style=Bold",
	"JoyPixels:pixelsize=11:antialias=true:autohint=true:style=Bold",
};

static const char *prompt = NULL;
static const unsigned int bgalpha = 0xe0;
static const unsigned int fgalpha = OPAQUE;

static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
[SchemeNorm] = { "#abb2bf", "#282c34" },
[SchemeSel]  = { "#282c34", "#61afef" },
[SchemeOut]  = { "#282c34", "#282c34" },
};

static const unsigned int alphas[SchemeLast][2] = {
	/*		fgalpha		bgalphga	*/
	[SchemeNorm] = { fgalpha, bgalpha },
	[SchemeSel] = { fgalpha, bgalpha },
	[SchemeOut] = { fgalpha, bgalpha },
};

static const char worddelimiters[] = " ";
