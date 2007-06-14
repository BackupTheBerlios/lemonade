/* lempar.d - driver template for the LEMONade parser generator.
** The author disclaims copyright to this source code.
*/
/* First off, code is include which follows the "import" declaration
** in the input file. */

private import std.stdio;
private import std.c.stdlib;


import std.stdio;
import std.c.stdlib;
/* Next is all token values, in a form suitable for use by makeheaders.
** This section will be null unless lemon is run with the -m switch.
*/
/* 
** These constants (all generated automatically by the parser generator)
** specify the various kinds of tokens (terminals) that the parser
** understands. 
**
** Each symbol here is a terminal symbol in the grammar.
*/
/* Make sure the INTERFACE macro is defined.
*/
/+
@ifndef INTERFACE
   @define INTERFACE 1
@endif
+/
/* The next thing included is series of defines which control
** various aspects of the generated parser.
**    YYCODETYPE         is the data type used for storing terminal
**                       and nonterminal numbers.  "unsigned char" is
**                       used if there are fewer than 250 terminals
**                       and nonterminals.  "int" is used otherwise.
**    YYNOCODE           is a number of type YYCODETYPE which corresponds
**                       to no legal terminal or nonterminal number.  This
**                       number is used to fill in empty slots of the hash 
**                       table.
**    YYFALLBACK         If defined, this indicates that one or more tokens
**                       have fall-back values which should be used if the
**                       original value of the token will not parse.
**    YYACTIONTYPE       is the data type used for storing terminal
**                       and nonterminal numbers.  "unsigned char" is
**                       used if there are fewer than 250 rules and
**                       states combined.  "int" is used otherwise.
**    ParseTOKENTYPE     is the data type used for minor tokens given 
**                       directly to the parser from the tokenizer.
**    YYMINORTYPE        is the data type used for all minor tokens.
**                       This is typically a union of many types, one of
**                       which is ParseTOKENTYPE.  The entry in the union
**                       for base tokens is called "yy0".
**    YYSTACKDEPTH       is the maximum depth of the parser's stack.  If
**                       zero the stack is dynamically sized using realloc()
**    ParseARG_SDECL     A static variable declaration for the %extra_argument
**    ParseARG_PDECL     A parameter declaration for the %extra_argument
**    ParseARG_STORE     Code to store %extra_argument into yypParser
**    ParseARG_FETCH     Code to extract %extra_argument from yypParser
**    YYNSTATE           the combined number of states.
**    YYNRULE            the number of rules in the grammar
**    YYERRORSYMBOL      is the code number of the error symbol.  If not
**                       defined, then do no error processing.
*/
alias char  YYCODETYPE;
const int YYNOCODE = 10;
alias char  YYACTIONTYPE;
alias int ParseTOKENTYPE; 
alias int GTOKENTYPE; 
union YYMINORTYPE {
  ParseTOKENTYPE yy0;
  int yy19;
} ;
const int YYSTACKDEPTH = 100;

const int ParseARG_SDECL = 0;
const int ParseARG_PDECL = 0;
const int ParseARG_FETCH = 0;
const int ParseARG_STORE = 0;
const int  YYNSTATE = 11;
const int  YYNRULE = 6;
const int  YYERRORSYMBOL = 6;
const char[]  YYERRSYMDT = "yy19";
const int  YYFALLBACK = 0;

const int YY_NO_ACTION     = (YYNSTATE+YYNRULE+2);
const int YY_ACCEPT_ACTION = (YYNSTATE+YYNRULE+1);
const int YY_ERROR_ACTION  = (YYNSTATE+YYNRULE);

