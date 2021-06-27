#include <jni.h>
#include "br_com_camilotk_hellojni_HelloWorldJNI.h"
#include <iostream>

extern "C" {
    JNIEXPORT jstring JNICALL Java_br_com_camilotk_hellojni_HelloWorldJNI_sayHello (JNIEnv* env, jobject thisObject) {
        std::string hello = "Hello from C++ !!";
        // std::cout << hello << std::endl;
        return env->NewStringUTF(hello.c_str());
    }
}