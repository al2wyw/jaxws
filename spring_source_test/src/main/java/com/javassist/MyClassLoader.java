package com.javassist;

import java.net.URL;
import java.net.URLClassLoader;

/**
 * Created with IntelliJ IDEA.
 * User: johnny.ly
 * Date: 2017/1/15
 * Time: 14:07
 * Desc:
 */
public class MyClassLoader extends URLClassLoader {

    public MyClassLoader(ClassLoader parent) {
        super(new URL[0], parent);
    }
}
