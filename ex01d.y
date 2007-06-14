/*
   Copyright (GPL) 2004 mchirico@users.sourceforge.net or mchirico@comcast.net

   Simple lemon parser  example.

   $ ./lemon example1.y

   The above statement will create example1.c.

   The command below  adds  main and the
   necessary "Parse" calls to the
   end of this example1.c.

   $ cat <<EOF >>example1.c
   int main()
   {
      void* pParser = ParseAlloc (malloc);
      Parse (pParser, INTEGER, 1);
      Parse (pParser, PLUS, 0);
      Parse (pParser, INTEGER, 2);
      Parse (pParser, 0, 0);
      ParseFree(pParser, free );
   }
   EOF

   int main( char args[][] )
   {
      yyParser* pParser = AllocParser ();
      Parse (pParser,5, 1);
      Parse (pParser,1, 0);
      Parse (pParser,5, 2);
      Parse (pParser, 0, 0);
      FreeParser(pParser);
      return 0;
   }

   $ g++ -o ex1 example1.c
   $ ./ex1

   See the Makefile, as most all of this is done automatically.

   Downloads:
   http://prdownloads.sourceforge.net/souptonuts/lemon_examples.tar.gz?download

 */

%token_type {int}

%left PLUS MINUS.
%left DIVIDE TIMES.

%include
{
import std.stdio;
import std.c.stdlib;
}

%syntax_error
{
   writef( "Syntax error!\n" );
}

program ::= expr(A).                   { writef("RESULT: ", A,"\n"); }
expr(A) ::= expr(B) MINUS  expr(C).    { A = B-C; }
expr(A) ::= expr(B) PLUS   expr(C).    { A = B+C; }
expr(A) ::= expr(B) TIMES  expr(C).    { A = B*C; }
expr(A) ::= expr(B) DIVIDE expr(C).    { if(C != 0){A = B / C;}
                                         else {A=0;}
                                       }
expr(A) ::= INTEGER(B).                { A = B; }

%code
{
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
}

/**/