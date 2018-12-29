package com.javassist;

import com.google.common.collect.Sets;
import javassist.util.proxy.MethodFilter;
import javassist.util.proxy.MethodHandler;
import javassist.util.proxy.ProxyFactory;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * Created by IntelliJ IDEA.
 * User: win10
 * Date: 2018/12/22
 * Time: 16:54
 * Desc: classloader�����ñȽϲ���
 */
public class ProxyFactoryTest {

    private final static Set<String> METHOD_NAMES = Sets.newHashSet("callTarget","getName");

    public static void main( String args[] ) throws Exception{
        ProxyFactory factory = new MyProxyFactory();
        factory.writeDirectory = System.getProperty("user.dir") + File.separator + "jassist_generate";

        factory.setSuperclass(Target.class);
        factory.setFilter(new MethodFilter() {
            @Override
            public boolean isHandled(Method m) {
                String name = m.getName();
                if (METHOD_NAMES.contains(name)) { //ֻ��callTarget���ɴ�������������������д���̳и���ʵ��
                    return true;
                }
                return false;
            }
        });
        Target target = (Target)factory.create(null, null, new MethodHandler() {
            @Override
            public Object invoke(Object self, Method thisMethod, Method proceed, Object[] args) throws Throwable {
                System.out.println("MethodHandler is called " + thisMethod.getName());
                return proceed.invoke(self,args);//invoke super, ��cglib��ʵ�ַ�ʽһ���������ɵ�proxy����������һ������ķ��������ø���
            }
        });//�����bridge method
        /**
         * clazz.getDeclaredMethods()
         * computeSignature: (filter the target methods)
         * if (!Modifier.isFinal(mod) && !Modifier.isStatic(mod)
         *      && isVisible(mod, basename, m) && (filter == null || filter.isHandled(m))) {
         *      setBit(signature, idx);
         * }
         * isVisible is true: public, protect, the same package
         * */
        target.setName("target");
        System.out.println(target.callTarget());
        System.out.println(target.getName());


        System.out.println(target.getClass().getName());
        Field methods = target.getClass().getDeclaredField("_methods_");
        methods.setAccessible(true);
        Method[] methodArr = (Method[])methods.get(target);
        //method �� proceed method��index С1�����Թ��˳�method��
        List<Method> methodList = Arrays.stream(methodArr).filter(Objects::nonNull).collect(Collectors.toList());
        IntStream.range(0, methodList.size())
                .filter(i -> i % 2 == 0)
                .mapToObj(methodList::get)
                .forEach(method -> System.out.println(method.getName()));
    }

    private static class MyProxyFactory extends ProxyFactory{

        @Override
        protected ClassLoader getClassLoader() {
            return new MyClassLoader(ClassLoader.getSystemClassLoader());
        }
    }
}