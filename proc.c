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
int main(int argc, char* argv[],char* ev[])
{
	int pid = 0;
	DIR* direc = opendir("/proc");
	struct dirent *dir;
	int fp,fq;
        if(argc == 1)
        {
	 printf("As you donot enter any process id in the command line  arugement we are showing all process details\n");
	 printf("----------------------------------------------------------------------------------------------------\n");
	 printf("Filename of executable\t\t\tstate\t\t\tparent process id\t\t\tsession id\n");
         for(;;)
         {
		dir=readdir(direc);
		if(dir==NULL)
			break;
		else{
	        	if((atoi(dir->d_name)) != 0)
	         	{	
            			char arst[100][1000]; 
    	          		int i,j,len,c=0;
		           	char buf[100000];
		        	char p[100] = "/proc/";
		        	strcat(p,dir->d_name);
		        	strcat(p,"/stat");
		        	fp = open(p,O_RDONLY);
		        	while((len=read(fp,&buf,100000))>0)
		        	{
 			         	j=0; c=0;
			        	for(i=0;i<=(strlen(buf));i++)
    			        	{
        		                	if(buf[i]==' '||buf[i]=='\0')
        		                 	{
            			                	arst[c][j]='\0';
           			                 	c++;
            			                 	j=0;    
        		                 	}
        		                 	else
       			                	{
            			                	arst[c][j]=buf[i];
            			                  	j++;
        		                   	}
    			         	}
			         	printf("%-25s\t\t %-20s\t\t %-20s\t\t %-20s\n",arst[1],arst[2],arst[3],arst[5]);
		         	}
				char pp[100] = "/proc/";
                                strcat(pp,dir->d_name);
                                strcat(pp,"/status");
                                fp = open(pp,O_RDONLY);
                               /* while((len=read(fp,&buf,100000))>0)
                                {
                                        j=0; c=0;
                                        for(i=0;i<=(strlen(buf));i++)
                                        {
                                                if(buf[i]==' '||buf[i]=='\0')
                                                {
                                                        arst[c][j]='\0';
                                                        c++;
                                                        j=0;
                                                }
                                                else
                                                {
                                                        arst[c][j]=buf[i];
                                                        j++;
                                                }
                                        }
                                       /* printf("%-25s\t\t %-20s\t\t %-20s\t\t %-20s\n",arst[1],arst[2],arst[3],arst[5]);*/
				/*	for(i=0;i<=(strlen(buf));i++)
						printf("%s chec*/
			      /*	int fd_count;
                                char buff[64];
                                struct dirent *dp;

                                 snprintf(buff, 64, "/proc/%i/fd/",(atoi(dir->d_name)));

                                fd_count = 0;
                                DIR *dir = opendir(buff);
                               while ((dp = readdir(dir)) != NULL) 
                                       fd_count++;
                                  closedir(dir);*/
			     // printf("   %d\n",fd_count);

	        	}
              }
        }
       }
       if(argc== 2)
       {
      printf("As you have enter %s th process id in the command line  arugement we are showing only %s th process details\n",argv[1],argv[1]);
         printf("----------------------------------------------------------------------------------------------------\n");
	 printf("Filename of executable\t\t\tstate\t\t\tparent process id\t\t\tsession id\n");
         int pid = atoi(argv[1]);
	 for(;;)
         {
                dir=readdir(direc);
                if(dir==NULL)
                        break;
                else{
			if(atoi(dir->d_name)==pid){
                                char arst[100][100];
                                int i,j,len,c=0;
                                char buf[100000];
                                char p[100] = "/proc/";
                                strcat(p,dir->d_name);
                                strcat(p,"/stat");
                                fp = open(p,O_RDONLY);
                                while((len=read(fp,&buf,100000))>0)
                                {
                                        j=0; c=0;
                                        for(i=0;i<=(strlen(buf));i++)
                                        {
                                                if(buf[i]==' '||buf[i]=='\0')
                                                {
                                                        arst[c][j]='\0';
                                                        c++;
                                                        j=0;
                                                }
                                                else
                                                {
                                                        arst[c][j]=buf[i];
                                                        j++;
                                                }
                                        }
                                        printf("%-25s\t\t %-20s\t\t %-20s\t\t %-20s\n",arst[1],arst[2],arst[3],arst[5]);
                                }
				 
                        }
              }
        
	
       }
  }
      printf("-------------------------------------------------------------------------------------------------------------------\n");
      printf("Now printing environment variables details\n");
      printf("-------------------------------------------------------------------------------------------------------------------\n");
	for(int i=0;ev[i] != NULL;i++)
		printf("%s\n",ev[i]);

    printf("-------------------------------------------------------------------------------------------------------------------\n");
      printf("Now printing total context switch\n");
      printf("-------------------------------------------------------------------------------------------------------------------\n");
	char pp[100] = "/proc";
                             
        strcat(pp,"/stat");
        fp = open(pp,O_RDONLY);
	int j,c,i,n,len;
        char arst[100][100];
        char buf[100000];
        while((len=read(fp,&buf,100000))>0)
        {
                                        j=0; c=0;
                                        for(i=0;i<=(strlen(buf));i++)
                                        {
                                                if(buf[i]==' '||buf[i]=='\n'||buf[i]=='\0')
                                                {
                                                        arst[c][j]='\0';
                                                        c++;
                                                        j=0;
                                                }
                                                else
                                                {
                                                        arst[c][j]=buf[i];
                                                        j++;
                                                }
                                        }
                                       /* printf("%-25s\t\t %-20s\t\t %-20s\t\t %-20s\n",arst[1],arst[2],arst[3],arst[5]);*/
                                       /*   for(i=0;i<=(strlen(buf));i++)
						  printf("%d-%s  ",i,arst[i]);*/
					for(i=50;i<=64;i++)
                                            printf("%c",arst[1014][i]);
                                         
					//	  printf("%s-\n",arst[39]+25);*/

      printf("-------------------------------------------------------------------------------------------------------------------\n");
      printf("Now printing total running and blocked process\n");
      printf("-------------------------------------------------------------------------------------------------------------------\n");
       for(i=96;i<=127;i++)
	      
                    printf("%c",arst[1014][i]);
           }
					  closedir(direc);

}

