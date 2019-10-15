public aspect TraceAspectBrink{
	
	pointcut classToTrace(): within (*App);
	
	pointcut methodToTrace(): classToTrace() && execution(String *App.getName());
	
	before(): methodToTrace(){
		System.out.println("Method Signature: " + thisJoinPointStaticPart.getSignature());
		System.out.println("Method Line Number: "+thisJoinPointStaticPart.getSourceLocation().getLine());
	}
	after(): methodToTrace(){
		System.out.println("Method File Name: "+thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
}