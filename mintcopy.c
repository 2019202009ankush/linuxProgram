#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <ctype.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include<sys/resource.h>
int main(int argc, char* argv[])
{
         char *d;
        d=argv[argc-1];
	DIR* direc;
	for(int i=1;i<=argc-2;i++)
	{
	  char * s=argv[i];
	  char d1[100];
	  char s1[100];
	  char d2[100];
	  strcpy(d1,d);
	  strcpy(d2,d);
	  strcpy(s1,s);
            direc = opendir(s);

           struct dirent *dir;
           
           for(;;)
           {   
		int fp,fq;
                dir=readdir(direc);
                if(dir==NULL)
                        break;
		//printf("%s",dir->d_name);
	
			        if(dir->d_name=="."||dir->d_name=="..")
				 continue;
                                strcat(s1,"/");

				strcat(s1,dir->d_name);
				printf("%s\n",s);
				strcat(d1,"/");
				strcat(d1,dir->d_name);
				printf("%s\n",d1);
				ssize_t bytesRead,bytesWritten;
                                char buffer[100000];
                                mode_t mode=S_IRUSR|S_IWUSR|S_IXUSR|S_IXUSR|S_IRGRP|S_IROTH|S_IXOTH;

                                fp=open(s,O_RDONLY);
                                if(fp==-1){
                                    perror("The source file cannot be opened in rw");
                                 
                                }
                                fq=open(d1,O_WRONLY|O_EXCL|O_CREAT,mode);
                               if(fq==-1)
                               {
                                perror("File could not be opened");
                               
                               }
                               while((bytesRead=read(fp,&buffer,100000))>0){
                                  bytesWritten=write(fq,&buffer,(ssize_t)bytesRead);
                                 }
                               close(fp);
                               close(fq);
			       strcpy(s1,s);
			       strcpy(d1,d);
                 
	   }
	   closedir(direc);
        
	
	}
}
