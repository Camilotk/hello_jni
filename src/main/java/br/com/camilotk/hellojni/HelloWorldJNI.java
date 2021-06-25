package br.com.camilotk.hellojni;

public class HelloWorldJNI {

    static {
        System.loadLibrary("native");
    }
    
    public static void main(String[] args) {
        System.out.println( new HelloWorldJNI().sayHello());
    }

    private native String sayHello();
}
