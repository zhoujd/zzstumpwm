/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "black",     /* wrong password #CC3333 -> black */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