/* Next are that tables used to determine what action to take based on the
** current state and lookahead token.  These tables are used to implement
** functions that take a state number and lookahead value and return an
** action integer.  
**
** Suppose the action integer is N.  Then the action is determined as
** follows
**
**   0 <= N < YYNSTATE                  Shift N.  That is, push the lookahead
**                                      token onto the stack and goto state N.
**
**   YYNSTATE <= N < YYNSTATE+YYNRULE   Reduce by rule N-YYNSTATE.
**
**   N == YYNSTATE+YYNRULE              A syntax error has occurred.
**
**   N == YYNSTATE+YYNRULE+1            The parser accepts its input.
**
**   N == YYNSTATE+YYNRULE+2            No such action.  Denotes unused
**                                      slots in the yy_action[] table.
**
** The action table is constructed as a single large table named yy_action[].
** Given state S and lookahead X, the action is computed as
**
**      yy_action[ yy_shift_ofst[S] + X ]
**
** If the index value yy_shift_ofst[S]+X is out of range or if the value
** yy_lookahead[yy_shift_ofst[S]+X] is not equal to X or if yy_shift_ofst[S]
** is equal to YY_SHIFT_USE_DFLT, it means that the action is not in the table
** and that yy_default[S] should be used instead.  
**
** The formula above is for computing the action when the lookahead is
** a terminal symbol.  If the lookahead is a non-terminal (as occurs after
** a reduce action) then the yy_reduce_ofst[] array is used in place of
** the yy_shift_ofst[] array and YY_REDUCE_USE_DFLT is used in place of
** YY_SHIFT_USE_DFLT.
**
** The following are the tables generated in this section:
**
**  yy_action[]        A single table containing all actions.
**  yy_lookahead[]     A table containing the lookahead for each entry in
**                     yy_action.  Used to detect hash collisions.
**  yy_shift_ofst[]    For each state, the offset into yy_action for
**                     shifting terminals.
**  yy_reduce_ofst[]   For each state, the offset into yy_action for
**                     shifting non-terminals after a reduce.
**  yy_default[]       Default action for each state.
*/
static const YYACTIONTYPE[] yy_action = [
 /*     0 */     4,    2,    1,    3,   18,    5,    1,    3,    6,   10,
 /*    10 */     8,   19,   19,    9,    7,
];
static const YYCODETYPE[] yy_lookahead = [
 /*     0 */     1,    2,    3,    4,    7,    8,    3,    4,    8,    5,
 /*    10 */     8,    9,    9,    8,    8,
];
const int YY_SHIFT_USE_DFLT = -2;
const int YY_SHIFT_MAX  = 7;
static const byte [] yy_shift_ofst = [
 /*     0 */     4,    4,    4,    4,    4,   -1,    3,    3,
];
const int YY_REDUCE_USE_DFLT = -4;
const int YY_REDUCE_MAX = 4;
static const byte [] yy_reduce_ofst = [
 /*     0 */    -3,    5,    6,    2,    0,
];
static const YYACTIONTYPE[] yy_default = [
 /*     0 */    17,   17,   17,   17,   17,   11,   13,   12,   14,   15,
 /*    10 */    16,
];

/* The next table maps tokens into fallback tokens.  If a construct
** like the following:
** 
**      %fallback ID X Y Z.
**
** appears in the grammer, then ID becomes a fallback token for X, Y,
** and Z.  Whenever one of the tokens X, Y, or Z is input to the parser
** but it does not parse, the type of the token is changed to ID and
** the parse is retried before an error is thrown.
*/

static if (YYFALLBACK == 1) {
   static YYCODETYPE yyFallback[] =
   [
   ];
}

/* The following structure represents a single element of the
** parser's stack.  Information stored includes:
**
**   +  The state number for the parser at this level of the stack.
**
**   +  The value of the token stored at this level of the stack.
**      (In other words, the "major" token.)
**
**   +  The semantic value stored at this level of the stack.  This is
**      the information used by the action routines in the grammar.
**      It is sometimes called the "minor" token.
*/
struct yyStackEntry
{
  int stateno;          // The state-number
  int major;            // The major token value. This is the code
                        // number for the token at this stack level
  YYMINORTYPE minor;    // The user-supplied minor token value. (yylval in YACC)
                        // This is the value of the token
};

