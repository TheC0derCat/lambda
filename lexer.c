enum token_type{
	LAMDA,
	VARIABLE,
	SEPERATER,
	OPEN_SCOPE,
	CLOSE_SCOPE,
};
struct token{
	enum token_type type;
	char *source;
};
struct token next_token(char *buffer){
	struct token tok;
	char ch = *buffer;
	switch(ch){
		case '\\': tok.type = LAMDA; break;
		case '.': tok.type = SEPERATER; break;
		case '(': tok.type = OPEN_SCOPE; break;
		case ')': tok.type = CLOSE_SCOPE; break;
	}
	return tok;
}
