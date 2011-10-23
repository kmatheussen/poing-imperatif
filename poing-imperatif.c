#include "lex.yy.c"
#include "sourcereader.hh"

char faustargs[10000];

void init_faustargs(void){
  sprintf(faustargs," ");
}

void add_faustarg(char *arg){
  char *old=strdup(faustargs);
  sprintf(faustargs,"%s %s",old,arg);
  free(old);
}


int main(int argc, char**argv){
  const char *infile=NULL;
  char outfile[1000];
  char       *which_faust=(char*)"faust";
  bool keep = false;
  bool printversion = false;
  bool runfaust = true;
  bool fausthelp = false;

  const char *help=
    "%s [--version] [--keep] [--faustexe s] [--dontrunfaust] <faustargs> filename\n";

  int i;
  for(i=1;i<argc;i++){
    char *arg=argv[i];
    if(!strcmp(arg,"--faustexe")){
      which_faust = argv[i+1];
      i++;
    }else if(!strcmp(arg,"--help")){
      printf(help,argv[0]);
      exit(0);
    }else if(!strcmp(arg,"-h")){
      fausthelp=true;
    }else if(!strcmp(arg,"--version")){
      printversion=true;
    }else if(!strcmp(arg,"--keep")){
      keep=true;
    }else if(!strcmp(arg,"--dontrunfaust")){
      runfaust=false;
      keep=true;
    } else if(i==argc-1)
      infile=argv[argc-1];
    else
      add_faustarg(arg);
    //printf("argv: %s\n",arg);
  }

  if(printversion==true){
      char temp[1000];
      printf("impfaust %s\n",VERSION);
      sprintf(temp,"%s -v",which_faust);
      system(temp);
      exit(0);
  }
  if(fausthelp==true){
    char temp[1000];
    sprintf(temp,"%s -h",which_faust);
    return system(temp);
  }

  if(infile==NULL){
    printf(help,argv[0]);
    exit(0);
  }

  sprintf(outfile,"%s_generated.dsp",infile);
  //printf("in: %s %s\n",infile,outfile);

  //exit(0);

  yyin = fopen( infile, "r" );

  if(yyin==NULL){
    fprintf(stderr,"Unable to open \"%s\"\n",infile);
    exit(-1);
  }

  char *tempfile = (char*)"/tmp/impfaust_lexed.lsp";

  FILE *out=fopen(tempfile,"w");
  if(out==NULL){
    fprintf(stderr,"Unable to open \"%s\"\n",tempfile);
  }

  //fprintf(out,"(DEFUN GET-LEXLIST () (LIST\n");
  fprintf(out,"(\n");
  //fprintf(out,"(define get-lexlist -> [\n");

  int r;
  do{
    r=yylex();
    //printf("%d %d %d\t%d:\t%s\n",r,r==DEF,r==IDENT,yylineno,yytext);
    if(r==0)
      break;
    if(yytext[0]=='"')
      fprintf(out,"%d string %s\n",yylineno,yytext);
    else if(r==IDENT && isupper(yytext[0]))
      fprintf(out,"%d \"c___%s\"\n",yylineno,yytext); // Qi's pattern matcher uses first capitol character in a symbol to identify wheter it is a variable.
    else
      fprintf(out,"%d \"%s\"\n",yylineno,yytext);
  }while(true);

  fprintf(out,")\n");

  fclose(out);

  int ret=0;

  {
    char command[5000];
    sprintf(command,"rm -f %s && %s-compiler %s %s >/dev/null",outfile,argv[0], tempfile, outfile);    
    ret = system(command);
    //unlink(tempfile);

    if(ret==0 && runfaust==true){
      sprintf(command,"%s %s %s",which_faust,faustargs,outfile);;
      ret = system(command);
    }

    if(keep==false)
      unlink(outfile);
  }

  return ret;
}