struct yyParser
{
  int yyidx;                           /* Index of top element in stack */
  int yyerrcnt;                        /* Shifts left before out of the error */
//  ParseARG_SDECL;                       /* A place to hold %extra_argument */
  yyStackEntry yystack[YYSTACKDEPTH];  /* The parser's stack */
};

/* The state of the parser is completely contained in an instance of
** the following structure */

debug(0)
{
   static FILE *yyTraceFILE = null;
   static char *yyTracePrompt = null;
}


debug(0)
{
	/* 
	** Turn parser tracing on by giving a stream to which to write the trace
	** and a prompt to preface each trace message.  Tracing is turned off
	** by making either argument NULL 
	**
	** Inputs:
	** <ul>
	** <li> A FILE* to which trace output should be written.
	**      If NULL, then tracing is turned off.
	** <li> A prefix string written at the beginning of every
	**      line of trace output.  If NULL, then tracing is
	**      turned off.
	** </ul>
	**
	** Outputs:
	** None.
	*/
   void ParseTrace( FILE *TraceFILE, char *TracePrompt )
   {
      yyTraceFILE = TraceFILE;
      yyTracePrompt = TracePrompt;
      if( yyTraceFILE == null )
         yyTracePrompt = null;
      else if( yyTracePrompt == "" )
         yyTraceFILE = null;
   }
}

debug(0)
{
	/* For tracing shifts, the names of all terminals and nonterminals
	** are required.  The following table supplies these names */
   static const char *yyTokenName[] =
   [
  "$",             "PLUS",          "MINUS",         "DIVIDE",      
  "TIMES",         "INTEGER",       "error",         "program",     
  "expr",        
   ];
}

debug(0)
{
   static const char *yyRuleName[] =
   [
 /*   0 */ "program ::= expr",
 /*   1 */ "expr ::= expr MINUS expr",
 /*   2 */ "expr ::= expr PLUS expr",
 /*   3 */ "expr ::= expr TIMES expr",
 /*   4 */ "expr ::= expr DIVIDE expr",
 /*   5 */ "expr ::= INTEGER",
   ];
}

char *ParseTokenName(int tokenType)
{
   debug(0)
   {
      if( tokenType > 0 && tokenType < yyTokenName.length )
         return yyTokenName[ tokenType ];
      else
         return "Unknown";
   }
   else
   {
      return "";
   }
}

/* 
** This function allocates a new parser.
** The only argument is a pointer to a function which works like
** malloc.
**
** Inputs:
** A pointer to the function used to allocate memory.
**
** Outputs:
** A pointer to a parser.  This pointer is used in subsequent calls
** to Parse and ParseFree.
*/

yyParser *AllocParser( )
{
   yyParser *yyP;
   yyP = cast(yyParser*) malloc( yyParser.sizeof );
   if( yyP )
      yyP.yyidx = -1;
   return yyP;
}


/* The following function deletes the value associated with a
** symbol.  The symbol can be either a terminal or nonterminal.
** "yymajor" is the symbol code, and "yypminor" is a pointer to
** the value.
*/
static void yy_destructor( YYCODETYPE yymajor, YYMINORTYPE *yypminor )
{
   switch( yymajor )
   {
   	 /* Here is inserted the actions which take place when a
    ** terminal or non-terminal is destroyed.  This can happen
    ** when the symbol is popped from the stack during a
    ** reduce or during error processing or when a parser is 
    ** being destroyed before it is finished parsing.
    **
    ** Note: during a reduce, the only symbols destroyed are those
    ** which appear on the RHS of the rule, but which are not used
    ** inside the C code.
    */

      default:    // If no destructor action specified: do nothing
         break;
   }
}

/*
** Pop the parser's stack once.
**
** If there is a destructor routine associated with the token which
** is popped from the stack, then call it.
**
** Return the major token number for the symbol popped.
*/
static int yy_pop_parser_stack(yyParser *pParser)
{
   YYCODETYPE yymajor;
   yyStackEntry *yytos = &pParser.yystack[pParser.yyidx];

   if( pParser.yyidx<0 ) return 0;
   debug(0)
   {
      if( yyTraceFILE && pParser.yyidx>=0 )
      {
         fprintf(yyTraceFILE, "%sPopping %s\n", yyTracePrompt, yyTokenName[yytos.major] );
      }
   }

   yymajor = yytos.major;
   yy_destructor( yymajor, &yytos.minor );
   pParser.yyidx--;
   return yymajor;
}

