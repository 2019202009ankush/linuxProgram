void printlog()
{
                static const char *f =hispath;
                FILE *file = fopen ( f, "r" );
                if ( file != NULL )
                {
                    char line_by_line [ 1024 ];
                    int i=1;
                    while ( fgets ( line_by_line, sizeof line_by_line, file ) != NULL )
                    {
                        printf("%02d. ",i);
                        fputs ( line_by_line, stdout );
                        i++;
                    }
                }
                fclose ( file );
}
void printenv()
{
                    t=strtok(str,"$");
                    t=strtok(NULL,"$");
                    cout<<getenv(t);
}
void exitfromshell()
{
                printf("bye..\n");
                exit(0);
}
