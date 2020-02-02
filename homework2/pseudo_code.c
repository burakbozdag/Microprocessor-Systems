//Burak Bozdag
//150170110

void SysTick_Handler(){
	if SysTick -> 1ms
		interrupt
}

void Initialize_Timer(){
	set timer to 0
}

void Start_Timer(){
	start timer
}

void Stop_Timer(){
	stop timer
}

void delayMiliseconds(int n){
	Start_Timer();
	wait for nth interrupt
	Stop_Timer();
}

int main(){
	Initialize_Timer();
	int array[10]={0};
	for(int i=0;i<10;i++){
		array[i]=i;
		int waitTime=(i+1)*100;
		delayMiliseconds(waitTime);
	}
	while(1);
}