/* 
** Deallocate and destroy a parser.  Destructors are all called for
** all stack elements before shutting the parser down.
**
** Inputs:
** <ul>
** <li>  A pointer to the parser.  This should be a pointer
**       obtained from ParseAlloc.
** <li>  A pointer to a function used to reclaim memory obtained
**       from malloc.
** </ul>
*/
void FreeParser( yyParser *ptr )
{
   if( ptr == null ) return;
   while( ptr.yyidx >= 0 )
      yy_pop_parser_stack(ptr);
   free(ptr);
}
/*
** Find the appropriate action for a parser given the terminal
** look-ahead token iLookAhead.
**
** If the look-ahead token is YYNOCODE, then check to see if the action is
** independent of the look-ahead.  If it is, return the action, otherwise
** return YY_NO_ACTION.
*/
static int yy_find_shift_action( yyParser *pParser, int iLookAhead )
{
	/+
	int i;
  int stateno = pParser->yystack[pParser->yyidx].stateno;
 
  if( stateno>YY_SHIFT_MAX || (i = yy_shift_ofst[stateno])==YY_SHIFT_USE_DFLT ){
    return yy_default[stateno];
  }
  if( iLookAhead==YYNOCODE ){
    return YY_NO_ACTION;
  }
  i += iLookAhead;
	+/
   int i;
   int stateno = pParser.yystack[pParser.yyidx].stateno;

   if( stateno>YY_SHIFT_MAX || (i = yy_shift_ofst[stateno])==YY_SHIFT_USE_DFLT ){
      return yy_default[stateno];
   }
   if( iLookAhead == YYNOCODE ) {
      return YY_NO_ACTION;
   }
   i += iLookAhead;
   
   
   if( i < 0 || i >= yy_action.length || yy_lookahead[i] != iLookAhead )
   {
	  static if (YYFALLBACK == 1) {
	  int iFallback;            /* Fallback token */
      if( iLookAhead<sizeof(yyFallback)/sizeof(yyFallback[0])
                 && (iFallback = yyFallback[iLookAhead])!=0 )
      {
         debug(0)
         {  if( yyTraceFILE )
            {  fprintf(yyTraceFILE, "%sFALLBACK %s => %s\n",
                     yyTracePrompt, yyTokenName[iLookAhead], yyTokenName[iFallback]);
            }
         }
         return yy_find_shift_action(pParser, iFallback);
      }
       } // yyfallback
      return yy_default[stateno];
   }
   else
   {
      return yy_action[i];
   }
}

/*
 * Find the appropriate action for a parser given the non-terminal
 * look-ahead token iLookAhead.
 *
 * If the look-ahead token is YYNOCODE, then check to see if the action is
 * independent of the look-ahead.  If it is, return the action, otherwise
 * return YY_NO_ACTION.
 */

static int yy_find_reduce_action(
  yyParser *pParser,                /* The parser */
  int iLookAhead )                  /* The look-ahead token */
{
   int i;
   int stateno = pParser.yystack[pParser.yyidx].stateno;

   i = yy_reduce_ofst[stateno];
   if (i == YY_REDUCE_USE_DFLT)
      return yy_default[stateno];

   if( iLookAhead==YYNOCODE )
      return YY_NO_ACTION;

   i += iLookAhead;
   if( i<0 || i>=yy_action.length || yy_lookahead[i]!=iLookAhead )
      return yy_default[stateno];
   else
      return yy_action[i];

}

/*
 *    Perform a shift action.
 */
