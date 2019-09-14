#include<stdio.h>
#include <sys/resource.h>

int appgetrusage(struct rusage *);
int appgetdiffrusage(struct rusage *, struct rusage *);

int main() {
    struct rusage begin, end;

    appgetrusage(&begin);

/*
* core of the program goes here 
* where lot of system threads are spawned and joined
*
*/

    appgetrusage(&end);
    appgetdiffrusage(&begin, &end);

    return 0;
}


int appgetrusage(struct rusage *usage){
    int who = RUSAGE_SELF;
    struct timeval start, end;
    getrusage(RUSAGE_SELF, usage);
    return 1;
}


int appgetdiffrusage(struct rusage *oldr, struct rusage *newr){

    printf("\n");    
    printf("user time (ms): %llu\n",1000 * ((newr->ru_utime).tv_sec - (oldr->ru_utime).tv_sec) + 
            ((newr->ru_utime).tv_usec - (oldr->ru_utime).tv_usec) / 1000);

    printf("system time (ms): %ld\n", 1000 * ((newr->ru_stime).tv_sec - (oldr->ru_stime).tv_sec) + 
            ((newr->ru_stime).tv_usec - (oldr->ru_stime).tv_usec) / 1000);         

    printf("voluntary context switches : %ld\n", newr->ru_nvcsw - oldr->ru_nvcsw);
    printf("involuntary context switches : %ld\n", newr->ru_nivcsw - oldr->ru_nivcsw);

    return 1;
}