static void yy_shift(
  yyParser *yypParser,          /* The parser to be shifted */
  int yyNewState,               /* The new state to shift in */
  int yyMajor,                  /* The major token to shift in */
  YYMINORTYPE *yypMinor )       /* Pointer ot the minor token to shift in */
{
   yyStackEntry *yytos;
   yypParser.yyidx++;
   if( yypParser.yyidx >= YYSTACKDEPTH )
   {
      yypParser.yyidx--;

      debug(0)
	  {
	      if( yyTraceFILE )
	      {
	         fprintf(yyTraceFILE,"%sStack Overflow!\n",yyTracePrompt);
	      }
      }

      while( yypParser.yyidx>=0 )
         yy_pop_parser_stack(yypParser);
      /* Here code is inserted which will execute if the parser stack ever overflows */
      return;
   }

   yytos = &yypParser.yystack[yypParser.yyidx];
   yytos.stateno = yyNewState;
   yytos.major = yyMajor;
   yytos.minor = *yypMinor;

   debug(0)
	{
	   if( yyTraceFILE && yypParser.yyidx>0 )
	   {
	      int i;
	      fprintf(yyTraceFILE,"%sShift %d\n",yyTracePrompt,yyNewState);
	      fprintf(yyTraceFILE,"%sStack:",yyTracePrompt);
	      for(i=1; i<=yypParser.yyidx; i++)
	         fprintf(yyTraceFILE," %s",yyTokenName[yypParser.yystack[i].major]);
	      fprintf(yyTraceFILE,"\n");
	   }
	}

}

/* The following table contains information about every rule that
 * is used during the reduce.
 */

struct YYRULEINFO
{
   YYCODETYPE lhs;         /* Symbol on the left-hand side of the rule */
   ubyte nrhs;     /* Number of right-hand side symbols in the rule */
}

YYRULEINFO yyRuleInfo[] =
[
  { 7, 1 },
  { 8, 3 },
  { 8, 3 },
  { 8, 3 },
  { 8, 3 },
  { 8, 1 },
];

//static void yy_accept(yyParser*);  /* Forward Declaration */

/*
 * Perform a reduce action and the shift that must immediately
 * follow the reduce.
 */

static void yy_reduce( yyParser *yypParser, int yyruleno )
{
   int yygoto;                     /* The next state */
   int yyact;                      /* The next action */
   YYMINORTYPE yygotominor;        /* The LHS of the rule reduced */
   yyStackEntry *yymsp;            /* The top of the parser's stack */
   int yysize;                     /* Amount to pop the stack */
   yymsp = &yypParser.yystack[yypParser.yyidx];

   debug(0)
   {
   	if( yyTraceFILE && yyruleno>=0 && yyruleno < yyRuleName.length )
   	{	
      fprintf(yyTraceFILE, "%sReduce [%s].\n", yyTracePrompt, yyRuleName[yyruleno]);
   	}
   }
   /* Silence complaints from purify about yygotominor being uninitialized
  ** in some cases when it is copied into the stack after the following
  ** switch.  yygotominor is uninitialized when a rule reduces that does
  ** not set the value of its left-hand side nonterminal.  Leaving the
  ** value of the nonterminal uninitialized is utterly harmless as long
  ** as the value is never used.  So really the only thing this code
  ** accomplishes is to quieten purify.  
  **
  ** 2007-01-16:  The wireshark project (www.wireshark.org) reports that
  ** without this code, their parser segfaults.  I'm not sure what there
  ** parser is doing to make this happen.  This is the second bug report
  ** from wireshark this week.  Clearly they are stressing Lemon in ways
  ** that it has not been previously stressed...  (SQLite ticket #2172)
  */
   switch( yyruleno )
   {
   	
  /* Beginning here are the reduction cases.  A typical example
  ** follows:
  **   case 0:
  **  #line <lineno> <grammarfile>
  **     { ... }           // User supplied code
  **  #line <lineno> <thisfile>
  **     break;
  */
      case 0:
{ writef("RESULT: ", yymsp[0].minor.yy0,"\n"); }
        break;
      case 1:
{ yygotominor.yy0 = yymsp[-2].minor.yy0-yymsp[0].minor.yy0; }
        break;
      case 2:
{ yygotominor.yy0 = yymsp[-2].minor.yy0+yymsp[0].minor.yy0; }
        break;
      case 3:
{ yygotominor.yy0 = yymsp[-2].minor.yy0*yymsp[0].minor.yy0; }
        break;
      case 4:
{ if(yymsp[0].minor.yy0 != 0){yygotominor.yy0 = yymsp[-2].minor.yy0 / yymsp[0].minor.yy0;}
                                         else {yygotominor.yy0=0;}
                                       }
        break;
      case 5:
{ yygotominor.yy0 = yymsp[0].minor.yy0; }
        break;
      default:
         writef( "bug! \n" );
         break;
   };

   yygoto = yyRuleInfo[yyruleno].lhs;
   yysize = yyRuleInfo[yyruleno].nrhs;
   yypParser.yyidx -= yysize;
   yyact = yy_find_reduce_action(yypParser,yygoto);

   if( yyact < YYNSTATE )
      yy_shift(yypParser,yyact,yygoto,&yygotominor);
   else if( yyact == YYNSTATE + YYNRULE + 1 )
      yy_accept(yypParser);

}

static void yy_parse_failed( yyParser *yypParser )
{

debug(0)
{
	if( yyTraceFILE )
   {
      fprintf(yyTraceFILE,"%sFail!\n",yyTracePrompt);
   }
}

   while( yypParser.yyidx >= 0 )
      yy_pop_parser_stack( yypParser );


}

static void yy_syntax_error( yyParser *yypParser, int yymajor, YYMINORTYPE yyminor )
{
   GTOKENTYPE TOKEN = (yyminor.yy0);


   writef( "Syntax error!\n" );

}

static void yy_accept( yyParser *yypParser )
{

debug(0)
{
	   if( yyTraceFILE )
   {
      fprintf(yyTraceFILE,"%sAccept!\n",yyTracePrompt);
   }
}
    while( yypParser.yyidx >= 0 )
      yy_pop_parser_stack(yypParser);

   /*
    * Here code is inserted which will be executed whenever the parser accepts
    */


}
/* The main parser program.
** The first argument is a pointer to a structure obtained from
** "ParseAlloc" which describes the current state of the parser.
** The second argument is the major token number.  The third is
** the minor token.  The fourth optional argument is whatever the
** user wants (and specified in the grammar) and is available for
** use by the action routines.
**
** Inputs:
** <ul>
** <li> A pointer to the parser (an opaque structure.)
** <li> The major token number.
** <li> The minor token number.
** <li> An option argument of a grammar-specified type.
** </ul>
**
** Outputs:
** None.
*/
void Parse( void *yyp, int yymajor, ParseTOKENTYPE yyminor )
{
   YYMINORTYPE yyminorunion;
   int yyact;                    /* The parser action. */
   int yyendofinput;             /* True if we are at the end of input */
   int yyerrorhit = 0;           /* True if yymajor has invoked an error */
   yyParser *yypParser;          /* The parser */

   /* (re)initialize the parser, if necessary */
   yypParser = cast(yyParser*)yyp;
   if( yypParser.yyidx < 0 )
   {
      if( yymajor==0 ) return;
      yypParser.yyidx = 0;
      yypParser.yyerrcnt = -1;
      yypParser.yystack[0].stateno = 0;
      yypParser.yystack[0].major = 0;
   }
   yyminorunion.yy0 = yyminor;
   yyendofinput = (yymajor==0);

debug(0)
{
	   if( yyTraceFILE )
   {
      fprintf(yyTraceFILE,"%sInput %s\n",yyTracePrompt,yyTokenName[yymajor]);
   }
}

   do
   {
      yyact = yy_find_shift_action(yypParser,yymajor);
      if( yyact < YYNSTATE )
      {
         yy_shift(yypParser,yyact,yymajor,&yyminorunion);
         yypParser.yyerrcnt--;
         if( yyendofinput && yypParser.yyidx>=0 )
         {
            yymajor = 0;
         }
         else
         {
            yymajor = YYNOCODE;
         }
      }
      else if( yyact < YYNSTATE + YYNRULE )
      {
         yy_reduce(yypParser,yyact-YYNSTATE);
      }
      else if( yyact == YY_ERROR_ACTION )
      {
         int yymx;

         debug(0)
		 {
			 if( yyTraceFILE )
	         {
	            fprintf(yyTraceFILE,"%sSyntax Error!\n",yyTracePrompt);
	         }
         }

         static if (YYERRORSYMBOL == 0) {
  /* A syntax error has occurred.
      ** The response to an error depends upon whether or not the
      ** grammar defines an error token "ERROR".  
      **
      ** This is what we do if the grammar does define ERROR:
      **
      **  * Call the %syntax_error function.
      **
      **  * Begin popping the stack until we enter a state where
      **    it is legal to shift the error symbol, then shift
      **    the error symbol.
      **
      **  * Set the error count to three.
      **
      **  * Begin accepting and shifting new tokens.  No new error
      **    processing will occur until three tokens have been
      **    shifted successfully.
      **
      */         	
	         if( yypParser.yyerrcnt < 0 )
	         {
	            yy_syntax_error(yypParser,yymajor,yyminorunion);
	         }
	         yymx = yypParser.yystack[yypParser.yyidx].major;
	         if( yymx==YYERRORSYMBOL || yyerrorhit )
	         {
	         debug(0)
			 {
	            if( yyTraceFILE )
	            {
	               fprintf(yyTraceFILE,"%sDiscard input token %s\n",
	                  yyTracePrompt,yyTokenName[yymajor]);
	            }
			 }
	         yy_destructor(yymajor,&yyminorunion);
	         yymajor = YYNOCODE;
	         }
	         else
	         {
	            while( yypParser.yyidx >= 0 && yymx != YYERRORSYMBOL &&
	               (yyact = yy_find_shift_action(yypParser,YYERRORSYMBOL)) >= YYNSTATE )
	            {
	               yy_pop_parser_stack(yypParser);
	            }
	            if( yypParser.yyidx < 0 || yymajor==0 )
	            {
	               yy_destructor(yymajor,&yyminorunion);
	               yy_parse_failed(yypParser);
	               yymajor = YYNOCODE;
	            }
	            else if( yymx!=YYERRORSYMBOL )
	            {
	               YYMINORTYPE u2;
	               u2.YYERRSYMDT = 0;
	               yy_shift(yypParser,yyact,YYERRORSYMBOL,&u2);
	            }
	         }
	         yypParser.yyerrcnt = 3;
	         yyerrorhit = 1;
		}
        else  /* YYERRORSYMBOL is not defined */
 	  /* This is what we do if the grammar does not define ERROR:
      **
      **  * Report an error message, and throw away the input token.
      **
      **  * If the input token is $, then fail the parse.
      **
      ** As before, subsequent error messages are suppressed until
      ** three input tokens have been successfully shifted.
      */        	
		{
	         if( yypParser.yyerrcnt<=0 )
	         {
	            yy_syntax_error(yypParser,yymajor,yyminorunion);
	         }
	         yypParser.yyerrcnt = 3;
	         yy_destructor(yymajor,&yyminorunion);
	         if( yyendofinput )
	         {
	            yy_parse_failed(yypParser);
	         }
	         yymajor = YYNOCODE;
        }
      }
      else
      {
         yy_accept(yypParser);
         yymajor = YYNOCODE;
      }
   } while( yymajor!=YYNOCODE && yypParser.yyidx >= 0 );
   return;
}


int main( char args[][] )
{
   yyParser* pParser = AllocParser ();
   Parse (pParser, INTEGER, 1);
   Parse (pParser, PLUS, 0);
   Parse (pParser, INTEGER, 2);
   Parse (pParser, 0, 0);
   FreeParser(pParser);
   return 0;
}



/***** Tokens *********/
const int PLUS                           =  1;
const int MINUS                          =  2;
const int DIVIDE                         =  3;
const int TIMES                          =  4;
const int INTEGER                        =  5;
